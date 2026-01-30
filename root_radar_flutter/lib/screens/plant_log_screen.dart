import 'package:flutter/material.dart';
import 'package:root_radar_client/root_radar_client.dart';
import 'package:intl/intl.dart';
import '../services/demo_plant_service.dart'; // We'll just fetch directly or use client
import '../main.dart';

class PlantLogScreen extends StatefulWidget {
  final Plant plant;
  const PlantLogScreen({super.key, required this.plant});

  @override
  State<PlantLogScreen> createState() => _PlantLogScreenState();
}

class _PlantLogScreenState extends State<PlantLogScreen> {
  List<MaintenanceLog> logs = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadLogs();
  }

  Future<void> _loadLogs() async {
    setState(() => isLoading = true);
    try {
      // In a real app we'd have a specific endpoint, but for now we'll rely on the client
      // assuming we have a method or we'll filter client-side if needed?
      // Actually, let's use the DemoPlantService mock or client.
      // Since we deployed the server changes, we should use the client if we have an endpoint.
      // Wait, client.maintenanceLog is likely available.
      
      final result = await client.garden.getLogsForPlant(widget.plant.id!);
      setState(() {
        logs = result;
        isLoading = false;
      });
    } catch (e) {
      // If endpoint doesn't exist yet, we might need to rely on demo service or handle error
      debugPrint('Error loading logs: $e');
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.plant.name} Logs'),
        backgroundColor: Colors.green.shade800,
        foregroundColor: Colors.white,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : logs.isEmpty
              ? Center(
                  child: Text(
                    'No logs recorded yet.',
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: logs.length,
                  itemBuilder: (context, index) {
                    final log = logs[index];
                    return Card(
                      child: ListTile(
                        leading: _getIconForType(log.type),
                        title: Text(log.type, style: const TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(DateFormat('MMM dd, yyyy - HH:mm').format(log.timestamp)),
                            if (log.notes != null)
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Text(log.notes!),
                              ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
    );
  }

  Icon _getIconForType(String type) {
    switch (type.toLowerCase()) {
      case 'flowering':
        return const Icon(Icons.local_florist, color: Colors.pink);
      case 'pruning':
        return const Icon(Icons.content_cut, color: Colors.brown);
      case 'fertilizing':
        return const Icon(Icons.science, color: Colors.blue);
      case 'harvest':
        return const Icon(Icons.agriculture, color: Colors.green);
      default:
        return const Icon(Icons.article, color: Colors.grey);
    }
  }
}
