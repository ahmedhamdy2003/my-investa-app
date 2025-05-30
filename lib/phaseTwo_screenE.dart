import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart'; // Import for file picking
import 'package:http/http.dart' as http; // For making HTTP requests

// لا يوجد صفحة تالية بعد PhaseTwoScreenE في هذا السيناريو،
// لذلك لا يوجد استيراد لـ phaseTwo_screenF هنا.
// إذا كانت هناك صفحة تالية، ستقوم باستيرادها هنا.

class PhaseTwoScreenE extends StatefulWidget {
  final Map<String, dynamic> allCollectedData; // Receive all collected data

  const PhaseTwoScreenE({super.key, required this.allCollectedData});

  @override
  State<PhaseTwoScreenE> createState() => _PhaseTwoScreenEState();
}

class _PhaseTwoScreenEState extends State<PhaseTwoScreenE> {
  // Controllers for each text field
  final TextEditingController _commercialRegController =
      TextEditingController();
  final TextEditingController _financialSummaryController =
      TextEditingController();
  final TextEditingController _businessPlanController = TextEditingController();

  // New: To store the actual PlatformFile objects for potential upload later
  PlatformFile? _commercialRegFile;
  PlatformFile? _financialSummaryFile;
  PlatformFile? _businessPlanFile;

  bool _isLoading = false; // To show loading state during submission

  @override
  void initState() {
    super.initState();
    // Initialize controllers with any existing data if navigating back
    // Note: If you stored file paths in allCollectedData, retrieve them here.
    _commercialRegController.text =
        widget.allCollectedData['commercialRegFileName'] ?? '';
    _financialSummaryController.text =
        widget.allCollectedData['financialSummaryFileName'] ?? '';
    _businessPlanController.text =
        widget.allCollectedData['simplifiedBusinessPlanFileName'] ?? '';

    // If you passed PlatformFile objects from previous screen, you'd retrieve them here.
    // This is more complex and usually involves temporary file storage or re-picking.
  }

  @override
  void dispose() {
    _commercialRegController.dispose();
    _financialSummaryController.dispose();
    _businessPlanController.dispose();
    super.dispose();
  }

