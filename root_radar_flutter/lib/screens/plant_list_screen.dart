import 'package:flutter/material.dart';
import 'package:root_radar_client/root_radar_client.dart';
import 'package:intl/intl.dart';
import '../main.dart';
import 'radar_screen.dart'; // To reuse the AddPlantSheet

class PlantListScreen extends StatefulWidget {
  const PlantListScreen({super.key});

  @override
  State<PlantListScreen> createState() => _PlantListScreenState();
}

class _PlantListScreenState extends State<PlantListScreen> {
  List<Plant> plants = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadPlants();
  }

  Future<void> _loadPlants() async {
    setState(() => isLoading = true);
    try {
      final loadedPlants = await client.garden.getAllPlants();
      setState(() {
        plants = loadedPlants;
        isLoading = false;
      });
    } catch (e) {
      setState(() => isLoading = false);
      debugPrint('Error loading plants: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Garden', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.green.shade800,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _loadPlants,
          ),
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : plants.isEmpty
              ? _buildEmptyState()
              : _buildPlantList(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _onAddPlantPressed,
        label: const Text('Add Plant'),
        icon: const Icon(Icons.add),
        backgroundColor: Colors.green.shade800,
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.eco_outlined, size: 80, color: Colors.green.shade200),
          const SizedBox(height: 16),
          Text(
            'Your garden is empty',
            style: TextStyle(fontSize: 20, color: Colors.grey.shade600, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text('Tap "Add Plant" to start tracking!'),
        ],
      ),
    );
  }

  Widget _buildPlantList() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: plants.length,
      itemBuilder: (context, index) {
        final plant = plants[index];
        return Card(
          elevation: 4,
          margin: const EdgeInsets.bottom(16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: ListTile(
            contentPadding: const EdgeInsets.all(16),
            leading: CircleAvatar(
              backgroundColor: Colors.green.shade100,
              child: Icon(Icons.eco, color: Colors.green.shade800),
            ),
            title: Text(
              plant.name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (plant.variety != null && plant.variety!.isNotEmpty)
                  Text('Variety: ${plant.variety}'),
                Text('Planted: ${DateFormat('MMM dd, yyyy').format(plant.plantedAt)}'),
                if (plant.notes != null && plant.notes!.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.top(4.0),
                    child: Text(
                      plant.notes!,
                      style: TextStyle(fontStyle: FontStyle.italic, color: Colors.grey.shade600),
                    ),
                  ),
              ],
            ),
            trailing: IconButton(
              icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
              onPressed: () => _deletePlant(plant.id!),
            ),
          ),
        );
      },
    );
  }

  Future<void> _onAddPlantPressed() async {
    final result = await showModalBottomSheet<Map<String, String>>(
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
      );
    }
  }

  Future<void> _savePlant(String name, String variety, String notes, int daysToHarvest) async {
    final plant = Plant(
      name: name,
      variety: variety,
      plantedAt: DateTime.now(),
      daysToHarvest: daysToHarvest,
      anchorId: 'list_entry_${DateTime.now().millisecondsSinceEpoch}',
      notes: notes,
    );

    try {
      await client.garden.savePlant(plant);
      _loadPlants();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to save plant: $e')),
      );
    }
  }

  Future<void> _deletePlant(int id) async {
    try {
      await client.garden.deletePlant(id);
      _loadPlants();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to delete plant: $e')),
      );
    }
  }
}
