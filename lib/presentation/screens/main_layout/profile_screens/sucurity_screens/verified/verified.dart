import 'package:flutter/material.dart';
import '../security_screen.dart';

class Verified extends StatelessWidget {
  const Verified({super.key});

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
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Text(
              'Verified & Vetted Projects',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 24),
            Text(
              'Every business listed on the platform undergoes strict due diligence including financial review, business performance checks, and risk analysis before appearing to investors.',
              style: TextStyle(fontSize: 14, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}
