import 'package:flutter/material.dart';

class LearningScreen extends StatelessWidget {
  final List<Map<String, String>> learningContent = [
    {
      'title': 'How to Use a Seed Drill',
      'description':
          'Learn how a seed drill helps in precise sowing and improves productivity.',
      'videoUrl': 'assets/videos/seed_drill.mp4', // Example video path
    },
    {
      'title': 'Modern Tractor Ploughing Techniques',
      'description':
          'Discover how to efficiently use a tractor plough for better soil aeration.',
      'videoUrl': 'assets/videos/tractor_plough.mp4',
    },
    {
      'title': 'Benefits of Crop Sprayers',
      'description':
          'Understand the correct usage of crop sprayers to protect your crops from pests.',
      'videoUrl': 'assets/videos/crop_sprayer.mp4',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Learning Hub'),
      ),
      body: ListView.builder(
        itemCount: learningContent.length,
        padding: EdgeInsets.all(12),
        itemBuilder: (context, index) {
          final item = learningContent[index];
          return Card(
            elevation: 10,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['title']!,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[700],
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    item['description']!,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 12),
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.play_circle_fill,
                        color: Colors.green,
                        size: 64,
                      ),
                    ),
                    // Replace this container with a real video player if needed.
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
