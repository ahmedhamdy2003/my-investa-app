import 'package:flutter/material.dart';
import 'package:investa4/core/routes_manager/colors_managers.dart';

import '../security_screen.dart';

class ClearFees extends StatelessWidget {
  const ClearFees({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Container(
          margin: const EdgeInsets.all(8), // هامش حول الدائرة
          decoration: const BoxDecoration(
            shape: BoxShape.circle, // شكل دائري
            color: Color(0xFF001F3F), // لون الخلفية
          ),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ), // لون السهم أبيض
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SecurityScreen()),
              );
            }, // وظيفة الرجوع
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
              'Clear Fees, No Surprises',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: ColorsManagers.darkBlue,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'We charge a flat 4% -10% it depend on\n'
              'investment period service fee, deducted\n'
              'once only when you invest. You always know\n'
              'what you\'re paying for and why',
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
