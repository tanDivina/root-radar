import 'package:flutter/material.dart';
import 'package:root_radar_client/root_radar_client.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import '../main.dart';

class PhotoTimelineScreen extends StatefulWidget {
  final Plant plant;
  const PhotoTimelineScreen({super.key, required this.plant});

  @override
  State<PhotoTimelineScreen> createState() => _PhotoTimelineScreenState();
}

class _PhotoTimelineScreenState extends State<PhotoTimelineScreen> {
  List<PlantPhoto> _photos = [];
  bool _isLoading = true;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _loadPhotos();
  }

  Future<void> _loadPhotos() async {
    setState(() => _isLoading = true);
    try {
      final photos = await client.garden.getPhotosForPlant(widget.plant.id!);
      setState(() {
        _photos = photos;
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
      debugPrint('Error loading photos: $e');
    }
  }

  Future<void> _addPhoto() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image == null) return;

    final notesController = TextEditingController();
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Timeline Photo'),
        content: TextField(
          controller: notesController,
          decoration: const InputDecoration(hintText: 'Add a note for this photo (optional)'),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Cancel')),
          TextButton(onPressed: () => Navigator.pop(context, true), child: const Text('Add')),
        ],
      ),
    );

    if (confirmed == true) {
      setState(() => _isLoading = true);
      try {
        final fileName = 'timeline_${widget.plant.id}_${DateTime.now().millisecondsSinceEpoch}.jpg';
        final uploadDescription = await client.garden.getUploadDescription(fileName);
        
        if (uploadDescription != null) {
          final uploader = FileUploader(uploadDescription);
          final bytes = await image.readAsBytes();
          await uploader.upload(Stream.value(bytes));
          await client.garden.verifyUpload(fileName);

          final photo = PlantPhoto(
            plantId: widget.plant.id!,
            imageUrl: fileName,
            timestamp: DateTime.now(),
            notes: notesController.text,
          );
          await client.garden.savePlantPhoto(photo);
          _loadPhotos();
        }
      } catch (e) {
        debugPrint('Error adding photo: $e');
        if (mounted) {
           ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
        }
      } finally {
        if (mounted) setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.plant.name} Timeline'),
        backgroundColor: Colors.green.shade800,
        foregroundColor: Colors.white,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _photos.isEmpty
              ? _buildEmptyState()
              : _buildTimeline(),
      floatingActionButton: FloatingActionButton(
        onPressed: _addPhoto,
        backgroundColor: Colors.green.shade800,
        child: const Icon(Icons.add_a_photo),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.history_toggle_off, size: 80, color: Colors.green.shade200),
          const SizedBox(height: 16),
          const Text('No photos in this timeline yet.'),
          const Text('Add your first progress photo!'),
        ],
      ),
    );
  }

  Widget _buildTimeline() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _photos.length,
      itemBuilder: (context, index) {
        final photo = _photos[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 24),
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                '${client.host}serverpod_cloud_storage?storageId=public&path=${photo.imageUrl}',
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 200,
                  color: Colors.grey.shade200,
                  child: const Icon(Icons.broken_image, size: 50),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      DateFormat('MMMM dd, yyyy - HH:mm').format(photo.timestamp),
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    if (photo.notes != null && photo.notes!.isNotEmpty) ...[
                      const SizedBox(height: 8),
                      Text(
                        photo.notes!,
                        style: TextStyle(color: Colors.grey.shade700, fontStyle: FontStyle.italic),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
