import 'package:first_page/phaseThree_screen.dart';
import 'package:flutter/material.dart';
// إضافة استيراد MailScreen لأنها هي الشاشة التالية

class PhaseTwoScreenF extends StatelessWidget {
  // <--- هنا المشكلة
  // 1. إضافة الـ projectId parameter لاستقباله
  final String projectId;

  // 2. تحديث الـ constructor ليطلب projectId
  const PhaseTwoScreenF({super.key, required this.projectId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Phase 2:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff082347),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Here we’re there, Now you’re at the\nlast stage which is the most\nimportant stage in Assigning your\ndata',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff082347),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Check your mail to provide us with the legal\nrequirements to be able to make the investors\nand the platform full of safety and security',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff082347),
                ),
              ),
              const SizedBox(height: 30),
              Center(
                child: SizedBox(
                  width: 179,
                  height: 179,
                  child: Image.asset('assets/mail.png', fit: BoxFit.cover),
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context); // Navigates back
                    },
                    child: const Text(
                      'Back',
                      style: TextStyle(
                        color: Color(0xFF082347),
                        fontSize: 24,
                      ),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF082347),
                    ),
                    child: IconButton(
                      onPressed: () {
                        // 3. الانتقال إلى MailScreen، وتمرير الـ projectId
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => phaseThree_screen(
                                projectId:
                                    projectId), // <--- هنا كان الخطأ، المفروض تكون widget.projectId
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
