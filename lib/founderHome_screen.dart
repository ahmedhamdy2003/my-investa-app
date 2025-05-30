import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'chat_bot_view.dart'; // تأكد من استيراد ملف الشات بوت الخاص بك

class FounderHomeScreen extends StatefulWidget {
  const FounderHomeScreen({super.key});

  @override
  State<FounderHomeScreen> createState() => _FounderHomeScreenState();
}

class _FounderHomeScreenState extends State<FounderHomeScreen> {
  final Color textColor = const Color(0xFF082347);

  // متغيرات لتخزين نسب النجاح والفشل
  // ممكن تكون null في البداية لحد ما يتم حسابها
  String? _successRate;
  String? _failureRate;

  Widget _buildInfoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, color: textColor),
            ),
          ),
          Text(value, style: TextStyle(color: textColor)),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return const Divider(height: 20, thickness: 1);
  }

  // دالة لحساب وعرض نسب النجاح والفشل
  void _calculatePrediction() {
    // هنا هتحط منطق حساب نسبة النجاح والفشل.
    // ممكن يكون بناءً على بيانات المستخدم اللي تم إدخالها قبل كده،
    // أو عن طريق استدعاء API خارجي لـ AI Model معين.
    // لغرض المثال، هنحط قيم افتراضية:
    setState(() {
      _successRate = '75%'; // مثال: نسبة نجاح متوقعة
      _failureRate = '25%'; // مثال: نسبة فشل متوقعة
    });

    // لو عايز تستدعي API عشان يحسب لك النسب دي (زي ما عملنا مع الشات بوت):
    /*
    // مثال لـ API call (تحتاج تضيف مكتبة http و dart:convert)
    // import 'package:http/http.dart' as http;
    // import 'dart:convert';
    // final String predictionApiUrl = 'YOUR_PREDICTION_API_ENDPOINT_HERE';
    // try {
    //   final response = await http.post(
    //     Uri.parse(predictionApiUrl),
    //     headers: <String, String>{
    //       'Content-Type': 'application/json; charset=UTF-8',
    //     },
    //     body: jsonEncode(<String, dynamic>{
    //       'project_data': 'بيانات المشروع هنا', // ابعت البيانات اللي الـ AI بيحتاجها
    //     }),
    //   );
    //
    //   if (response.statusCode == 200) {
    //     final Map<String, dynamic> data = jsonDecode(response.body);
    //     setState(() {
    //       _successRate = '${data['success_percentage']}%';
    //       _failureRate = '${data['failure_percentage']}%';
    //     });
    //   } else {
    //     print('Failed to get prediction: ${response.statusCode}');
    //     setState(() {
    //       _successRate = '-';
    //       _failureRate = 'خطأ';
    //     });
    //   }
    // } catch (e) {
    //   print('Error getting prediction: $e');
    //   setState(() {
    //     _successRate = '-';
    //     _failureRate = 'خطأ';
    //   });
    // }
    */
  }

  // دالة لعرض البوب أب/المودال الخاص بالشات بوت
  void _showChatBotModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return FractionallySizedBox(
          heightFactor: 0.85,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
            ),
            child: const ChatBotView(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        selectedItemColor: Colors.blue.shade900,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.groups), label: "Community"),
          BottomNavigationBarItem(
              icon: Icon(Icons.play_circle), label: "Reels"),
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard), label: "Dashboard"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: "Profile"),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(34.5),
                    child: Image.asset(
                      'assets/fakhr.png',
                      width: 69,
                      height: 69,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "Welcome,Fakhr ",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: textColor),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "Continue to Achieve your Goals",
                          style: TextStyle(fontSize: 14, color: textColor),
                        ),
                      ],
                    ),
                  ),
                  const Icon(
                    Icons.notifications_none,
                    color: Color(0xFF082347),
                    size: 24,
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Quick Overview
              Text("Quick Overview :",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: textColor)),
              const SizedBox(height: 10),
              _buildInfoRow("Project Status", "Under Review"),
              _buildDivider(),
              _buildInfoRow("Progress Percentage", "0%"),
              _buildDivider(),
              _buildInfoRow("Number of investors", "0"),
              _buildDivider(),
              _buildInfoRow("Total Funding", "0 L.E"),
              _buildDivider(),
              _buildInfoRow("Overall Project Rating", "-"),
              _buildDivider(),

              // --- AI Prediction Section (القسم اللي رجعناه مع التعديلات) ---
              Text("AI prediction for future success",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, color: textColor)),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // عمود لنسبة الفشل
                  Column(
                    children: [
                      Image.asset(
                        'assets/fail.png',
                        width: 90,
                        height: 166,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        _failureRate ??
                            '-%', // عرض نسبة الفشل أو '-' لو لسه ما اتحسبتش
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: textColor),
                      ),
                    ],
                  ),
                  // عمود لنسبة النجاح
                  Column(
                    children: [
                      Image.asset(
                        'assets/suc.png',
                        width: 90,
                        height: 166,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        _successRate ??
                            '-%', // عرض نسبة النجاح أو '-' لو لسه ما اتحسبتش
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: textColor),
                      ),
                    ],
                  ),
                  // زرار الـ AI (أيقونة الروبوت اللي بتضغط عليها عشان تحسب النسب)
                  // هذا هو الزرار الذي سيستدعي _calculatePrediction()
                  ElevatedButton(
                    onPressed:
                        _calculatePrediction, // عند الضغط، استدعي دالة الحساب
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      padding: const EdgeInsets.all(0),
                      shape: const CircleBorder(),
                      minimumSize: const Size(60, 60),
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // خلفية الفقاعة (نفس التصميم السابق)
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: const Color(0xFF434343),
                            borderRadius: BorderRadius.circular(28),
                          ),
                        ),
                        // ذيل الفقاعة (نفس التصميم السابق)
                        Positioned(
                          bottom: -8,
                          left: 12,
                          child: Transform.rotate(
                            angle: 45 * 3.1415926535 / 180,
                            child: Container(
                              width: 16,
                              height: 16,
                              decoration: BoxDecoration(
                                color: const Color(0xFF42A5F5),
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ),
                        ),
                        // جسم الروبوت الرئيسي (نفس التصميم السابق)
                        Container(
                          width: 36,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(8),
                                bottom: Radius.circular(4)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 2,
                                offset: const Offset(0, 1),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              // العيون
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 6),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 6,
                                      height: 6,
                                      decoration: const BoxDecoration(
                                        color: Color(0xFF19376D),
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    Container(
                                      width: 6,
                                      height: 6,
                                      decoration: const BoxDecoration(
                                        color: Color(0xFF19376D),
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // الفم
                              Container(
                                height: 2,
                                width: 12,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF19376D),
                                  borderRadius: BorderRadius.circular(1),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // الرأس (نفس التصميم السابق)
                        Positioned(
                          top: 4,
                          child: Container(
                            width: 28,
                            height: 10,
                            decoration: const BoxDecoration(
                              color: Color(0xffD3D3D3),
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(5),
                                  bottom: Radius.circular(2)),
                            ),
                          ),
                        ),
                        // الهوائي (نفس التصميم السابق)
                        Positioned(
                          top: -2,
                          child: Container(
                            width: 2,
                            height: 6,
                            color: const Color(0xffD3D3D3),
                          ),
                        ),
                        // الجوانب (الأذنين) (نفس التصميم السابق)
                        Positioned(
                          left: 2,
                          top: 8,
                          child: Container(
                            width: 4,
                            height: 6,
                            decoration: const BoxDecoration(
                              color: Color(0xffD3D3D3),
                              borderRadius: BorderRadius.horizontal(
                                  left: Radius.circular(2)),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 2,
                          top: 8,
                          child: Container(
                            width: 4,
                            height: 6,
                            decoration: const BoxDecoration(
                              color: Color(0xffD3D3D3),
                              borderRadius: BorderRadius.horizontal(
                                  right: Radius.circular(2)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              _buildDivider(),
              // --- نهاية قسم AI Prediction ---

              // Information Section
              Text("Information",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: textColor)),
              const SizedBox(height: 10),
              _buildInfoRow("Funding Goal", "500,000 L.E – 850,000 L.E"),
              _buildDivider(),
              _buildInfoRow("Completed Funding", "0 L.E"),
              _buildDivider(),
              _buildInfoRow("Expected Success Rate", "-%"),
              _buildDivider(),
              _buildInfoRow("Investment State", "Short –Long"),
              _buildDivider(),
              _buildInfoRow("Total Number of investors allowed", "35"),
              _buildDivider(),
              _buildInfoRow("Maximum no.in.short", "20"),
              _buildDivider(),
              _buildInfoRow("Maximum no.in.long", "15"),
              _buildDivider(),
              _buildInfoRow("Investment State", "Short –Long"),
              _buildDivider(),
              _buildInfoRow("Minimum investment", "7,000 L.E"),
              _buildDivider(),
              _buildInfoRow("Maximum investment", "55,000 L.E"),
              _buildDivider(),
              _buildInfoRow("Minimum Short term", "7,000 L.E"),
              _buildDivider(),
              _buildInfoRow("Minimum Long term", "36,000 L.E"),
              _buildDivider(),
              _buildInfoRow("Deadline", "-"),
              _buildDivider(),
              _buildInfoRow("Store Type", "Warehouse – Physical Store"),
              _buildDivider(),
              _buildInfoRow("Location", "New Cairo – Nasr City"),
              _buildDivider(),
              _buildInfoRow("Website", "zerosugarbyetonista.com"),
              _buildDivider(),

              Text("Social",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, color: textColor)),
              const SizedBox(height: 10),
              Row(
                children: const [
                  Icon(FontAwesomeIcons.xTwitter,
                      size: 20, color: Color(0xFF082347)),
                  SizedBox(width: 15),
                  Icon(FontAwesomeIcons.facebook,
                      size: 20, color: Color(0xFF082347)),
                  SizedBox(width: 15),
                  Icon(FontAwesomeIcons.instagram,
                      size: 20, color: Color(0xFF082347)),
                  SizedBox(width: 15),
                  Icon(
                      FontAwesomeIcons
                          .linkedinIn, // تم تعديلها إلى linkedinIn لأيقونة LinkedIn في Font Awesome
                      size: 20,
                      color: Color(0xFF082347)),
                ],
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
      // FloatingActionButton للشات بوت العادي (اللي بيفتح الـ modal)
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showChatBotModal(context); // استدعاء دالة عرض الشات بوت المودال
        },
        backgroundColor: const Color(0xFF082347),
        mini: false,
        shape: const CircleBorder(),
        child: const Icon(Icons.chat_bubble_outline,
            color: Colors.white, size: 28),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
