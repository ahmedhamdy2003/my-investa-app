// File: founder_reels.dart
import 'package:flutter/material.dart';

class FounderReelsScreen extends StatelessWidget {
  final String projectId; // لاستقبال Project ID لو محتاجاه الشاشة دي

  const FounderReelsScreen({super.key, required this.projectId});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Founder Reels Screen'),
          Text('Project ID: $projectId'),
          // هنا هتحط كل الـ UI والمحتوى الخاص بصفحة الـ Reels للـ Founder
          // ممكن يكون فيها فيديوهات قصيرة، وهكذا
        ],
      ),
    );
  }
}
