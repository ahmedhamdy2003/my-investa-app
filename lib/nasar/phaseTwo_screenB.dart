// phaseTwo_screenB.dart
import 'package:flutter/material.dart';
// Removed http import as it's no longer sending data from here
// Removed dart:typed_data as it's not directly handling bytes here anymore

import 'package:investa4/nasar/phaseTwo_screenC.dart'; // Navigation to the next screen

class PhaseTwoScreenB extends StatefulWidget {
  // 1. إضافة projectId كـ parameter مطلوب في constructor
  final String projectId;
  final Map<String, dynamic> allCollectedData; // Data from previous screens

  // 2. تحديث الـ constructor ليطلب projectId
  const PhaseTwoScreenB({
    super.key,
    required this.allCollectedData,
    required this.projectId,
  });

  @override
  State<PhaseTwoScreenB> createState() => _PhaseTwoScreenBState();
}

class _PhaseTwoScreenBState extends State<PhaseTwoScreenB> {
  // Controllers for text fields in this screen
  final TextEditingController annualRevenueController = TextEditingController();
  final TextEditingController monthlyGrowthRateController =
      TextEditingController();
  final TextEditingController netProfitController = TextEditingController();
  final TextEditingController currentCustomersController =
      TextEditingController();
  final TextEditingController repeatPurchaseRateController =
      TextEditingController();
  final TextEditingController numberOfBranchesController =
      TextEditingController();
  final TextEditingController customerGrowthRateController =
      TextEditingController();
  final TextEditingController churnRateController = TextEditingController();
  final TextEditingController monthlyOperatingCostsController =
      TextEditingController();
  final TextEditingController debtToEquityRatioController =
      TextEditingController();
  final TextEditingController fundingNeededController = TextEditingController();
  final TextEditingController ownershipPercentageController =
      TextEditingController();
  final TextEditingController investmentTypeController =
      TextEditingController();
  final TextEditingController totalInvestorsAllowedController =
      TextEditingController();
  final TextEditingController maxInvestorShortController =
      TextEditingController();
  final TextEditingController maxInvestorLongController =
      TextEditingController(); // Assuming this is for long term

  @override
  void initState() {
    super.initState();
    // Initialize controllers with any existing data if navigating back
    annualRevenueController.text =
        widget.allCollectedData['annualRevenue'] ?? '';
    monthlyGrowthRateController.text =
        widget.allCollectedData['monthlyGrowthRate'] ?? '';
    netProfitController.text = widget.allCollectedData['netProfit'] ?? '';
    currentCustomersController.text =
        widget.allCollectedData['currentCustomers'] ?? '';
    repeatPurchaseRateController.text =
        widget.allCollectedData['repeatPurchaseRate'] ?? '';
    numberOfBranchesController.text =
        widget.allCollectedData['numberOfBranches'] ?? '';
    customerGrowthRateController.text =
        widget.allCollectedData['customerGrowthRate'] ?? '';
    churnRateController.text = widget.allCollectedData['churnRate'] ?? '';
    monthlyOperatingCostsController.text =
        widget.allCollectedData['monthlyOperatingCosts'] ?? '';
    debtToEquityRatioController.text =
        widget.allCollectedData['debtToEquityRatio'] ?? '';
    fundingNeededController.text =
        widget.allCollectedData['fundingNeeded'] ?? '';
    ownershipPercentageController.text =
        widget.allCollectedData['ownershipPercentage'] ?? '';
    investmentTypeController.text =
        widget.allCollectedData['investmentType'] ?? '';
    totalInvestorsAllowedController.text =
        widget.allCollectedData['totalInvestorsAllowed'] ?? '';
    maxInvestorShortController.text =
        widget.allCollectedData['maxInvestorShort'] ?? '';
    maxInvestorLongController.text =
        widget.allCollectedData['maxInvestorLong'] ??
        ''; // Initialize if needed
  }

  @override
  void dispose() {
    annualRevenueController.dispose();
    monthlyGrowthRateController.dispose();
    netProfitController.dispose();
    currentCustomersController.dispose();
    repeatPurchaseRateController.dispose();
    numberOfBranchesController.dispose();
    customerGrowthRateController.dispose();
    churnRateController.dispose();
    monthlyOperatingCostsController.dispose();
    debtToEquityRatioController.dispose();
    fundingNeededController.dispose();
    ownershipPercentageController.dispose();
    investmentTypeController.dispose();
    totalInvestorsAllowedController.dispose();
    maxInvestorShortController.dispose();
    maxInvestorLongController.dispose();
    super.dispose();
  }

