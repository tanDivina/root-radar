import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:root_radar_client/root_radar_client.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import '../main.dart';
import 'butler_screen.dart';
import 'add_plant_sheet.dart';
import 'plant_list_screen.dart';

class GardenMapScreen extends StatefulWidget {
  final bool showHeader;
  const GardenMapScreen({super.key, this.showHeader = false});

  @override
  State<GardenMapScreen> createState() => _GardenMapScreenState();
}

class _GardenMapScreenState extends State<GardenMapScreen> {
  GoogleMapController? _mapController;
  List<Plant> _plants = [];
  Set<Marker> _markers = {};
  LatLng _currentPosition = const LatLng(9.22475, -82.25749); // Default: Finca Montezuma
  bool _isLoading = true;
  bool _isPlacingPlant = false;

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
                    snippet: _getMarkerSnippet(p),
                  ),
                ))
            .toSet();
        _isLoading = false;
        
        // Auto-center on plants if available
        if (plants.isNotEmpty) {
           final first = plants.firstWhere((p) => p.latitude != null && p.longitude != null);
           if (first.latitude != null && _mapController != null) {
             _mapController!.animateCamera(
               CameraUpdate.newLatLng(LatLng(first.latitude!, first.longitude!)),
             );
           }
        }
      });
    } catch (e) {
      setState(() => _isLoading = false);
      debugPrint('Error loading plants: $e');
    }
  }

  String _getMarkerSnippet(Plant p) {
    String snippet = '${p.category ?? "Plant"} - ${p.variety ?? ""}';
    if (p.daysToHarvest != null) {
      final daysSincePlanted = DateTime.now().difference(p.plantedAt).inDays;
      final daysLeft = p.daysToHarvest! - daysSincePlanted;
      if (daysLeft <= 0) {
        snippet += '\nReady for Harvest!';
      } else {
        snippet += '\nDays to Harvest: $daysLeft';
      }
    }
    return snippet;
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
    debugPrint('MAP_DEBUG: Long press detected at ${position.latitude}, ${position.longitude}');
    
    // Provide immediate visual feedback that the press was registered
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Opening plant registry...'),
        duration: Duration(milliseconds: 500),
      ),
    );

    // Force a small delay to ensure any active map animations settle
    await Future.delayed(const Duration(milliseconds: 200));
    
    if (!mounted) return;

    try {
      final result = await showModalBottomSheet<Map<String, dynamic>>(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) => const AddPlantSheet(),
      );

      if (result != null && result['name'] != null) {
        debugPrint('MAP_DEBUG: Saving plant at $position');
        _savePlant(
          result['name']!,
          result['variety'] ?? '',
          result['notes'] ?? '',
          int.tryParse(result['daysToHarvest'] ?? '60') ?? 60,
          result['category'],
          result['imagePath'],
          position,
        );
      } else {
        debugPrint('MAP_DEBUG: AddPlantSheet cancelled or missing name');
      }
    } catch (e) {
      debugPrint('MAP_DEBUG_ERROR: Failed to show AddPlantSheet: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: Could not open plant registry: $e')),
        );
      }
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

  Future<void> _confirmPlantLocation() async {
    if (_mapController == null) return;
    
    // Get the visible region and calculate the center
    final visibleRegion = await _mapController!.getVisibleRegion();
    final centerLat = (visibleRegion.northeast.latitude + visibleRegion.southwest.latitude) / 2;
    final centerLng = (visibleRegion.northeast.longitude + visibleRegion.southwest.longitude) / 2;
    final position = LatLng(centerLat, centerLng);
    
    // Exit place mode
    setState(() => _isPlacingPlant = false);
    
    if (!mounted) return;

    try {
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
    } catch (e) {
      debugPrint('FAB_ADD_ERROR: Failed to show AddPlantSheet: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: Could not open plant registry: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final mapWidget = Stack(
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
        // Help text banner
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
            child: Text(
              _isPlacingPlant
                  ? 'Move the map to position the crosshair, then tap Confirm'
                  : 'Tap the "+" button to add a new plant',
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        // Crosshair overlay for place mode
        if (_isPlacingPlant)
          Center(
            child: IgnorePointer(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 2,
                    height: 30,
                    color: Colors.green.shade800,
                  ),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.green.shade800, width: 3),
                    ),
                    child: Icon(Icons.eco, color: Colors.green.shade800, size: 30),
                  ),
                  Container(
                    width: 2,
                    height: 30,
                    color: Colors.green.shade800,
                  ),
                ],
              ),
            ),
          ),
        // Confirm/Cancel buttons for place mode
        if (_isPlacingPlant)
          Positioned(
            bottom: 32,
            left: 16,
            right: 16,
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => setState(() => _isPlacingPlant = false),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade700,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text('Cancel'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  flex: 2,
                  child: ElevatedButton.icon(
                    onPressed: _confirmPlantLocation,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green.shade800,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    icon: const Icon(Icons.check),
                    label: const Text('Confirm Location'),
                  ),
                ),
              ],
            ),
          ),
      ],
    );

    if (widget.showHeader) {
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
        body: mapWidget,
        floatingActionButton: _isPlacingPlant
            ? null
            : FloatingActionButton.extended(
                onPressed: () => setState(() => _isPlacingPlant = true),
                backgroundColor: Colors.green.shade800,
                foregroundColor: Colors.white,
                icon: const Icon(Icons.add_location_alt),
                label: const Text('Add Plant'),
              ),
      );
    }

    return Stack(
      children: [
        mapWidget,
        if (!_isPlacingPlant)
          Positioned(
            bottom: 16,
            right: 16,
            child: FloatingActionButton.extended(
              onPressed: () => setState(() => _isPlacingPlant = true),
              backgroundColor: Colors.green.shade800,
              foregroundColor: Colors.white,
              icon: const Icon(Icons.add_location_alt),
              label: const Text('Add Plant'),
            ),
          ),
      ],
    );
  }
}
