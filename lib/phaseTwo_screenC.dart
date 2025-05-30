import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // Import the http package
import 'dart:convert'; // For encoding JSON

import 'phaseTwo_screenD.dart'; // Navigation to the next screen

class PhaseTwoScreenC extends StatefulWidget {
  final Map<String, dynamic> allCollectedData; // Data from previous screens

  const PhaseTwoScreenC({super.key, required this.allCollectedData});

  @override
  State<PhaseTwoScreenC> createState() => _PhaseTwoScreenCState();
}

class _PhaseTwoScreenCState extends State<PhaseTwoScreenC> {
  // Controllers for text fields in this screen
  final TextEditingController strengthsController = TextEditingController();
  final TextEditingController weaknessesController = TextEditingController();
  final TextEditingController opportunitiesController = TextEditingController();
  final TextEditingController threatsController =
      TextEditingController(); // This will now be a regular text field
  final TextEditingController businessModelController = TextEditingController();
  final TextEditingController marketingStrategyController =
      TextEditingController();
  final TextEditingController useOfFundsPlanController =
      TextEditingController();
  final TextEditingController competitorsController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize controllers with any existing data if navigating back
    strengthsController.text = widget.allCollectedData['strengths'] ?? '';
    weaknessesController.text = widget.allCollectedData['weaknesses'] ?? '';
    opportunitiesController.text =
        widget.allCollectedData['opportunities'] ?? '';
    threatsController.text = widget.allCollectedData['threats'] ?? '';
    businessModelController.text =
        widget.allCollectedData['businessModel'] ?? '';
    marketingStrategyController.text =
        widget.allCollectedData['marketingStrategy'] ?? '';
    useOfFundsPlanController.text =
        widget.allCollectedData['useOfFundsPlan'] ?? '';
    competitorsController.text = widget.allCollectedData['competitors'] ?? '';
  }

  @override
  void dispose() {
    strengthsController.dispose();
    weaknessesController.dispose();
    opportunitiesController.dispose();
    threatsController.dispose();
    businessModelController.dispose();
    marketingStrategyController.dispose();
    useOfFundsPlanController.dispose();
    competitorsController.dispose();
    super.dispose();
  }

  // Helper to collect data from this screen and merge with previous data
  Map<String, dynamic> _collectAndMergeData() {
    Map<String, dynamic> currentScreenData = {
      'strengths': strengthsController.text.trim(),
      'weaknesses': weaknessesController.text.trim(),
      'opportunities': opportunitiesController.text.trim(),
      'threats': threatsController.text.trim(),
      'businessModel': businessModelController.text.trim(),
      'marketingStrategy': marketingStrategyController.text.trim(),
      'useOfFundsPlan': useOfFundsPlanController.text.trim(),
      'competitors': competitorsController.text.trim(),
    };
    return {...widget.allCollectedData, ...currentScreenData}; // Merge maps
  }

  // Function to send data to Django backend
  Future<void> _sendDataToBackend(Map<String, dynamic> data) async {
    const String apiUrl =
        'YOUR_DJANGO_BACKEND_API_ENDPOINT'; // **IMPORTANT: Replace with your actual API endpoint**

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        // Data sent successfully
        print('Data sent to backend successfully!');
        print('Response from backend: ${response.body}');
        // Navigate to the next screen after successful submission
        if (mounted) {
          // Check if the widget is still mounted before navigating
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PhaseTwoScreenD(allCollectedData: data),
            ),
          );
        }
      } else {
        // Failed to send data
        print(
            'Failed to send data to backend. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        // Optionally, show an error message to the user
        _showErrorDialog('Failed to submit data. Please try again.');
      }
    } catch (e) {
      print('Error sending data to backend: $e');
      // Optionally, show an error message to the user
      _showErrorDialog(
          'An error occurred. Please check your internet connection and try again.');
    }
  }

  // Helper to show an error dialog
  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: const Text('Okay'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          )
        ],
      ),
    );
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
                'Advanced Analyses (Builds confidence for investors\n\nSwot Analysis):',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff082347),
                ),
              ),
              const SizedBox(height: 10),
              _buildLabel('• Strengths'),
              _buildTextField('type here', controller: strengthsController),
              _buildLabel('• Weaknesses'),
              _buildTextField('type here', controller: weaknessesController),
              _buildLabel('• Opportunities'),
              _buildTextField('type here', controller: opportunitiesController),
              _buildLabel('• Threats'),
              // Changed from _buildDropdownField to _buildTextField
              _buildTextField('type here', controller: threatsController),
              _buildLabel(
                  '• Business Model (Business Model Canvas or a summarized version)'),
              _buildTextField('type here', controller: businessModelController),
              _buildLabel('• Marketing and Growth Strategy'),
              _buildTextField('type here',
                  controller: marketingStrategyController),
              _buildLabel(
                  '• Use of Funds Plan (How the invested amount will be used)'),
              _buildTextField('type here',
                  controller: useOfFundsPlanController),
              _buildLabel('• List of Direct and Indirect Competitors'),
              _buildTextField('type here', controller: competitorsController),
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
                      onPressed: () async {
                        // Collect and merge data from this screen
                        Map<String, dynamic> mergedData =
                            _collectAndMergeData();

                        // Send data to the backend
                        await _sendDataToBackend(mergedData);
                        // Navigation to the next screen happens inside _sendDataToBackend
                        // after a successful response from the backend.
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

  // The _buildDropdownField function is no longer used for 'Threats' but is kept if needed elsewhere.
  Widget _buildDropdownField(BuildContext context, List<String> options,
      {TextEditingController? controller}) {
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
                  color: Color(0xFF082347)), // Dropdown arrow
            ),
          ),
        ),
      ),
    );
  }
}