  // Helper to collect data from this screen and merge with previous data
  Map<String, dynamic> _collectAndMergeData() {
    Map<String, dynamic> currentScreenData = {
      'annualRevenue': annualRevenueController.text.trim(),
      'monthlyGrowthRate': monthlyGrowthRateController.text.trim(),
      'netProfit': netProfitController.text.trim(),
      'currentCustomers': currentCustomersController.text.trim(),
      'repeatPurchaseRate': repeatPurchaseRateController.text.trim(),
      'numberOfBranches': numberOfBranchesController.text.trim(),
      'customerGrowthRate': customerGrowthRateController.text.trim(),
      'churnRate': churnRateController.text.trim(),
      'monthlyOperatingCosts': monthlyOperatingCostsController.text.trim(),
      'debtToEquityRatio': debtToEquityRatioController.text.trim(),
      'fundingNeeded': fundingNeededController.text.trim(),
      'ownershipPercentage': ownershipPercentageController.text.trim(),
      'investmentType': investmentTypeController.text.trim(),
      'totalInvestorsAllowed': totalInvestorsAllowedController.text.trim(),
      'maxInvestorShort': maxInvestorShortController.text.trim(),
      'maxInvestorLong': maxInvestorLongController.text.trim(),
    };
    return {...widget.allCollectedData, ...currentScreenData}; // Merge maps
  }

  // Removed _sendDataToBackend function from here

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
                'Financial and Marketing Information (Essential for Investors):',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff082347),
                ),
              ),
              const SizedBox(height: 10),
              _buildLabel('•Annual / Quarterly Revenue'),
              _buildTextField(
                'type here',
                controller: annualRevenueController,
                keyboardType: TextInputType.number,
              ),
              _buildLabel('• Monthly Growth Rate (%)'),
              _buildTextField(
                'type here',
                controller: monthlyGrowthRateController,
                keyboardType: TextInputType.number,
              ),
              _buildLabel('• Net Profit'),
              _buildTextField(
                'type here',
                controller: netProfitController,
                keyboardType: TextInputType.number,
              ),
              _buildLabel('•Number of Current Customers'),
              _buildTextField(
                'type here',
                controller: currentCustomersController,
                keyboardType: TextInputType.number,
              ),
              _buildLabel('• Repeat Purchase Rate'),
              _buildDropdownField(context, [
                '0.1',
                '0.2',
                '0.3',
                '0.4',
                '0.5',
                '0.6',
                '0.7',
                '0.8',
                '0.9',
              ], controller: repeatPurchaseRateController),
              _buildLabel('•Number of Branches'),
              _buildTextField(
                'type here',
                controller: numberOfBranchesController,
                keyboardType: TextInputType.number,
              ),
              _buildLabel('• Customer Growth Rate (%)'),
              _buildTextField(
                'type here',
                controller: customerGrowthRateController,
                keyboardType: TextInputType.number,
              ),
              _buildLabel('• Churn Rate'),
              _buildTextField(
                'type here',
                controller: churnRateController,
                keyboardType: TextInputType.number,
              ),
              _buildLabel('• Monthly Operating Costs'),
              _buildTextField(
                'type here',
                controller: monthlyOperatingCostsController,
                keyboardType: TextInputType.number,
              ),
              _buildLabel('• Debt-to-Equity Ratio'),
              _buildTextField(
                'type here',
                controller: debtToEquityRatioController,
                keyboardType: TextInputType.number,
              ),
              _buildLabel('• Funding Needed (in L.E)'),
              _buildTextField(
                'type here',
                controller: fundingNeededController,
                keyboardType: TextInputType.number,
              ),
              _buildLabel(
                '• Ownership Percentage Offered in Exchange for Funding (Equity %)',
              ),
              _buildTextField(
                'type here',
                controller: ownershipPercentageController,
                keyboardType: TextInputType.number,
              ),
              _buildLabel(
                '•Type of Investment Needed (Short-term or Long-term)',
              ),
              _buildDropdownField(context, [
                'Short',
                'Long',
                'Short&Long',
              ], controller: investmentTypeController),
              _buildLabel('• Total Number of investors allowed '),
              _buildTextField(
                'type here',
                controller: totalInvestorsAllowedController,
                keyboardType: TextInputType.number,
              ),
              _buildLabel('• Maximum number of investor short  '),
              _buildTextField(
                'type here',
                controller: maxInvestorShortController,
                keyboardType: TextInputType.number,
              ),
              _buildLabel(
                '• Maximum number of investor long  ',
              ), // Corrected label
              _buildTextField(
                'type here',
                controller: maxInvestorLongController,
                keyboardType: TextInputType.number,
              ),
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
                        // Collect and merge data from this screen
                        Map<String, dynamic> mergedData =
                            _collectAndMergeData();

                        // 3. تمرير الـ projectId المستلم إلى الشاشة التالية
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => PhaseTwoScreenC(
                                  allCollectedData: mergedData,
                                  projectId: widget.projectId,
                                ), // تمرير projectId
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

  Widget _buildTextField(
    String hint, {
    TextEditingController? controller,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Container(
      width: 328,
      height: 44,
      margin: const EdgeInsets.only(bottom: 10),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.grey),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 10,
          ),
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

  Widget _buildDropdownField(
    BuildContext context,
    List<String> options, {
    TextEditingController? controller,
  }) {
    controller ??= TextEditingController(); // Ensure controller is not null

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
                      setState(() {
                        controller!.text = options[index];
                      });
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
            readOnly: true, // Make it read-only for dropdown
            decoration: InputDecoration(
              hintText: 'Choose from list',
              hintStyle: const TextStyle(color: Colors.grey),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 10,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(color: Color(0xFF082347)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  color: Color(0xFF082347),
                  width: 2,
                ),
              ),
              suffixIcon: const Icon(
                Icons.arrow_drop_down,
                color: Color(0xFF082347),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
