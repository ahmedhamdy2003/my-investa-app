// founder_community.dart
import 'package:flutter/material.dart';

class FounderCommunityScreen extends StatelessWidget {
  final String projectId; // استقبل الـ projectId هنا لو محتاجه

  const FounderCommunityScreen({super.key, required this.projectId});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Founder Community Screen for Project ID: $projectId'),
    );
  }
}
