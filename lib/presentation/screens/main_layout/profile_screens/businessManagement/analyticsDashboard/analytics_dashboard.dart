import 'package:flutter/material.dart';

import '../../../../../../core/routes_manager/colors_managers.dart';

class AnalyticsDashboardScreen extends StatelessWidget {
  const AnalyticsDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManagers.white,

      appBar: AppBar(
        leading: Container(
          margin: EdgeInsets.all(8), // هامش حول الدائرة
          decoration: BoxDecoration(
            shape: BoxShape.circle, // شكل دائري
            color: ColorsManagers.darkBlue, // لون الخلفية
          ),
          child: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white), // لون السهم أبيض
            onPressed: () => Navigator.pop(context), // وظيفة الرجوع
          ),
        ),
        backgroundColor: Colors.white,
        title: const Text('AnalyticsDashboard', style: TextStyle(color: Colors.black)),
        centerTitle: false,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Displays periodic performance indicators of your project.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            _buildMetricRow("Monthly revenue", "180,000 L.E"),
            _buildMetricRow("Annual revenues", "2,160,000 L.E"),
            _buildMetricRow("Achieved funding (%)", "75%"),
            _buildMetricRow("Total number of Investor", "11"),
            _buildMetricRow("Short term Investors", "5"),
            _buildMetricRow("Long term Investors", "6"),
            _buildMetricRow("Repeat Purchase Rate", "28%"),
            _buildMetricRow("Customer Growth", "40%"),
          ],
        ),
      ),
    );
  }

  Widget _buildMetricRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Text(label, style: const TextStyle(fontSize: 16))),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}