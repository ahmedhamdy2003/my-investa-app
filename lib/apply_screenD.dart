import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // استيراد مكتبة http
import 'dart:convert'; // لاستخدام json.encode

import 'SubmissionStatus_Screen.dart'; // تأكد من المسار الصحيح

class ApplyScreenD extends StatefulWidget {
  // استقبال كل البيانات المجمعة من الصفحات السابقة
  final Map<String, dynamic> allCollectedData;

  const ApplyScreenD({super.key, required this.allCollectedData});

  @override
  State<ApplyScreenD> createState() => _ApplyScreenDState();
}

class _ApplyScreenDState extends State<ApplyScreenD> {
  // Controllers لحقول الإدخال في هذه الصفحة
  final TextEditingController previousFundingController =
      TextEditingController();
  final TextEditingController strengthsController = TextEditingController();
  final TextEditingController weaknessesController = TextEditingController();
  final TextEditingController opportunitiesController = TextEditingController();
  final TextEditingController threatsController = TextEditingController();
  final TextEditingController competitorsController = TextEditingController();
  final TextEditingController fourPillarsController = TextEditingController();

  // لـ DropdownField
  String? marketSize;

  @override
  void dispose() {
    previousFundingController.dispose();
    strengthsController.dispose();
    weaknessesController.dispose();
    opportunitiesController.dispose();
    threatsController.dispose();
    competitorsController.dispose();
    fourPillarsController.dispose();
    super.dispose();
  }

  // --- دالة إرسال كل البيانات المجمعة (Send) ---
  Future<void> _sendAllCollectedData() async {
    final String sendUrl =
        'https://2859-41-44-137-9.ngrok-free.app/insert_business_details/'; // *** استبدل هذا بـ URL الـ Send الفعلي ***

    // جمع البيانات من الصفحة الحالية
    final Map<String, dynamic> currentPageData = {
      'market_size_egp': marketSize,
      'previous_funding_received': previousFundingController.text,
      'strengths': strengthsController.text,
      'weaknesses': weaknessesController.text,
      'opportunities': opportunitiesController.text,
      'threats': threatsController.text,
      'competitors_info': competitorsController.text,
      'four_pillars_description': fourPillarsController.text,
    };

    // دمج كل البيانات المجمعة من الصفحات السابقة مع بيانات الصفحة الحالية
    final Map<String, dynamic> finalDataToSend = {
      ...widget
          .allCollectedData, // البيانات اللي استقبلتها من الصفحات اللي فاتت
      ...currentPageData, // بيانات الصفحة الرابعة
    };

    print(
        'Sending data: ${json.encode(finalDataToSend)}'); // طباعة البيانات المرسلة للتأكد

    try {
      final response = await http.post(
        Uri.parse(sendUrl),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(finalDataToSend),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        print('All data sent successfully: ${response.body}');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('All data submitted successfully!')),
        );
        // الانتقال لصفحة تأكيد الإرسال
        Navigator.pushReplacement(
          // استخدام pushReplacement لمنع العودة لهذه الصفحة بزر Back
          context,
          MaterialPageRoute(
            builder: (context) => const SubmissionStatusScreen(),
          ),
        );
      } else {
        print('Failed to send all data. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text('Failed to submit all data: ${response.body}')),
        );
      }
    } catch (e) {
      print('Error sending all data: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error submitting all data: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Text(
                  '5. Market and Opportunity Data:',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF082347),
                  ),
                ),
                const SizedBox(height: 10),
                _buildLabel('• Total market size (market_size_egp)'),
                _buildDropdownField(context, [
                  '500,000 - 600,000',
                  '600,000 - 700,000',
                  '700,000 - 800,000',
                  '800,000 - 900,000',
                  '900,000 - 1,000,000'
                ], (value) {
                  setState(() {
                    marketSize = value;
                  });
                }, marketSize),
                _buildLabel(
                    '• Previous funding received, if any (funding_egp)'),
                _buildTextField('type here',
                    controller: previousFundingController),
                const SizedBox(height: 20),
                const Text(
                  '6. SWOT Analysis + Competitors:',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF082347),
                  ),
                ),
                const SizedBox(height: 10),
                _buildLabel('• Strengths'),
                _buildTextField('type here', controller: strengthsController),
                _buildLabel('• Weaknesses'),
                _buildTextField('type here', controller: weaknessesController),
                _buildLabel('• Opportunities'),
                _buildTextField('type here',
                    controller: opportunitiesController),
                _buildLabel('• Threats'),
                _buildTextField('type here', controller: threatsController),
                _buildLabel(
                    '• Number of competitors and their competitive advantages'),
                _buildTextField('type here', controller: competitorsController),
                const SizedBox(height: 20),
                const Text(
                  '7. The Four Pillars:',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF082347),
                  ),
                ),
                const SizedBox(height: 10),
                _buildTextField(
                  ' According to what you specified (e.g., team, product, market, growth,Choose the file )',
                  height: 98,
                  isExpanded: true,
                  controller: fourPillarsController,
                ),
                const SizedBox(height: 30),
                Column(
                  children: [
                    SizedBox(
                      width: 368,
                      height: 61,
                      child: ElevatedButton(
                        onPressed: () {
                          _sendAllCollectedData(); // استدعاء دالة الإرسال الكلية
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF082347),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'Send',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Back',
                        style: TextStyle(
                          color: Color(0xFF082347),
                          fontSize: 24,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 4),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Color(0xFF082347),
        ),
      ),
    );
  }

  Widget _buildTextField(String hint,
      {double height = 44,
      bool isExpanded = false,
      TextEditingController? controller}) {
    return Container(
      width: 328,
      height: height,
      margin: const EdgeInsets.only(bottom: 10),
      child: TextField(
        controller: controller,
        maxLines: isExpanded ? null : 1,
        expands: isExpanded,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.grey),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Color(0xFF082347)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Color(0xFF082347), width: 2),
          ),
        ),
      ),
    );
  }

  Widget _buildDropdownField(BuildContext context, List<String> options,
      Function(String) onChanged, String? selectedValue) {
    TextEditingController controller =
        TextEditingController(text: selectedValue);

    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          builder: (_) {
            return SizedBox(
              height: 300,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: 10),
                itemCount: options.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    dense: true,
                    title: Text(
                      options[index],
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color(0xFF082347),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onTap: () {
                      onChanged(options[index]);
                      Navigator.pop(context);
                    },
                  );
                },
                separatorBuilder: (_, __) => const Divider(height: 1),
              ),
            );
          },
        );
      },
      child: AbsorbPointer(
        child: Container(
          width: 328,
          height: 44,
          margin: const EdgeInsets.only(bottom: 10),
          child: TextField(
            controller: controller,
            readOnly: true,
            decoration: InputDecoration(
              hintText: 'Choose from list',
              hintStyle: const TextStyle(color: Colors.grey),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(color: Color(0xFF082347)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide:
                    const BorderSide(color: Color(0xFF082347), width: 2),
              ),
              suffixIcon: Icon(Icons.arrow_drop_down, color: Color(0xFF082347)),
            ),
          ),
        ),
      ),
    );
  }
}
