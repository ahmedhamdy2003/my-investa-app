import 'package:investa4/nasar/interests_screen.dart'; // مسار شاشة Investor Home
import 'package:flutter/material.dart';
import 'welcome_screenB.dart'; // مسار شاشة Founder Welcome (غالباً بتودّي لـ FounderHomeScreen في النهاية)
import 'package:http/http.dart' as http; // استيراد مكتبة http
import 'dart:convert'; // استيراد لتحويل JSON
import 'package:shared_preferences/shared_preferences.dart'; // لحفظ الدور محلياً
// **[NEW]** استيراد ملف إدارة المستخدمين
import 'package:investa4/core/utils/manage_current_user.dart'; // تأكد أن المسار ده صح عندك

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  // دالة لحفظ الدور وإرساله للباك إند ثم التنقل
  Future<void> _saveRoleAndNavigate(BuildContext context, String role) async {
    // 1. جلب user_id
    String? userId = ManageCurrentUser.currentUser.guid;

    // 2. التحقق لو user_id مش موجود
    if (userId.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Color(0xffF44336),
          content: Text("Error: User ID not found. Please log in again."),
        ),
      );
      print('Error: User ID is null or empty. Cannot save role.');
      return;
    }

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Saving role as $role...")));

    // 3. تعريف رابط الـ API لإرسال الدور
    // **[IMPORTANT]** هذا هو الـ URL الذي يجب أن يستقبل user_id والدور
    // تأكد أن هذا الرابط هو الصحيح للـ backend الخاص بك.
    const String apiUrl =
        'https://7226-197-134-76-183.ngrok-free.app/role/'; // **غير هذا الرابط للـ API الفعلي**

    try {
      final Map<String, dynamic> dataToSend = {'user_id': userId, 'role': role};

      print(
        'Sending role data to backend: ${jsonEncode(dataToSend)}',
      ); // [DEBUGGING]

      final http.Response response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          // 'Authorization': 'Bearer YOUR_AUTH_TOKEN_HERE', // أضف التوثيق إذا لزم الأمر
        },
        body: jsonEncode(dataToSend),
      );

      print('API Response Status Code: ${response.statusCode}'); // [DEBUGGING]
      print('API Response Body: ${response.body}'); // [DEBUGGING]

      if (response.statusCode == 200 || response.statusCode == 201) {
        // الدور تم حفظه بنجاح في الباك إند
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: const Color(0xff4CAF50),
            content: Text("Role saved successfully as $role!"),
          ),
        );

        // **[NEW]** حفظ الدور محلياً بعد تأكيد الباك إند
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('user_role', role);

        // 4. التنقل للصفحة المناسبة للدور بعد الحفظ والنجاح
        if (role == 'investor') {
          // ينقل لـ InterestsScreen (الـ Investor Home)
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const InterestsScreen()),
          );
        } else if (role == 'founder') {
          // ينقل لـ WelcomeScreenB (ليكمل إجراءات الـ Founder)
          // WelcomeScreenB هي اللي هتبقى مسؤولة عن نقل الـ projectId
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const WelcomeScreenB()),
          );
        }
      } else {
        // فشل إرسال الدور
        String errorMessage;
        if (response.body.isNotEmpty) {
          try {
            final Map<String, dynamic> errorData = json.decode(response.body);
            errorMessage =
                errorData['error'] ??
                errorData['message'] ??
                'Failed to save role. Please try again.';
          } catch (e) {
            errorMessage =
                'Failed to save role. Server returned non-JSON: ${response.body}';
            print(
              'Failed to decode error JSON from server: $e, Raw body: ${response.body}',
            );
          }
        } else {
          errorMessage =
              'Server error: No response body (Status: ${response.statusCode})';
        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: const Color(0xffF44336),
            content: Text("Error: $errorMessage"),
          ),
        );
        print('Failed to send role: ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      // خطأ في الشبكة
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Color(0xffF44336),
          content: Text("Network error: Could not connect to the server."),
        ),
      );
      print('Error saving role: $e');
    }
  }

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
            child: Image.asset('assets/blue_shape.png', width: 260),
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
                Image.asset('assets/Logo (2).png', width: 150, height: 150),
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
                  style: TextStyle(fontSize: 16, color: Colors.black),
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
                        // **[MODIFIED]** استدعاء الدالة الجديدة لإرسال الدور والانتقال
                        _saveRoleAndNavigate(context, 'investor');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0A2640),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 25,
                          horizontal: 50,
                        ),
                      ),
                      child: const Text(
                        "Investor",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    ElevatedButton(
                      onPressed: () {
                        // **[MODIFIED]** استدعاء الدالة الجديدة لإرسال الدور والانتقال
                        _saveRoleAndNavigate(context, 'founder');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0A2640),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 25,
                          horizontal: 50,
                        ),
                      ),
                      child: const Text(
                        "Founder",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // TODO: التنقل كزائر
                    // يمكنك هنا التنقل لشاشة Home Screen (Investor) مثلاً بدون user_id
                    // هذا المسار لن يرسل دور للـ backend
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const InterestsScreen(),
                      ), // أو شاشة عامة للـ Guest
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFF0A2640),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 45,
                    ),
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
