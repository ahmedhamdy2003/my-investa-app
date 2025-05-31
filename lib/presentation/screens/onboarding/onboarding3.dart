import 'package:flutter/material.dart';
import 'package:investa4/core/assets_managers.dart';

import '../main_layout/main_layout.dart';

class Onboarding3 extends StatelessWidget {
  const Onboarding3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // صورة الخلفية
              Image.asset(
                AssetsManagers.curve3,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ],
          ),

          // زر "Skip" في أعلى يمين الشاشة
          // Positioned(
          //   top: 20,
          //   right: 20,
          //   child: GestureDetector(
          //     onTap: () {
          //       print("Skip button clicked!");
          //     },
          //     child: const Text(
          //       "Skip",
          //       style: TextStyle(
          //         fontSize: 16,
          //         fontWeight: FontWeight.normal,
          //         color: Colors.white,
          //       ),
          //     ),
          //   ),
          // ),

          // النصوص في أعلى يسار الشاشة فوق الصورة المتحركة
          Positioned(
            top:180,
            left: 20,
            child: Column(
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
                  width: 253,
                  height: 2,
                  color: Color(0xFF001F3F),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Your investment starts Here !",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Color(0xFF001F3F),
                  ),
                ),
              ],
            ),
          ),

          // صورة "lights.gif" في منتصف الشاشة
          Center(
            child: Image.asset(
              AssetsManagers.dashboard2,
              width: 500,
              height: 150,
            ),
          ),

          // النص الجديد تحت الصورة
          Positioned(
            top: 450,
            left: 20,
            right: 20,
            child: const Text(
              "“Whether you are a beginner or a professional, save your time and start with confidence.”",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFF001F3F),
              ),
            ),
          ),

          // الأزرار في الأسفل
          Positioned(
            bottom: 20,
            left: 30,
            right: 30,
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
                      MaterialPageRoute (builder: (context) => const MainLayout()),
                    );
                  },
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: const Color(0xFF001F3F),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.8),
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
    );
  }
}
