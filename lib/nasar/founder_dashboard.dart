// File: founder_dashboard.dart
import 'package:flutter/material.dart';

class FounderDashboardScreen extends StatelessWidget {
  final String projectId; // لاستقبال Project ID لو محتاجاه الشاشة دي

  const FounderDashboardScreen({super.key, required this.projectId});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Founder Dashboard Screen'),
          Text('Project ID: $projectId'),
          // هنا هتحط كل الـ UI والمحتوى الخاص بصفحة الداش بورد للـ Founder
          // رسوم بيانية، إحصائيات، وهكذا
        ],
      ),
    );
  }
}
