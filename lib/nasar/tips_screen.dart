import 'package:flutter/material.dart';
import 'apply_screen.dart'; // تأكد إن الملف موجود في نفس المسار أو عدل المسار لو مختلف

class TipsScreen extends StatelessWidget {
  // أضف هذه الخاصية لاستقبال الـ userId
  final String? userId;

  // عدّل الـ constructor لاستقبال الـ userId
  const TipsScreen({super.key, this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // أضف AppBar لإظهار زر الرجوع بسهولة
        title: const Text(
          "Application Guidelines",
          style: TextStyle(color: Color(0xFF0A1F44)),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF0A1F44)),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // // [DEBUG] لعرض الـ userId للتأكد من وصوله
                    // if (userId != null && userId!.isNotEmpty)
                    //   Padding(
                    //     padding: const EdgeInsets.only(bottom: 10.0),
                    //     child: Text(
                    //       "User ID: $userId",
                    //       style: const TextStyle(
                    //         fontSize: 12,
                    //         color: Colors.grey,
                    //       ),
                    //     ),
                    //   ),
                    const Text(
                      "✅ Application Conditions & Eligibility:\nTo qualify for the platform showcase and to get support from investors, you must meet the following criteria:",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0A1F44),
                      ),
                    ),
                    const SizedBox(height: 12),
                    _buildBulletPoint(
                      "Be at least 18 years old at the time of application.",
                    ),
                    _buildBulletPoint(
                      "If under 18, a legal guardian must apply and sign all documents on your behalf.",
                    ),
                    _buildBulletPoint(
                      "Legally reside within the Arab Republic of Egypt.",
                    ),
                    _buildBulletPoint(
                      "Have the full legal right to manage your business and benefit from funding.",
                    ),
                    _buildBulletPoint(
                      "The project has been operational for at least 12 months, with actual financial data such as:\n   • Revenues, profits, number of customers,\n   • Growth rate, expenses, and others.",
                    ),
                    _buildBulletPoint(
                      "Applications are not accepted from anyone:",
                    ),
                    _buildBulletPoint(
                      "    Currently working or employed in the last 12 months in any entity affiliated with the platform's development or management team.",
                    ),
                    _buildBulletPoint(
                      "    Has a direct relation or first-degree kinship with anyone working currently in the platform or its technical partners.",
                    ),
                    _buildBulletPoint(
                      "    Has been convicted of a felony in the last 10 years, unless the record has been expunged or a formal pardon has been issued.",
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "The platform's management reserves the right to:",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0A1F44),
                      ),
                    ),
                    const SizedBox(height: 8),
                    _buildBulletPoint(
                      "Accept or reject any application based on their criteria.",
                    ),
                    _buildBulletPoint(
                      "Conduct qualifying interviews or request additional supporting data.",
                    ),
                    _buildBulletPoint(
                      "Suspend or cancel participation at any time if the terms are violated or false data is provided.",
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "🎯 Our Goal:",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0A1F44),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "To support serious local projects with a clear growth plan and real added value to the Egyptian market.\n\n"
                      "If you have a ready project for funding and launch, we're here to help you realize it!\n\n"
                      "📩 Ready to get started?\n"
                      "Apply now and begin your journey to attract investors and achieve your project goals in the real world.",
                      style: TextStyle(
                        fontSize: 14,
                        height: 1.5,
                        color: Color(0xFF0A1F44),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: 164,
                height: 61,
                child: ElevatedButton(
                  onPressed: () {
                    // قم بتمرير الـ userId إلى ApplyScreen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ApplyScreen(userId: userId),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0A2640),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Ready',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "• ",
            style: TextStyle(fontSize: 16, color: Color(0xFF0A1F44)),
          ),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 14,
                height: 1.5,
                color: Color(0xFF0A1F44),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
