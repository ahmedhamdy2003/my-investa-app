import 'package:flutter/material.dart';

import '../../../../../../core/routes_manager/colors_managers.dart';
import '../security_screen.dart';

class SecureTransaction extends StatelessWidget {
  const SecureTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Container(
          margin: EdgeInsets.all(8), // هامش حول الدائرة
          decoration: BoxDecoration(
            shape: BoxShape.circle, // شكل دائري
            color: Color(0xFF001F3F), // لون الخلفية
          ),
          child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white), // لون السهم أبيض
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SecurityScreen()),
                );
              } // وظيفة الرجوع
          ),
        ),
        backgroundColor: Colors.white,
        title: const Text('Security', style: TextStyle(color: Colors.black)),
        centerTitle: false,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              ' Secure Transactions Only',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: ColorsManagers.darkBlue,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'All payments and transfers are processed via licensed, secure gateways (like Fawry, Paymob, or bank transfers), so your money is always safe.',
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 30),
            // Add legal support action button

          ],
        ),
      ),
    );
  }
}