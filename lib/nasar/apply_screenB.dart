import 'package:flutter/material.dart';
import 'apply_screenC.dart';

class ApplyScreenB extends StatefulWidget {
  // استقبال البيانات من الصفحة السابقة
  final Map<String, dynamic> firstPageData;

  const ApplyScreenB({super.key, required this.firstPageData});

  @override
  State<ApplyScreenB> createState() => _ApplyScreenBState();
}

class _ApplyScreenBState extends State<ApplyScreenB> {
  // Controllers لحقول الإدخال في هذه الصفحة
  final TextEditingController fundingEgpController = TextEditingController();
  final TextEditingController equityPercentageController =
      TextEditingController();
  final TextEditingController durationMonthsController =
      TextEditingController();
  final TextEditingController industryController = TextEditingController();
  final TextEditingController targetMarketController = TextEditingController();
  final TextEditingController businessModelController = TextEditingController();

  // لـ DropdownFields
  String? founderExperience;
  String? teamSize;

  @override
  void dispose() {
    fundingEgpController.dispose();
    equityPercentageController.dispose();
    durationMonthsController.dispose();
    industryController.dispose();
    targetMarketController.dispose();
    businessModelController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Great , Know enter your previous\ndata about your business & funding\ngoals',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  height: 1.4,
                  color: Color(0xFF082347),
                ),
              ),
              const SizedBox(height: 20),

              // Section 1
              const Text(
                '1. Funding and Investment Data:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF082347),
                ),
              ),
              const SizedBox(height: 10),
              _buildLabel('• Required funding amount in EGP (funding_egp)'),
              _buildTextField('type here', controller: fundingEgpController),

              _buildLabel('• Ownership percentage (equity_percentage)'),
              _buildTextField('type here',
                  controller: equityPercentageController),

              _buildLabel(
                  '• Desired investment duration in months (duration_months)'),
              _buildTextField('type here',
                  controller: durationMonthsController),

              const SizedBox(height: 20),

              // Section 2
              const Text(
                '2. Project and Market Details:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF082347),
                ),
              ),
              const SizedBox(height: 10),
              _buildLabel(
                  '• Industry / Category (industry: Food, Fashion, Cosmetics, etc.)'),
              _buildTextField('type here', controller: industryController),

              _buildLabel(
                  '• Target market (target_market: age groups, geographic location, consumer type)'),
              _buildTextField('Global or Regional or local',
                  controller: targetMarketController),

              _buildLabel(
                  '• Business model (business_model: B2C, B2B, Subscription.)'),
              _buildTextField('B2C Or B2B Or Subscription or Marketplace',
                  controller: businessModelController),

              const SizedBox(height: 20),

              // Section 3
              const Text(
                '3. Team and Experience Data:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF082347),
                ),
              ),
              const SizedBox(height: 10),
              _buildLabel(
                  '• Founder\'s years of experience (founder_experience_years)'),
              _buildDropdownField(context, [
                '1–3',
                '4–6',
                '7–9',
                '10–12',
                '13–15',
              ], (value) {
                // هنا الـ onChanged callback
                setState(() {
                  founderExperience = value;
                });
              }, founderExperience), // تمرير القيمة المختارة

              _buildLabel('• Team size (team_size)'),
              _buildDropdownField(context, [
                '1',
                '2–5',
                '6–9',
                '10–14',
                '15–18',
                '19–22',
                '23–25',
              ], (value) {
                // هنا الـ onChanged callback
                setState(() {
                  teamSize = value;
                });
              }, teamSize), // تمرير القيمة المختارة

              const SizedBox(height: 30),

              // Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF082347),
                    ),
                    child: IconButton(
                      onPressed: () {
                        // جمع البيانات من الصفحة الحالية
                        final Map<String, dynamic> currentPageData = {
                          'funding_egp': fundingEgpController.text,
                          'equity_percentage': equityPercentageController.text,
                          'duration_months': durationMonthsController.text,
                          'industry': industryController.text,
                          'target_market': targetMarketController.text,
                          'business_model': businessModelController.text,
                          'founder_experience_years': founderExperience,
                          'team_size': teamSize,
                        };

                        // دمج البيانات من الصفحة الأولى مع بيانات الصفحة الحالية
                        final Map<String, dynamic> combinedData = {
                          ...widget.firstPageData,
                          ...currentPageData,
                        };

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ApplyScreenC(allCollectedData: combinedData),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  )
                ],
              ),
            ],
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

  Widget _buildTextField(String hint, {TextEditingController? controller}) {
    return Container(
      width: 328,
      height: 44,
      margin: const EdgeInsets.only(bottom: 10),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.grey),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
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
        TextEditingController(text: selectedValue); // عرض القيمة المختارة

    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          builder: (_) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: options.map((option) {
                  return ListTile(
                    dense: true,
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    title: Text(
                      option,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color(0xFF082347),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onTap: () {
                      onChanged(option); // استدعاء الـ callback لتحديث القيمة
                      Navigator.pop(context);
                    },
                  );
                }).toList(),
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
            readOnly: true, // لمنع الكتابة المباشرة
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
              suffixIcon: const Icon(Icons.arrow_drop_down,
                  color: Color(0xFF082347)), // إضافة سهم لأسفل
            ),
          ),
        ),
      ),
    );
  }
}
