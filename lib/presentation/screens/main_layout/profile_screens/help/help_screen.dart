import 'package:flutter/material.dart';
import 'package:investa4/presentation/screens/main_layout/profile_screens/help/support/support_screen.dart';

import '../../../../../core/routes_manager/colors_managers.dart';
import 'callRequest/call_request.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Container(
          margin: const EdgeInsets.all(8), // هامش حول الدائرة
          decoration: const BoxDecoration(
            shape: BoxShape.circle, // شكل دائري
            color: ColorsManagers.darkBlue, // لون الخلفية
          ),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ), // لون السهم أبيض
            onPressed: () => Navigator.pop(context), // وظيفة الرجوع
          ),
        ),
        backgroundColor: Colors.white,
        title: const Text('Help', style: TextStyle(color: Colors.black)),
        centerTitle: false,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // مسافة بين العنوان والمحتوى
            const SizedBox(height: 20),

            // قائمة الخيارات
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  // البريد الإلكتروني
                  ListTile(
                    // leading: const Icon(Icons.email, color: Colors.blue),
                    title: const Text("FAQ"),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => FAQScreen()),
                      // );
                    },
                  ),

                  // خط فاصل
                  const Divider(),

                  // كلمة المرور
                  ListTile(
                    // leading: const Icon(Icons.lock, color: Colors.green),
                    title: const Text("Support "),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ChatPage()),
                      );
                    },
                  ),
                  // خط فاصل
                  const Divider(),
                  ListTile(
                    // leading: const Icon(Icons.lock, color: Colors.green),
                    title: const Text("Phone Call Request "),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PhoneCallRequest(),
                        ),
                      );
                    },
                  ),
                  // خط فاصل
                  const Divider(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
