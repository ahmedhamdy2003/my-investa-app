import 'package:flutter/material.dart';
// تم إزالة استيراد http و dart:convert بما أننا لن نستخدم الـ API مؤقتًا
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// **مهم جداً: تأكد من هذا المسار لـ welcome_screen.dart.**
import '../welcome_screen.dart';

// **مهم جداً: تأكد من هذا المسار لـ home_screen.dart.**
import 'home_screen.dart'; // تأكد أن هذا الملف موجود في نفس المجلد investor_screens

class InterestsScreen extends StatefulWidget {
  @override
  _InterestsScreenState createState() => _InterestsScreenState();
}

class _InterestsScreenState extends State<InterestsScreen> {
  List<String> imagePaths = [
    'assets/Fashion (2).png',
    'assets/Health & Fitness.png',
    'assets/Food Truck (2).png',
    'assets/Beauty (2).png',
    'assets/Food & Beverage.png',
    'assets/Food & Beverage.png',
  ];

  List<String> interestLabels = [
    'Fashion',
    'Health & Fitness',
    'Food Truck',
    'Beauty',
    'Food & Beverage 1',
    'Food & Beverage 2',
  ];

  Set<int> selectedIndices = {};

  // تم تعديل هذه الدالة لتنقل مباشرة بدون الاتصال بالـ API
  void navigateToHome() {
    // الانتقال لـ home_screen باستخدام المسار الذي تم تعريفه في main.dart
    // pushReplacementNamed ستقوم بإزالة InterestsScreen من الـ stack
    // هذا يعني أن الضغط على زر الرجوع في HomeScreen لن يعيدك لـ InterestsScreen
    Navigator.pushReplacementNamed(context, '/investor_home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              'assets/bubble 2.png',
              width: 270,
              height: 250,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              'assets/bubble.png',
              width: 230,
            ),
          ),
          Positioned(
            top: 60,
            right: 0,
            child: Image.asset(
              'assets/bubble 3.png',
              width: 70,
              fit: BoxFit.fill,
            ),
          ),
          Column(
            children: [
              const Spacer(),
              const SizedBox(height: 100),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Text(
                      "What’s your interest?",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff001F3F),
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 16,
                  runSpacing: 16,
                  children: List.generate(imagePaths.length, (index) {
                    bool isSelected = selectedIndices.contains(index);
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          if (isSelected) {
                            selectedIndices.remove(index);
                          } else {
                            selectedIndices.add(index);
                          }
                        });
                      },
                      child: Container(
                        width: 150,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: isSelected
                                ? const Color(0xff001F3F)
                                : const Color(0xffD9E4FF),
                            width: isSelected ? 1 : 2,
                          ),
                          boxShadow: isSelected
                              ? [
                                  BoxShadow(
                                    color: const Color(0xff001F3F)
                                        .withOpacity(0.2),
                                    blurRadius: 8,
                                    offset: const Offset(0, 4),
                                  ),
                                ]
                              : [],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(14),
                          child: Image.asset(
                            imagePaths[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // **هنا تم التعديل**: استدعاء navigateToHome() مباشرة
                        // بدون الحاجة لـ check إذا تم اختيار اهتمامات أم لا في هذا السيناريو
                        // لأنك تريد رؤية الـ UI مباشرة.
                        // إذا كنت تريد إبقاء الـ check:
                        if (selectedIndices.isNotEmpty) {
                          navigateToHome();
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("اختَر على الأقل اهتمام واحد")),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff001F3F),
                        padding: EdgeInsets.zero,
                        fixedSize: const Size(164, 61),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      child: const Text(
                        'Done',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextButton(
                      onPressed: () {
                        // الرجوع لـ WelcomeScreen وإزالة كل الشاشات التي كانت بينهما
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const WelcomeScreen()),
                          (Route<dynamic> route) => false,
                        );
                      },
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xff001F3F),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ],
      ),
    );
  }
}
