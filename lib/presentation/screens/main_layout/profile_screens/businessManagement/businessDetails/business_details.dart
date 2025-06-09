import 'package:flutter/material.dart';
import 'package:investa4/core/routes_manager/colors_managers.dart';

class EditBusinessDetailsScreen extends StatelessWidget {
  const EditBusinessDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManagers.white,
      appBar: AppBar(
        leading: Container(
          margin: const EdgeInsets.all(8), // هامش حول الدائرة
          decoration: const BoxDecoration(
            shape: BoxShape.circle, // شكل دائري
            color: ColorsManagers.darkBlue, // لون الخلفية
          ),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ), // لون السهم أبيض
            onPressed: () => Navigator.pop(context), // وظيفة الرجوع
          ),
        ),
        backgroundColor: Colors.white,
        title: const Text(
          'Business Details',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: false,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Some data can be edited before your project is published for investors, such as:",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 5),
            _buildEditableRow("Description", () {
              // Handle edit logic
            }),
            _buildEditableRow("Images", () {
              // Handle edit logic
            }),
            _buildEditableRow("Updates on goals or progress milestones", () {
              // Handle edit logic
            }),
            const SizedBox(height: 5),
            const Text(
              "Note : After launch, edits require approval from the platform team.",
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEditableRow(String label, VoidCallback onEdit) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Text(label, style: const TextStyle(fontSize: 16))),
          TextButton(onPressed: onEdit, child: const Text("Edit")),
        ],
      ),
    );
  }
}
