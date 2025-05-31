import 'package:flutter/material.dart';
import 'package:investa4/core/assets_managers.dart';

import 'onboarding3.dart';

class Onboarding2 extends StatelessWidget {
  const Onboarding2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(

        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              AssetsManagers.curve2,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 9 ,top:1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end, // محاذاة إلى اليمين
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute (builder: (context) => const Onboarding3()),
                      );
                      print("Skip button clicked!");
                    },
                    child: const Text(
                      "Skip",
                      style: TextStyle(
                        height: 1,
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Color(0xFF001F3F),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20), // مسافة بين الصورة والنصوص

            // النصوص العلوية
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Investa",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.normal,
                          color: Color(0xFF001F3F),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Container(
                        width: 200,
                        height: 2,
                        color: Color(0xFF001F3F),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Professional App for your investment",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF001F3F),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 50), // مسافة بين النصوص والصورة المتحركة

            // الصورة المتحركة
            Image.asset(
              AssetsManagers.light,
              width: 450,
              height: 150,
            ),

            const SizedBox(height: 30), // مسافة بين الصورة المتحركة والنصوص

            // النص في المنتصف
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Text(
                "“Whether you are a beginner or a professional, save your time and start with confidence.”",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF001F3F),
                ),
              ),
            ),

            const Spacer(), // يدفع الأزرار للأسفل

            // الأزرار السفلية
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // زر "Back"
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      print("Back button clicked!");
                    },
                    child: const Text(
                      "Back",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.normal,
                        color: Color(0xFF001F3F),
                      ),
                    ),
                  ),

                  // زر السهم الدائري
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Onboarding3()),
                      );
                      print("Arrow button clicked!");
                    },
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: const Color(0xFF001F3F),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.arrow_forward_rounded,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
