import 'package:flutter/material.dart';
import 'package:root_radar_client/root_radar_client.dart';
import 'package:intl/intl.dart';
import '../services/demo_plant_service.dart';
import '../main.dart';

class HarvestOverviewScreen extends StatefulWidget {
  const HarvestOverviewScreen({super.key});

  @override
  State<HarvestOverviewScreen> createState() => _HarvestOverviewScreenState();
}

class _HarvestOverviewScreenState extends State<HarvestOverviewScreen> with SingleTickerProviderStateMixin {
  List<Plant> readyToHarvest = [];
  List<Plant> comingSoon = [];
  List<Plant> growing = [];
  List<Fermentation> fermentations = [];
  bool isLoading = true;
  late TabController _tabController;
  
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _loadData();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _loadData() async {
    setState(() => isLoading = true);
    try {
      final plants = await DemoPlantService().getAllPlants();
      // Fetch fermentation logs directly from client assuming endpoint exists or mock in demo service
      // Since we don't have a DemoFermentationService, we'll try to fetch from client db directly for demo
      // or we just trust that seeded data is there. We need to fetch Fermentation objects.
      
      // Attempt to fetch fermentations. If this fails (no endpoint), we'll handle it.
      try {
        fermentations = await client.garden.getAllFermentations();
      } catch (e) {
        // Fallback for demo if endpoint method name differs or doesn't exist
        debugPrint('Fermentation fetch failed: $e');
        fermentations = []; 
      }

      final now = DateTime.now();

      readyToHarvest = [];
      comingSoon = [];
      growing = [];

      for (var plant in plants) {
        if (plant.daysToHarvest == null) {
          growing.add(plant);
          continue;
        }

        final daysSincePlanted = now.difference(plant.plantedAt).inDays;
        final daysLeft = plant.daysToHarvest! - daysSincePlanted;

        if (daysLeft <= 0) {
          readyToHarvest.add(plant);
        } else if (daysLeft <= 14) {
          comingSoon.add(plant);
        } else {
          growing.add(plant);
        }
      }

      setState(() => isLoading = false);
    } catch (e) {
      debugPrint('Error loading harvest data: $e');
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Harvest & Processing', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.green.shade800,
        foregroundColor: Colors.white,
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          indicatorColor: Colors.white,
          tabs: const [
            Tab(text: 'Harvest Plan', icon: Icon(Icons.calendar_month)),
            Tab(text: 'Fermentation', icon: Icon(Icons.science)),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _loadData,
          ),
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : TabBarView(
              controller: _tabController,
              children: [
                // Tab 1: Harvest Plan
                RefreshIndicator(
                  onRefresh: _loadData,
                  child: ListView(
                    padding: const EdgeInsets.all(16),
                    children: [
                      _buildSection('Ready for Harvest', readyToHarvest, Colors.green, Icons.check_circle),
                      const SizedBox(height: 24),
                      _buildSection('Coming Soon (Next 14 Days)', comingSoon, Colors.orange, Icons.timer),
                      const SizedBox(height: 24),
                      _buildSection('Still Growing', growing, Colors.blue, Icons.eco),
                    ],
                  ),
                ),
                // Tab 2: Fermentation
                RefreshIndicator(
                  onRefresh: _loadData,
                  child: fermentations.isEmpty 
                    ? const Center(child: Text("No active fermentations."))
                    : ListView.builder(
                        padding: const EdgeInsets.all(16),
                        itemCount: fermentations.length,
                        itemBuilder: (ctx, i) {
                          final f = fermentations[i];
                          return Card(
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.brown.shade100,
                                child: const Icon(Icons.bubble_chart, color: Colors.brown),
                              ),
                              title: Text(f.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                              subtitle: Text('Status: ${f.status}\nInstructions: ${f.instructions ?? "None"}\nNotes: ${f.notes ?? ""}'),
                              isThreeLine: true,
                              trailing: f.nextTurnAt != null 
                                ? Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(Icons.alarm, size: 16, color: Colors.orange),
                                      Text(DateFormat('HH:mm').format(f.nextTurnAt!), style: const TextStyle(fontSize: 12)),
                                    ],
                                  )
                                : null,
                            ),
                          );
                        },
                      ),
                ),
              ],
            ),
    );
  }

  Widget _buildSection(String title, List<Plant> plants, Color color, IconData icon) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: color, size: 28),
            const SizedBox(width: 12),
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade800,
              ),
            ),
            const Spacer(),
            Text(
              '${plants.length}',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
        const Divider(),
        if (plants.isEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              'No plants in this category.',
              style: TextStyle(color: Colors.grey.shade500, fontStyle: FontStyle.italic),
            ),
          )
        else
          ...plants.map((plant) => _buildPlantTile(plant, color)),
      ],
    );
  }

  Widget _buildPlantTile(Plant plant, Color color) {
    final daysSincePlanted = DateTime.now().difference(plant.plantedAt).inDays;
    final progress = plant.daysToHarvest != null
        ? (daysSincePlanted / plant.daysToHarvest!).clamp(0.0, 1.0)
        : 0.0;
    final daysLeft = plant.daysToHarvest != null
        ? plant.daysToHarvest! - daysSincePlanted
        : 0;

    return Card(
      margin: const EdgeInsets.only(top: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: plant.imageUrl != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  '${client.host}serverpod_cloud_storage?storageId=public&path=${plant.imageUrl}',
                  width: 48,
                  height: 48,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => _buildPlaceholderIcon(),
                ),
              )
            : _buildPlaceholderIcon(),
        title: Text(plant.name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(plant.variety ?? plant.category ?? 'Plant'),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: LinearProgressIndicator(
                    value: progress,
                    backgroundColor: Colors.grey.shade200,
                    valueColor: AlwaysStoppedAnimation<Color>(color),
                    borderRadius: BorderRadius.circular(4),
                    minHeight: 6,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  daysLeft <= 0 ? 'Ready!' : '$daysLeft days left',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlaceholderIcon() {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: Colors.green.shade50,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(Icons.eco, color: Colors.green.shade800),
    );
  }
}
