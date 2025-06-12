import 'package:flutter/material.dart';
import 'tips_screen.dart'; // تأكد من وجود الملف والمسار الصحيح

class WelcomeScreenB extends StatelessWidget {
  // 1. أضف خاصية userId
  final String? userId; // يمكن أن تكون null لو لم يتم تسجيل الدخول

  // 2. أضفها في الـ constructor
  const WelcomeScreenB({super.key, this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: Stack(
        children: [
          // الفقاعة الغامقة تحت الزرقاء
          Positioned(
            top: -10,
            left: 30,
            child: Image.asset(
              'assets/blue_shape.png',
              width: 240,
              height: 250,
            ),
          ),

          // الفقاعة الزرقاء فوق الغامقة
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset('assets/shape.png', width: 240),
          ),

          // الفقاعة اليمين
          Positioned(
            top: 38,
            right: -10,
            child: Image.asset('assets/dark_shape.png', width: 80),
          ),

          // المحتوى في منتصف الشاشة رأسيًا
          Center(
            // Make this Center a non-const to allow child modification
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment:
                    CrossAxisAlignment.start, // الكلام يبدأ من الشمال
                children: [
                  const Text(
                    "🚀 Welcome to Investa, a platform\nsupporting local entrepreneurs in Egypt!",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0A2640),
                    ),
                  ),
                  const SizedBox(height: 11),
                  const Text(
                    "Our platform is seeking the best emerging startups and local brands in the fields of food & beverages, beauty, fashion, fitness, and health & food projects—especially those operating in the Egyptian market for more than 12 months.",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0A2640),
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    "Do you have a genuine & successful project seeking funding & expansion opportunities?",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0A2640),
                    ),
                  ),
                  // **[NEW]** لإظهار الـ userId (للتأكد أنه يتم تمريره بشكل صحيح)
                  if (userId != null && userId!.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        "User ID: $userId",
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),

          // جملة أسفل الشاشة
          const Positioned(
            bottom: 160,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                "This could be your chance!",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0A2640),
                ),
              ),
            ),
          ),

          // زرار البدء بأسفل الشاشة
          Positioned(
            bottom: 80,
            left: 24,
            right: 24,
            child: ElevatedButton(
              onPressed: () {
                // يمكنك الآن تمرير الـ userId إلى TipsScreen إذا كانت تحتاج إليه
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TipsScreen(userId: userId),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0A2640),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.symmetric(vertical: 30),
              ),
              child: const Text(
                "Yes, Sure let's start the journey",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
