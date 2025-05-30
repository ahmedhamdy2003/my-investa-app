import 'package:first_page/apply_screenD.dart';
import 'package:flutter/material.dart';

class ApplyScreenC extends StatefulWidget {
  // استقبال البيانات المجمعة من الصفحات السابقة
  final Map<String, dynamic> allCollectedData;

  const ApplyScreenC({super.key, required this.allCollectedData});

  @override
  State<ApplyScreenC> createState() => _ApplyScreenCState();
}

class _ApplyScreenCState extends State<ApplyScreenC> {
  // Controllers لحقول الإدخال في هذه الصفحة
  final TextEditingController revenueController = TextEditingController();
  final TextEditingController revenueGrowthController = TextEditingController();
  final TextEditingController profitMarginController = TextEditingController();
  final TextEditingController netProfitController = TextEditingController();
  final TextEditingController branchesCountController = TextEditingController();
  final TextEditingController customersController = TextEditingController();
  final TextEditingController customerGrowthController =
      TextEditingController();
  final TextEditingController operatingCostsController =
      TextEditingController();
  final TextEditingController debtToProfitRatioController =
      TextEditingController();

  // لـ DropdownField
  String? repeatPurchaseRate;

  @override
  void dispose() {
    revenueController.dispose();
    revenueGrowthController.dispose();
    profitMarginController.dispose();
    netProfitController.dispose();
    branchesCountController.dispose();
    customersController.dispose();
    customerGrowthController.dispose();
    operatingCostsController.dispose();
    debtToProfitRatioController.dispose();
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
              const SizedBox(height: 20),
              const Text(
                '4. Financial and Operational Indicators:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff082347),
                ),
              ),
              const SizedBox(height: 10),
              _buildLabel('• Revenue size (revenue)'),
              _buildTextField('type here', controller: revenueController),
              _buildLabel(
                  '• Monthly or annual revenue growth rate (revenue_growth %)'),
              _buildTextField('type here', controller: revenueGrowthController),
              _buildLabel('• Profit margin (profit_margin %)'),
              _buildTextField('type here', controller: profitMarginController),
              _buildLabel('• Net profit (profit)'),
              _buildTextField('type here', controller: netProfitController),
              _buildLabel('• Repeat purchase rate (repeat_purchase_rate %)'),
              _buildDropdownField(context, [
                '0.1',
                '0.2',
                '0.3',
                '0.4',
                '0.5',
                '0.6',
                '0.7',
                '0.8',
                '0.9'
              ], (value) {
                setState(() {
                  repeatPurchaseRate = value;
                });
              }, repeatPurchaseRate),
              _buildLabel('• Number of branches (branches_count)'),
              _buildTextField('type here', controller: branchesCountController),
              _buildLabel('• Current number of customers (customers)'),
              _buildTextField('type here', controller: customersController),
              _buildLabel('• Customer growth rate (customer_growth %)'),
              _buildTextField('type here',
                  controller: customerGrowthController),
              _buildLabel('• Monthly operational costs (operating_costs)'),
              _buildTextField('type here',
                  controller: operatingCostsController),
              _buildLabel('• Debt-to-profit ratio (debt_to_profit_ratio %)'),
              _buildTextField('type here',
                  controller: debtToProfitRatioController),
              const SizedBox(height: 30),
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
                          'revenue': revenueController.text,
                          'revenue_growth': revenueGrowthController.text,
                          'profit_margin': profitMarginController.text,
                          'profit': netProfitController.text,
                          'repeat_purchase_rate': repeatPurchaseRate,
                          'branches_count': branchesCountController.text,
                          'customers': customersController.text,
                          'customer_growth': customerGrowthController.text,
                          'operating_costs': operatingCostsController.text,
                          'debt_to_profit_ratio':
                              debtToProfitRatioController.text,
                        };

                        // دمج كل البيانات المجمعة حتى الآن
                        final Map<String, dynamic> combinedData = {
                          ...widget.allCollectedData,
                          ...currentPageData,
                        };

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ApplyScreenD(allCollectedData: combinedData),
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
              height: 300, // ارتفاع البوتوم شيت
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
