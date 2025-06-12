// File: founder_profile.dart
import 'package:flutter/material.dart';

class FounderProfileScreen extends StatelessWidget {
  final String projectId; // لاستقبال Project ID لو محتاجاه الشاشة دي

  const FounderProfileScreen({
    super.key,
    required this.projectId,
    String? userId,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Founder Profile Screen'),
          Text('Project ID: $projectId'),
          // هنا هتحط كل الـ UI والمحتوى الخاص بصفحة البروفايل للـ Founder
          // معلومات شخصية، إعدادات الحساب، وهكذا
        ],
      ),
    );
  }
}
