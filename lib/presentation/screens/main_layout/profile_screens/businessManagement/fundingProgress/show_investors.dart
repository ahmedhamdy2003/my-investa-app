import 'package:flutter/material.dart';
import 'package:investa4/core/assets_managers.dart';
import '../../../../../../core/routes_manager/colors_managers.dart';

class ShowInvestors extends StatelessWidget {
  const ShowInvestors({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManagers.white,

      appBar: AppBar(
        leading: Container(
          margin: EdgeInsets.all(8), // هامش حول الدائرة
          decoration: BoxDecoration(
            shape: BoxShape.circle, // شكل دائري
            color: ColorsManagers.darkBlue, // لون الخلفية
          ),
          child: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white), // لون السهم أبيض
            onPressed: () => Navigator.pop(context), // وظيفة الرجوع
          ),
        ),
        backgroundColor: Colors.white,
        title: const Text('FundingProgress', style: TextStyle(color: Colors.black)),
        centerTitle: false,
        elevation: 0,
      ),

      body: Column(
        children: [
          // الحقل الفارغ فوق الصورة (لن نستخدم Expanded هنا)
          const SizedBox(height: 40), // مسافة من الأعلى قبل الصورة

          // الجزء الذي يحتوي على الصورة في المنتصف
          Expanded(
            child: Center(
              child: Image.asset(
                AssetsManagers.investors, // تأكد أن المسار صحيح
                fit: BoxFit.contain, // لتظهر الصورة كاملة بدون قص
                width: 300, // يمكنك تعديل العرض حسب الحاجة
                height: 300, // يمكنك تعديل الارتفاع حسب الحاجة
              ),
            ),
          ),

          // الحقل الفارغ تحت الصورة (اختياري)
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}