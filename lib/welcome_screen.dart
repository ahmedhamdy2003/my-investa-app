import 'package:first_page/interests_screen.dart';
import 'package:flutter/material.dart';
import 'welcome_screenB.dart'; // تم استيراده للتنقل لصفحة المؤسس

// استيراد صفحة InterestsScreen
// **تأكد أن المسار 'investor_screens/interests_screen.dart' صحيح**
// لو مكان الملف مختلف، عدّل المسار هنا.

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: Stack(
        children: [
          // الشكل الأزرق الفاتح أعلى اليسار
          Positioned(
            top: 0,
            left: -15,
            child: Image.asset(
              'assets/blue_shape.png',
              width: 260,
            ),
          ),

          // الشكل الكحلي أعلى اليمين
          Positioned(
            top: 100,
            right: -15,
            child: Image.asset(
              'assets/dark_shape.png',
              width: 100,
              height: 170,
            ),
          ),

          // محتوى الوسط
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/Logo (2).png',
                  width: 150,
                  height: 150,
                ),
                const SizedBox(height: 16),
                const Text(
                  "INVESTA",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0A2640),
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  "Welcome Back !",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),

          // الزرائر بأسفل الشاشة
          Positioned(
            bottom: 100, // ← اتحكم في المسافة من الأسفل هنا
            left: 0,
            right: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // **هنا التنقل لصفحة InterestsScreen**
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const InterestsScreen(), // استخدام InterestsScreen
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0A2640),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 25, horizontal: 50),
                      ),
                      child: const Text(
                        "Investor",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                    const SizedBox(width: 16),
                    ElevatedButton(
                      onPressed: () {
                        // التنقل لصفحة Founder
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const WelcomeScreenB(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0A2640),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 25, horizontal: 50),
                      ),
                      child: const Text(
                        "Founder",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // TODO: التنقل كزائر
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFF0A2640),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 45),
                    elevation: 1,
                  ),
                  child: const Text(
                    "Enter as a Guest",
                    style: TextStyle(fontSize: 14),
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
