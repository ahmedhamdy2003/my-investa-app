import 'package:flutter/material.dart';

import 'emailNotification/email_notification.dart';
import 'generalNotification/general_notification.dart';
class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Container(
          margin: EdgeInsets.all(8), // هامش حول الدائرة
          decoration: BoxDecoration(
            shape: BoxShape.circle, // شكل دائري
            color: Color(0xFF001F3F), // لون الخلفية
          ),
          child: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white), // لون السهم أبيض
            onPressed: () => Navigator.pop(context), // وظيفة الرجوع
          ),
        ),
        backgroundColor: Colors.white,
        title: const Text('Notification', style: TextStyle(color: Colors.black)),
        centerTitle: false,
        elevation: 0,
      ),       body: SingleChildScrollView(
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
                  title: const Text("General Notification"),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GeneralNotification()),
                    );                    },
                ),

                // خط فاصل
                const Divider(),

                // كلمة المرور
                ListTile(
                  // leading: const Icon(Icons.lock, color: Colors.green),
                  title: const Text("Email  Notification"),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EmailNotification()),
                    );                     },
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