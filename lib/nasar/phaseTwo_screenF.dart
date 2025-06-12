import 'package:investa4/nasar/phaseThree_screen.dart';
import 'package:flutter/material.dart';
// إضافة استيراد MailScreen لأنها هي الشاشة التالية

class PhaseTwoScreenF extends StatelessWidget {
  // 1. إضافة الـ projectId parameter لاستقباله
  final String projectId;
  // 1. أضف خاصية userId هنا
  final String? userId; // <--- هنا تم إضافة الـ userId

  // 2. تحديث الـ constructor ليطلب projectId و userId
  const PhaseTwoScreenF({
    super.key,
    required this.projectId,
    this.userId,
  }); // <--- هنا تم استقبال الـ userId

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // أضف AppBar لإظهار زر الرجوع
        title: const Text(
          "Phase 2 - Completion",
          style: TextStyle(color: Color(0xff082347)),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xff082347)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF082347)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              // [DEBUG] لعرض الـ userId للتأكد من وصوله
              if (userId != null && userId!.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: Text(
                    "User ID: $userId",
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.blueGrey,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              // [DEBUG] لعرض الـ projectId للتأكد من وصوله
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Text(
                  "Project ID: $projectId",
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.blueGrey,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
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
                      style: TextStyle(color: Color(0xFF082347), fontSize: 24),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF082347),
                    ),
                    child: IconButton(
                      onPressed: () {
                        // 3. الانتقال إلى phaseThree_screen، وتمرير الـ projectId والـ userId
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => phaseThree_screen(
                                  projectId:
                                      projectId, // <--- هنا تم تمرير projectId
                                  userId: userId, // <--- هنا تم تمرير userId
                                ),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
