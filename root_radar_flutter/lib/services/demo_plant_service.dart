import 'package:root_radar_client/root_radar_client.dart';

class DemoPlantService {
  static final DemoPlantService _instance = DemoPlantService._internal();
  factory DemoPlantService() => _instance;
  DemoPlantService._internal();

  final List<Plant> _plants = [
    Plant(
      id: 1,
      name: 'Tomato',
      variety: 'Cherry',
      plantedAt: DateTime.now().subtract(const Duration(days: 15)),
      daysToHarvest: 60,
      anchorId: 'demo_anchor_1',
      notes: 'Growing well in full sun',
    ),
    Plant(
      id: 2,
      name: 'Basil',
      variety: 'Sweet',
      plantedAt: DateTime.now().subtract(const Duration(days: 10)),
      daysToHarvest: 30,
      anchorId: 'demo_anchor_2',
      notes: 'Needs regular watering',
    ),
    Plant(
      id: 3,
      name: 'Lettuce',
      variety: 'Romaine',
      plantedAt: DateTime.now().subtract(const Duration(days: 20)),
      daysToHarvest: 45,
      anchorId: 'demo_anchor_3',
      notes: 'Ready for first harvest soon',
    ),
  ];

  int _nextId = 4;

  Future<List<Plant>> getAllPlants() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return List.from(_plants);
  }

  Future<Plant> savePlant(Plant plant) async {
    await Future.delayed(const Duration(milliseconds: 300));

    if (plant.id == null) {
      final newPlant = plant.copyWith(id: _nextId++);
      _plants.add(newPlant);
      return newPlant;
    } else {
      final index = _plants.indexWhere((p) => p.id == plant.id);
      if (index != -1) {
        _plants[index] = plant;
      }
      return plant;
    }
  }

  Future<void> deletePlant(int id) async {
    await Future.delayed(const Duration(milliseconds: 300));
    _plants.removeWhere((plant) => plant.id == id);
  }
}
