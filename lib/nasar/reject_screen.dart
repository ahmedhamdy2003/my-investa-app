import 'package:flutter/material.dart';

class RejectScreen extends StatelessWidget {
  // 1. أضف خاصية userId هنا
  final String? userId;

  // 2. عدّل الـ constructor لاستقبال الـ userId
  const RejectScreen({super.key, this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundHeader(),
          Padding(
            padding: const EdgeInsets.fromLTRB(
              20,
              270,
              20,
              20,
            ), // تحت الصور على طول
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // بادئ من الشمال
                children: [
                  const Text(
                    'Subject: Regarding Your Project on Our Platform',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color(0xFF082347),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // **[NEW]** إضافة نص يوضح الـ userId (يمكنك إزالته بعد التأكد)
                  if (userId != null && userId!.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        "User ID: $userId",
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  const Text(
                    // يمكنك استبدال [Founder’s Name] و [Project Name] ببيانات حقيقية إذا كانت متاحة في الـ userId أو من بيانات مجمعة أخرى
                    'Dear Founder,\n\nThank you for your interest and for submitting your project to our platform.\n\nAfter a careful review of your data and an analysis of success prospects, we regret to inform you that your project was not accepted at this stage.\n\n🔁 You can reapply after 3 months with updated and improved data.\n\nIf you need assistance in developing your project, we are here to support you.\n\nBest wishes,\nThe Platform Team',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 18,
                      height: 1.5,
                      color: Color(0xFF082347),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BackgroundHeader extends StatelessWidget {
  const BackgroundHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: -10,
          left: 30,
          child: Image.asset('assets/blue_shape.png', width: 240, height: 250),
        ),
        Positioned(
          top: 38,
          right: -10,
          child: Image.asset('assets/dark_shape.png', width: 80),
        ),
        Positioned(
          top: 0,
          left: 0,
          child: Image.asset('assets/shape.png', width: 240),
        ),
      ],
    );
  }
}
