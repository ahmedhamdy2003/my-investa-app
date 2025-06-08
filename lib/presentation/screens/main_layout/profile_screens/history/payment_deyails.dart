import 'package:flutter/material.dart';

import '../../../../../core/routes_manager/colors_managers.dart';

class PaymentHistoryDetailsScreen extends StatelessWidget {
  const PaymentHistoryDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
        title: const Text('History', style: TextStyle(color: Colors.black)),
        centerTitle: false,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Payment History',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Center(
              child: Text(
                'zerosugar by keto',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Payment Details Card
            Card(
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    _buildDetailRow('Name', 'Younis Mahmoud'),
                    _buildDetailRow(
                      'Address',
                      'Maadi, el nasr street, retaj building',
                    ),
                    _buildDetailRow('Phone number', '0112845673'),
                    _buildDetailRow('Transaction ID', 'TXN012349'),
                    _buildDetailRow('Date', '01/02/2025 - 10:24 pm'),
                    _buildDetailRow('Business', 'Zerosugar by ketonista'),
                    _buildDetailRow('Type', 'Investment - Short'),
                    _buildDetailRow('Status', 'Successful', isSuccess: true),
                    _buildDetailRow('Method', 'Visa'),
                    _buildDetailRow('Fee', '240 LE'),
                    _buildDetailRow('Reinsurance', '600 LE'),
                    _buildDetailRow('Net Amount', '6,000 LE'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Total Amount Section
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.grey, width: 0.5),
                  bottom: BorderSide(color: Colors.grey, width: 0.5),
                ),
              ),
              child: const Center(
                child: Text(
                  'TOTAL Amount',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 8),
            const Center(
              child: Text(
                '6,840 L.E',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, {bool isSuccess = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: isSuccess ? Colors.green : Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
