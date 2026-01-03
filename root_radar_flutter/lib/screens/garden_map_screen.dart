import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:root_radar_client/root_radar_client.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io' as io;
import '../main.dart';
import 'radar_screen.dart';

class GardenMapScreen extends StatefulWidget {
  const GardenMapScreen({super.key});

  @override
  State<GardenMapScreen> createState() => _GardenMapScreenState();
}

class _GardenMapScreenState extends State<GardenMapScreen> {
  GoogleMapController? _mapController;
  List<Plant> _plants = [];
  Set<Marker> _markers = {};
  LatLng _currentPosition = const LatLng(37.7749, -122.4194); // Default: SF
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _initMap();
  }

  Future<void> _initMap() async {
    await _determinePosition();
    await _loadPlants();
  }

  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return;
    }

    try {
      final position = await Geolocator.getCurrentPosition();
      setState(() {
        _currentPosition = LatLng(position.latitude, position.longitude);
      });
      _mapController?.animateCamera(
        CameraUpdate.newLatLng(_currentPosition),
      );
    } catch (e) {
      debugPrint('Error getting location: $e');
    }
  }

  Future<void> _loadPlants() async {
    setState(() => _isLoading = true);
    try {
      final plants = await client.garden.getAllPlants();
      setState(() {
        _plants = plants;
        _markers = plants
            .where((p) => p.latitude != null && p.longitude != null)
            .map((p) => Marker(
                  markerId: MarkerId(p.id?.toString() ?? p.anchorId),
                  position: LatLng(p.latitude!, p.longitude!),
                  icon: _getMarkerColor(p.category),
                  infoWindow: InfoWindow(
                    title: p.name,
                    snippet: '${p.category ?? "Plant"} - ${p.variety ?? ""}',
                  ),
                ))
            .toSet();
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
      debugPrint('Error loading plants: $e');
    }
  }

  BitmapDescriptor _getMarkerColor(String? category) {
    switch (category) {
      case 'Vegetable':
        return BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen);
      case 'Fruit':
        return BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed);
      case 'Flower':
        return BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow);
      case 'Herb':
        return BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan);
      default:
        return BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet);
    }
  }

  Future<String?> _uploadImage(String path) async {
    try {
      final fileName = 'plant_${DateTime.now().millisecondsSinceEpoch}.jpg';
      final uploadDescription = await client.garden.getUploadDescription(fileName);
      if (uploadDescription != null) {
        final uploader = FileUploader(uploadDescription);
        
        final xFile = XFile(path);
        final bytes = await xFile.readAsBytes();
        await uploader.upload(Stream.value(bytes));
        
        final success = await client.garden.verifyUpload(fileName);
        if (success) {
          return fileName;
        }
      }
    } catch (e) {
      debugPrint('Error uploading image: $e');
    }
    return null;
  }

  void _onMapLongPress(LatLng position) async {
    final result = await showModalBottomSheet<Map<String, dynamic>>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const AddPlantSheet(),
    );

    if (result != null && result['name'] != null) {
      _savePlant(
        result['name']!,
        result['variety'] ?? '',
        result['notes'] ?? '',
        int.tryParse(result['daysToHarvest'] ?? '60') ?? 60,
        result['category'],
        result['imagePath'],
        position,
      );
    }
  }

  Future<void> _savePlant(
    String name,
    String variety,
    String notes,
    int daysToHarvest,
    String? category,
    String? imagePath,
    LatLng position,
  ) async {
    String? imageUrl;
    if (imagePath != null) {
      imageUrl = await _uploadImage(imagePath);
    }

    final plant = Plant(
      name: name,
      variety: variety,
      plantedAt: DateTime.now(),
      daysToHarvest: daysToHarvest,
      anchorId: 'map_entry_${DateTime.now().millisecondsSinceEpoch}',
      latitude: position.latitude,
      longitude: position.longitude,
      notes: notes,
      category: category,
      imageUrl: imageUrl,
    );

    try {
      await client.garden.savePlant(plant);
      _loadPlants();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('$name added to the map!')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to save plant: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Garden Map', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.green.shade800,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _loadPlants,
          ),
          IconButton(
            icon: const Icon(Icons.my_location),
            onPressed: _determinePosition,
          ),
        ],
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: _currentPosition,
              zoom: 18,
            ),
            onMapCreated: (controller) => _mapController = controller,
            markers: _markers,
            onLongPress: _onMapLongPress,
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            mapType: MapType.hybrid,
          ),
          if (_isLoading)
            const Center(child: CircularProgressIndicator()),
          Positioned(
            top: 16,
            left: 16,
            right: 16,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                'Long press on the map to pin a new plant',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
