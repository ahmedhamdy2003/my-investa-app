// great_screen.dart
import 'package:flutter/material.dart';
import 'details_screen.dart'; // **أضف هذا السطر لاستيراد صفحة DetailsScreen**

class GreatScreen extends StatelessWidget {
  const GreatScreen({super.key, String? userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F6FA), // لون الخلفية مطابق للصورة
      appBar: AppBar(
        // AppBar شفافة بدون عناصر، زي الصورة
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false, // بيخفي زرار الـ back الافتراضي
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // يبدأ من الشمال
          children: [
            const SizedBox(height: 20), // مسافة من فوق

            const Text(
              'Great,Let\'s Setup your account',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF082347), // لون النص الأزرق الداكن
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'To complete your registration process, you will need to Fill',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey, // هذا النص لونه رمادي في الصورة
              ),
            ),
            const SizedBox(height: 40), // مسافة قبل الخطوات
            // خطوات الـ setup
            _buildSetupStep(
              number: 1,
              title: 'Financial Assessment',
              description:
                  'Help us to know your mare so you can invest easily.',
              isDone: true, // الخطوة الأولى معمول عليها علامة صح
              isCurrent: false, // ليست الخطوة الحالية
            ),
            // المسافة والخط الواصل بعد الخطوة الأولى
            const SizedBox(height: 12), // مسافة بين الدائرة والخط
            _buildConnectorLine(), // الخط العمودي بين الخطوات
            const SizedBox(height: 12), // مسافة بين الخط والدائرة التالية

            _buildSetupStep(
              number: 2,
              title: 'Account Verification',
              description: 'Complete the steps to be Verified!',
              isDone: false, // الخطوة الثانية مش معمول عليها علامة صح
              isCurrent: true, // هذه هي الخطوة الحالية
            ),
            // المسافة والخط الواصل بعد الخطوة الثانية
            const SizedBox(height: 12), // مسافة بين الدائرة والخط
            _buildConnectorLine(), // الخط العمودي بين الخطوات
            const SizedBox(height: 12), // مسافة بين الخط والدائرة التالية

            _buildSetupStep(
              number: 3,
              title: 'Start to Explore & Invest',
              description: '', // مافيش وصف للخطوة دي في الصورة
              isDone: false, // الخطوة الثالثة مش معمول عليها علامة صح
              isCurrent: false, // ليست الخطوة الحالية
            ),

            const Spacer(), // يدفع باقي العناصر للأسفل
            // زرار Confirm
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  // **هنا يتم الانتقال إلى صفحة DetailsScreen**
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DetailsScreen(),
                    ),
                  );
                  print('Confirm button pressed. Navigate to DetailsScreen.');
                },
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
            const SizedBox(height: 20), // مسافة بعد الزرار
            // Frame 8 - Secured Data
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(bottom: 20), // مسافة من تحت خالص
              child: const Column(
                children: [
                  // 'Frame 8' هذا النص غير ظاهر بوضوح في الصورة النهائية في هذا المكان، يمكن إزالته أو تغيير مكانه
                  // Text(
                  //   'Frame 8',
                  //   style: TextStyle(
                  //     fontSize: 16,
                  //     color: Colors.grey,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.laptop_mac,
                        color: Colors.grey,
                        size: 20,
                      ), // أيقونة الكمبيوتر
                      SizedBox(width: 8),
                      Text(
                        'Secured Data, Assured Future',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget مساعد لبناء كل خطوة من خطوات الـ setup
  Widget _buildSetupStep({
    required int number,
    required String title,
    String? description,
    required bool isDone,
    required bool isCurrent, // للإشارة إلى الخطوة الحالية
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // الجزء بتاع الدائرة أو علامة الصح / الدائرة الحدودية
        Container(
          width: isCurrent ? 45 : 40, // حجم أكبر للخطوة الحالية
          height: isCurrent ? 45 : 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color:
                isDone
                    ? const Color(0xFF53D258) // لون أخضر للدائرة المكتملة
                    : const Color(
                      0xFF738395,
                    ), // لون الخلفية للدائرة غير المكتملة
            border:
                isCurrent
                    ? Border.all(
                      color: const Color(
                        0xFFAEB7C1,
                      ), // لون الحدود للخطوة الحالية
                      width: 3.0, // سمك الحدود، تم زيادته ليظهر بوضوح
                    )
                    : null, // لا يوجد حدود للخطوات الأخرى (بما في ذلك الدائرة الثالثة)
          ),
          child: Center(
            child:
                isDone
                    ? const Icon(
                      Icons.check,
                      color: Colors.black,
                      size: 24,
                    ) // علامة صح سوداء
                    : Text(
                      number.toString(),
                      style: TextStyle(
                        color: const Color(
                          0xFF001F3F,
                        ), // لون الرقم ثابت للغير مكتمل
                        fontSize:
                            isCurrent
                                ? 22
                                : 20, // حجم أكبر للرقم في الخطوة الحالية
                        fontWeight: FontWeight.bold,
                      ),
                    ),
          ),
        ),
        const SizedBox(width: 16),
        // الجزء بتاع العنوان والوصف
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF082347), // لون ثابت للنصوص كلها
                ),
              ),
              if (description != null && description.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(
                    description,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey, // لون الوصف رمادي
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }

  // Widget جديد لبناء الخط العمودي بين الخطوات
  Widget _buildConnectorLine() {
    return Padding(
      // Padding here to align the line directly under the center of the step circle
      // تم تعديل الـ left padding ليتناسب مع حجم الدائرة الجديد
      padding: const EdgeInsets.only(left: 21.5),
      child: Container(
        width: 2.0, // سُمك الخط
        height: 38, // ارتفاع الخط ليربط بين الخطوات، تم ضبطه ليتناسب مع التباعد
        color: const Color(0xFFAEB7C1), // لون الخط الموصل
      ),
    );
  }
}
