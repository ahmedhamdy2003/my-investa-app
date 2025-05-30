// details_screen.dart
import 'package:first_page/amount_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // لاستخدام أيقونات Font Awesome

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  String? _selectedGender; // لتتبع اختيار الجنس
  String? _selectedEmploymentStatus; // لتتبع اختيار حالة التوظيف
  String? _selectedFundSource; // لتتبع اختيار مصدر الدخل

  // دالة للتحقق مما إذا كانت جميع الخيارات قد تم اختيارها
  bool get _isAllSelectionsMade =>
      _selectedGender != null &&
      _selectedEmploymentStatus != null &&
      _selectedFundSource != null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F6FA), // لون الخلفية مطابق للصورة
      appBar: AppBar(
        backgroundColor: Colors.transparent, // شفافية الـ AppBar
        elevation: 0, // إزالة الظل
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios,
              color: Colors.black), // زرار الرجوع
          onPressed: () {
            Navigator.pop(context); // للعودة للصفحة السابقة
          },
        ),

        centerTitle: true,
        actions: const [
          // أيقونات الشبكة والبطارية، ممكن تضيفها هنا لو عايز
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              const Text(
                'Gender',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // لون العنوان زي الصورة
                ),
              ),
              const SizedBox(height: 16),
              // اختيار الجنس
              _buildGenderOption(
                icon: FontAwesomeIcons.mars,
                label: ' Male',
                value: 'male',
                groupValue: _selectedGender,
                onChanged: (value) {
                  setState(() {
                    _selectedGender = value;
                  });
                },
              ),
              const SizedBox(height: 10),
              _buildGenderOption(
                icon: FontAwesomeIcons.venus,
                label: ' Female',
                value: 'female',
                groupValue: _selectedGender,
                onChanged: (value) {
                  setState(() {
                    _selectedGender = value;
                  });
                },
              ),
              const SizedBox(height: 30),

              const Text(
                'Employment Status',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // لون العنوان زي الصورة
                ),
              ),
              const SizedBox(height: 16),
              // حالة التوظيف
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildEmploymentStatusChip('Employed'),
                    const SizedBox(width: 10),
                    _buildEmploymentStatusChip('Self Employed'),
                    const SizedBox(width: 10),
                    _buildEmploymentStatusChip('Unemployed'),
                    const SizedBox(width: 10),
                    _buildEmploymentStatusChip(
                        'Student'), // مثال لإضافة خيارات أخرى
                  ],
                ),
              ),
              const SizedBox(height: 30),

              const Text(
                'What\'s your primary source of\nfund?', // إضافة سطر جديد يدويًا
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // لون العنوان زي الصورة
                ),
              ),
              const SizedBox(height: 16),
              // مصدر الدخل
              GridView.builder(
                shrinkWrap:
                    true, // مهم عشان الـ GridView يبقى جوه SingleChildScrollView
                physics:
                    const NeverScrollableScrollPhysics(), // عشان متتضاربش مع الـ SingleChildScrollView
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // عمودين
                  crossAxisSpacing: 16, // المسافة الأفقية بين البطاقات
                  mainAxisSpacing: 16, // المسافة الرأسية بين البطاقات
                  childAspectRatio:
                      1.8, // نسبة العرض للارتفاع، تم تعديلها لتناسب الارتفاع 64px
                ),
                itemCount: 4, // عدد البطاقات
                itemBuilder: (context, index) {
                  List<Map<String, dynamic>> fundSources = [
                    {
                      'icon': FontAwesomeIcons.moneyBillWave, // أيقونة شبيهة
                      'title': 'Salary',
                      'subtitle': 'I got paid monthly',
                      'value': 'salary',
                    },
                    {
                      'icon': FontAwesomeIcons.piggyBank, // أيقونة شبيهة
                      'title': 'Savings',
                      'subtitle': 'I earn interest',
                      'value': 'savings',
                    },
                    {
                      'icon': FontAwesomeIcons.chartLine, // أيقونة شبيهة
                      'title': 'Passive Income',
                      'subtitle': 'From business',
                      'value': 'passive_income',
                    },
                    {
                      'icon': FontAwesomeIcons.users, // أيقونة شبيهة
                      'title': 'Other',
                      'subtitle': 'Other methods',
                      'value': 'other',
                    },
                  ];
                  return _buildFundSourceCard(
                    icon: fundSources[index]['icon'],
                    title: fundSources[index]['title'],
                    subtitle: fundSources[index]['subtitle'],
                    value: fundSources[index]['value'],
                  );
                },
              ),
              const SizedBox(height: 50), // مسافة قبل الأزرار السفلية
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 90, // ارتفاع شريط التنقل السفلي
        decoration: const BoxDecoration(
          color: Colors.white, // خلفية بيضاء
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, -5),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
        // هنا يتم التغيير: نستخدم Align لوضع الزرار على اليمين
        child: Align(
          alignment: Alignment.centerRight, // محاذاة الزرار لليمين
          child: ElevatedButton(
            // زر Next سيكون مفعّلاً فقط إذا تم اختيار جميع الخيارات
            onPressed: _isAllSelectionsMade
                ? () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AmountScreen(
                          selectedGender: _selectedGender!,
                          selectedEmploymentStatus: _selectedEmploymentStatus!,
                          selectedFundSource: _selectedFundSource!,
                        ),
                      ),
                    );
                  }
                : null, // تعطيل الزر إذا لم يتم الاختيار
            style: ElevatedButton.styleFrom(
              backgroundColor: _isAllSelectionsMade
                  ? const Color(0xff001F3F)
                  : Colors.grey, // يتغير اللون بناءً على حالة الزر
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            ),
            child: const Row(
              mainAxisSize:
                  MainAxisSize.min, // مهم لجعل الـ Row يأخذ أقل مساحة ممكنة
              children: [
                Text(
                  'Next',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(width: 8),
                Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget لبناء خيارات الجنس
  Widget _buildGenderOption({
    required IconData icon,
    required String label,
    required String value,
    required String? groupValue,
    required ValueChanged<String?> onChanged,
  }) {
    bool isSelected = (value == groupValue);
    return InkWell(
      onTap: () => onChanged(value),
      child: Container(
        width: double.infinity, // لجعل الكونتينر يأخذ عرض الشاشة كاملاً
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
          color: const Color(0xFF001F3F), // لون البطاقة أزرق داكن (ثابت هنا)
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? Colors.blueAccent
                : Colors.transparent, // بوردر أزرق فاتح لما يكون مختار
            width: 2,
          ),
        ),
        child: Row(
          children: [
            FaIcon(icon, color: Colors.white, size: 20), // أيقونة الجنس
            const SizedBox(width: 15),
            Expanded(
              child: Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected
                    ? Colors.white
                    : const Color(0xFF738395), // لون الدائرة الداخلية
                border: Border.all(
                  color: isSelected ? Colors.white : Colors.transparent,
                  width: 1.5,
                ),
              ),
              child: isSelected
                  ? const Center(
                      child: Icon(Icons.circle,
                          color: Color(0xFF001F3F),
                          size: 12), // الدائرة الزرقاء الصغيرة
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }

  // Widget لبناء خيارات حالة التوظيف (على شكل أزرار Chips)
  Widget _buildEmploymentStatusChip(String label) {
    bool isSelected = (_selectedEmploymentStatus == label);
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedEmploymentStatus = label;
        });
      },
      child: Container(
        width: 164, // العرض الثابت المطلوب
        height: 98, // الارتفاع الثابت المطلوب
        padding:
            const EdgeInsets.all(16), // زيادة الـ padding ليتناسب مع الارتفاع
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFF001F3F) // لون مختار
              : const Color(0xFF293950), // لون غير مختار
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // توزيع المحتوى
          crossAxisAlignment:
              CrossAxisAlignment.start, // محاذاة النص والأيقونة لليسار
          children: [
            Text(
              label,
              style: TextStyle(
                color:
                    isSelected ? Colors.white : Colors.white, // لون النص أبيض
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            if (isSelected)
              const Icon(Icons.check,
                  color: Colors.white, size: 20), // علامة صح بيضاء
          ],
        ),
      ),
    );
  }

  // Widget لبناء بطاقات مصدر الدخل
  Widget _buildFundSourceCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required String value,
  }) {
    bool isSelected = (_selectedFundSource == value);
    return InkWell(
      onTap: () {
        setState(() {
          _selectedFundSource = value;
        });
      },
      child: Container(
        height: 64, // الارتفاع الثابت المطلوب لكل بطاقة
        padding:
            const EdgeInsets.symmetric(horizontal: 16), // padding أفقي وداخلي
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFF001F3F) // لون مختار
              : const Color(0xFF293950), // لون غير مختار
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          // تغيير Column إلى Row
          children: [
            FaIcon(icon,
                color: isSelected ? Colors.white : Colors.white,
                size: 24), // أيقونة
            const SizedBox(width: 10), // مسافة بين الأيقونة والنصوص
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment:
                    MainAxisAlignment.center, // توسيط رأسي للنصوص
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: isSelected
                          ? Colors.white
                          : Colors.white, // لون العنوان
                      fontSize: 16, // تم تقليل حجم الخط ليناسب الارتفاع
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: isSelected
                          ? Colors.white70
                          : Colors.grey[400], // لون العنوان الفرعي
                      fontSize: 12, // تم تقليل حجم الخط ليناسب الارتفاع
                    ),
                  ),
                ],
              ),
            ),
            if (isSelected)
              const Icon(Icons.check_circle,
                  color: Colors.white, size: 24), // علامة صح بيضاء عند الاختيار
          ],
        ),
      ),
    );
  }
}
