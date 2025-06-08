import 'package:flutter/material.dart';
import 'package:investa4/core/routes_manager/colors_managers.dart';
import 'package:investa4/presentation/screens/main_layout/profile_screens/businessManagement/fundingProgress/show_investors.dart';

class FundingProgressScreen extends StatelessWidget {
  const FundingProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManagers.white,
      appBar: AppBar(
        leading: Container(
          margin: const EdgeInsets.all(8), // هامش حول الدائرة
          decoration: BoxDecoration(
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
          'FundingProgress',
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
              'Some data can be edited before your project is published for investors, such as:',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            _buildRow('Total funding required:', '200,000 L.E'),
            _buildRow('Percentage achieved\nso far :', '45% (90,000 L.E)'),
            _buildRow('Number of investors\nparticipating:', '14'),
            _buildRow('Remaining time for\nthe campaign:', '19 days'),
            _buildRow('Type of investment:', 'Long'),
            const Spacer(),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ShowInvestors(),
                    ),
                  );
                },
                child: const Text(
                  'View Investors',
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(label, style: const TextStyle(fontSize: 16)),
          ),
          Expanded(
            flex: 1,
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
