// amount_screen.dart
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // Import http
import 'dart:convert';

import 'package:investa4/nasar/typeINvest_screen.dart'; // Import for jsonEncode

class AmountScreen extends StatefulWidget {
  // استقبال البيانات من DetailsScreen
  final String selectedGender;
  final String selectedEmploymentStatus;
  final String selectedFundSource;

  const AmountScreen({
    super.key,
    required this.selectedGender,
    required this.selectedEmploymentStatus,
    required this.selectedFundSource,
  });

  @override
  State<AmountScreen> createState() => _AmountScreenState();
}

class _AmountScreenState extends State<AmountScreen> {
  // متغيرات لتخزين قيم الدخل والمدخرات
  int _monthlyIncome = 0;
  int _monthlySave = 0;

  // دالة لزيادة القيمة بمقدار 100
  void _incrementValue(String type) {
    setState(() {
      if (type == 'income') {
        _monthlyIncome += 100;
      } else if (type == 'save') {
        _monthlySave += 100;
      }
    });
  }

  // دالة لإنقاص القيمة بمقدار 100 (مع التأكد أنها لا تقل عن 0)
  void _decrementValue(String type) {
    setState(() {
      if (type == 'income') {
        _monthlyIncome =
            (_monthlyIncome - 100)
                .clamp(0, double.infinity)
                .toInt(); // لا تقل عن 0
      } else if (type == 'save') {
        _monthlySave =
            (_monthlySave - 100)
                .clamp(0, double.infinity)
                .toInt(); // لا تقل عن 0
      }
    });
  }

  // دالة لتنسيق الرقم كعملة مصرية
  String _formatCurrency(int amount) {
    return '${amount.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')},00 LE';
  }

  // دالة لإرسال جميع البيانات إلى الباك إند
  void _sendDetailsToBackendAndNavigate() async {
    // يمكنك عرض مؤشر تحميل هنا
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Sending details to server...")),
    );

    // تعريف رابط الـ API الخاص بالباك إند
    // **مهم جداً: استبدل هذا بالرابط الفعلي لنقطة نهاية الـ API في Django**
    const String apiUrl =
        'https://2859-41-44-137-9.ngrok-free.app/account-verificiation/'; // مثال على الرابط

    try {
      final Map<String, dynamic> dataToSend = {
        'gender': widget.selectedGender,
        'employment_status': widget.selectedEmploymentStatus,
        'primary_source_of_fund': widget.selectedFundSource,
        'monthly_income': _monthlyIncome,
        'monthly_save': _monthlySave,
        // يمكنك إضافة أي بيانات أخرى للمستخدم هنا (مثل user_id)
      };

      final http.Response response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          // إذا كان الـ API يتطلب توثيق (مثل توكن JWT)، أضف هنا:
          // 'Authorization': 'Bearer YOUR_AUTH_TOKEN_HERE',
        },
        body: jsonEncode(dataToSend),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        // تم إرسال البيانات بنجاح
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Color(0xff4CAF50), // أخضر للنجاح
            content: Text("Details submitted successfully!"),
          ),
        );
        // الانتقال للصفحة التالية بعد نجاح الاتصال بالـ API
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const TypeInvestScreen()),
        );
      } else {
        // فشل اتصال الـ API
        final Map<String, dynamic> errorData = json.decode(response.body);
        String errorMessage =
            errorData['message'] ??
            'Failed to submit details. Please try again.';
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: const Color(0xffF44336), // أحمر للخطأ
            content: Text("Error: $errorMessage"),
          ),
        );
        print(
          'Failed to submit details: ${response.statusCode} - ${response.body}',
        );
      }
    } catch (e) {
      // خطأ في الشبكة
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Color(0xffF44336), // أحمر للخطأ
          content: Text("Network error: Could not connect to the server."),
        ),
      );
      print('Error sending details: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F6FA), // لون الخلفية مطابق للصورة
      appBar: AppBar(
        backgroundColor: Colors.transparent, // شفافية الـ AppBar
        elevation: 0, // إزالة الظل
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ), // زرار الرجوع
          onPressed: () {
            Navigator.pop(context); // للعودة للصفحة السابقة
          },
        ),

        centerTitle: true,
        // يمكنك إضافة أيقونات الشبكة والبطارية هنا إذا أردت
        actions: const [
          Icon(Icons.signal_cellular_alt, color: Colors.black, size: 20),
          SizedBox(width: 8),
          Icon(Icons.wifi, color: Colors.black, size: 20),
          SizedBox(width: 8),
          Icon(Icons.battery_full, color: Colors.black, size: 20),
          SizedBox(width: 16),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            // قسم الدخل الشهري
            const Text(
              'How much are you making\nmonthly?', // إضافة سطر جديد يدويًا
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black, // لون العنوان زي الصورة
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Monthly Income',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            _buildAmountSelector(
              currentAmount: _monthlyIncome,
              onIncrement: () => _incrementValue('income'),
              onDecrement: () => _decrementValue('income'),
            ),
            const SizedBox(height: 8),
            Text(
              'I make around  £ ${_formatCurrency(_monthlyIncome).replaceAll(' LE', '')} monthly.', // هنا بنستخدم القيمة الفعلية
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),

            const SizedBox(height: 40), // مسافة بين القسمين
            // قسم المدخرات الشهرية
            const Text(
              'How much income do you save\nmonthly?', // إضافة سطر جديد يدويًا
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black, // لون العنوان زي الصورة
              ),
            ),

            const SizedBox(height: 16),
            const Text(
              'Monthly Save',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            _buildAmountSelector(
              currentAmount: _monthlySave,
              onIncrement: () => _incrementValue('save'),
              onDecrement: () => _decrementValue('save'),
            ),
            const SizedBox(height: 8),

            // لا يوجد نص توضيحي هنا في الصورة، ولكن يمكن إضافته إذا لزم الأمر
            const Spacer(), // يدفع باقي العناصر للأسفل
            // أزرار Confirm و Back
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed:
                    _sendDetailsToBackendAndNavigate, // استدعاء الدالة الجديدة
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(
                    0xff001F3F,
                  ), // اللون الأزرق الداكن
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: const Text(
                  'Confirm',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10), // مسافة بين الأزرار

            const SizedBox(height: 40), // مسافة من الأسفل
          ],
        ),
      ),
    );
  }

  // Widget مساعد لبناء جزء تحديد المبلغ
  Widget _buildAmountSelector({
    required int currentAmount,
    required VoidCallback onIncrement,
    required VoidCallback onDecrement,
  }) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // زر النقصان (-)
            GestureDetector(
              onTap: onDecrement,
              child: Container(
                width: 48, // حجم ثابت للأزرار
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.transparent, // شفاف
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: const Color(0xFFAEB7C1), // لون الحدود
                    width: 2,
                  ),
                ),
                child: const Icon(Icons.remove, color: Colors.black, size: 24),
              ),
            ),
            // عرض المبلغ
            Expanded(
              child: Center(
                child: Text(
                  _formatCurrency(currentAmount),
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            // زر الزيادة (+)
            GestureDetector(
              onTap: onIncrement,
              child: Container(
                width: 48, // حجم ثابت للأزرار
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.transparent, // شفاف
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: const Color(0xFFAEB7C1), // لون الحدود
                    width: 2,
                  ),
                ),
                child: const Icon(Icons.add, color: Colors.black, size: 24),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8), // مسافة تحت الأزرار
        Container(
          // الخط الفاصل
          height: 1.0,
          color: Colors.grey[300],
        ),
      ],
    );
  }
}