  // Function to handle file picking for a specific controller and store the file
  Future<void> _pickFile(
      TextEditingController controller, String fileType) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.any, // Allow any file type (documents, spreadsheets, etc.)
    );

    if (result != null) {
      setState(() {
        final pickedFile = result.files.single;
        controller.text =
            pickedFile.name; // Display the name of the picked file

        // Store the actual PlatformFile object based on fileType
        if (fileType == 'commercialReg') {
          _commercialRegFile = pickedFile;
        } else if (fileType == 'financialSummary') {
          _financialSummaryFile = pickedFile;
        } else if (fileType == 'businessPlan') {
          _businessPlanFile = pickedFile;
        }
      });
    } else {
      // User canceled the picker
    }
  }

  // Function to submit all collected data to Django
  Future<void> _submitAllData() async {
    setState(() {
      _isLoading = true; // Show loading indicator
    });

    // Collect data from this screen
    Map<String, dynamic> currentScreenData = {
      // We are sending file names, not actual file content, in the JSON part.
      // Actual file upload will require a different mechanism (e.g., MultipartRequest).
      'commercialRegFileName': _commercialRegController.text.trim(),
      'financialSummaryFileName': _financialSummaryController.text.trim(),
      'simplifiedBusinessPlanFileName': _businessPlanController.text.trim(),
    };

    // Merge with all data collected from previous screens
    Map<String, dynamic> finalDataToSubmit = {
      ...widget.allCollectedData,
      ...currentScreenData
    };

    // Debugging: Print all collected data before sending
    print('All collected data for submission:');
    finalDataToSubmit.forEach((key, value) {
      print('$key: $value');
    });

    // --- IMPORTANT: Handling file upload with MultipartRequest ---
    // If you need to send actual files, you would use MultipartRequest.
    // This is a simplified example showing how to prepare.
    // Your Django backend would need to handle file uploads.

    final String url =
        'YOUR_DJANGO_API_ENDPOINT_FOR_FULL_SUBMISSION'; // **استبدل هذا برابط الـ Django API الخاص بك الذي يستقبل كل البيانات والملفات**

    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));

      // Add text fields to the request
      finalDataToSubmit.forEach((key, value) {
        request.fields[key] = value.toString();
      });

      // Add files to the request if they were picked
      if (_commercialRegFile != null && _commercialRegFile!.path != null) {
        request.files.add(await http.MultipartFile.fromPath(
          'commercialRegFile', // Key name for the file in Django
          _commercialRegFile!.path!,
          filename: _commercialRegFile!.name,
        ));
      }
      if (_financialSummaryFile != null &&
          _financialSummaryFile!.path != null) {
        request.files.add(await http.MultipartFile.fromPath(
          'financialSummaryFile', // Key name for the file in Django
          _financialSummaryFile!.path!,
          filename: _financialSummaryFile!.name,
        ));
      }
      if (_businessPlanFile != null && _businessPlanFile!.path != null) {
        request.files.add(await http.MultipartFile.fromPath(
          'simplifiedBusinessPlanFile', // Key name for the file in Django
          _businessPlanFile!.path!,
          filename: _businessPlanFile!.name,
        ));
      }

      // Send the request
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200 || response.statusCode == 201) {
        // Success
        print('All project data submitted successfully!');
        print('Response: ${response.body}');
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('All data submitted successfully!')),
          );
          // Navigate to the next screen (if phaseTwo_screenF exists)
          // OR pop all routes until the first one (as in original code)
          // Assuming there is no PhaseTwoScreenF, we pop to the first route.
          Navigator.popUntil(context, (route) => route.isFirst);
        }
      } else {
        // Error
        print(
            'Failed to submit all project data. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text(
                    'Failed to submit data: ${response.statusCode} - ${response.body}')),
          );
        }
      }
    } catch (e) {
      print('Error submitting all project data: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error submitting data: $e')),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false; // Hide loading indicator
        });
      }
    }
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
                'Attachments (recommended):',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF082347),
                ),
              ),
              // Commercial Registration
              _buildLabel(
                  '• Commercial Registration or Legal Proof of the Project'),
              _buildTextFieldWithAttachment(
                _commercialRegController,
                'Upload file or type here',
                () => _pickFile(_commercialRegController,
                    'commercialReg'), // Pass file type
              ),
              // Financial Performance Summary
              _buildLabel('• Financial Performance Summary (Excel or PDF)'),
              _buildTextFieldWithAttachment(
                _financialSummaryController,
                'Upload file or type here',
                () => _pickFile(_financialSummaryController,
                    'financialSummary'), // Pass file type
              ),
              // Simplified Business Plan
              _buildLabel('• Simplified Business Plan'),
              _buildTextFieldWithAttachment(
                _businessPlanController,
                'Upload file or type here',
                () => _pickFile(
                    _businessPlanController, 'businessPlan'), // Pass file type
              ),
              const SizedBox(height: 30),
              Column(
                children: [
                  SizedBox(
                    width: 368,
                    height: 61,
                    child: ElevatedButton(
                      onPressed: _isLoading
                          ? null
                          : _submitAllData, // Disable if loading
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF082347),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: _isLoading
                          ? const CircularProgressIndicator(
                              color: Colors.white) // Show loading
                          : const Text(
                              'Start', // This is your final "Submit" button
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

  Widget _buildTextFieldWithAttachment(TextEditingController controller,
      String hint, VoidCallback onAttachmentPressed) {
    return Container(
      width: 328,
      height: 44,
      margin: const EdgeInsets.only(bottom: 10),
      child: TextField(
        controller: controller,
        readOnly: true, // Make it read-only to prevent manual typing
        onTap: onAttachmentPressed, // Allow tapping to pick files
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
          suffixIcon: IconButton(
            icon: const Icon(Icons.attach_file, color: Color(0xFF082347)),
            onPressed: onAttachmentPressed,
          ),
        ),
      ),
    );
  }
}
