// phaseTwo_screen.dart
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

import 'phaseTwo_screenB.dart'; // Navigation to the next screen

class PhaseTwoScreen extends StatefulWidget {
  const PhaseTwoScreen({super.key});

  @override
  State<PhaseTwoScreen> createState() => _PhaseTwoScreenState();
}

class _PhaseTwoScreenState extends State<PhaseTwoScreen> {
  final TextEditingController projectNameController = TextEditingController();
  final TextEditingController briefDescriptionController =
      TextEditingController();
  final TextEditingController detailedDescriptionController =
      TextEditingController();
  final TextEditingController projectStartDateController =
      TextEditingController();
  final TextEditingController geographicalLocationController =
      TextEditingController();
  final TextEditingController teamSizeController = TextEditingController();
  final TextEditingController projectCategoryController =
      TextEditingController(); // Controller for dropdown

  String? _pickedLogoFileName;
  PlatformFile? _pickedLogoFile; // Store the PlatformFile object directly
  bool _isLogoFilePicked = false;
  bool _isPickingLogoFile = false;

  @override
  void dispose() {
    projectNameController.dispose();
    briefDescriptionController.dispose();
    detailedDescriptionController.dispose();
    projectStartDateController.dispose();
    geographicalLocationController.dispose();
    teamSizeController.dispose();
    projectCategoryController.dispose();
    super.dispose();
  }

  Future<void> _handleLogoFilePicking() async {
    if (_isPickingLogoFile) return;

    setState(() {
      _isPickingLogoFile = true;
      _pickedLogoFileName = null;
      _pickedLogoFile = null; // Clear previous file object
      _isLogoFilePicked = false;
    });

    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: false,
        withData: true, // Crucial for web and for getting bytes
      );

      if (result != null) {
        PlatformFile file = result.files.first;
        setState(() {
          _pickedLogoFileName = file.name;
          _pickedLogoFile = file; // Store the actual PlatformFile object
          _isLogoFilePicked = true;
        });
        print('Selected logo file: ${file.name}');
      } else {
        print('Logo file picking cancelled or no file selected.');
        setState(() {
          _pickedLogoFileName = null;
          _pickedLogoFile = null;
          _isLogoFilePicked = false;
        });
      }
    } catch (e) {
      print('Error picking logo file: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error picking logo file: $e")),
      );
      setState(() {
        _pickedLogoFileName = null;
        _pickedLogoFile = null;
        _isLogoFilePicked = false;
      });
    } finally {
      setState(() {
        _isPickingLogoFile = false;
      });
    }
  }

  // Helper to collect data from this screen
  Map<String, dynamic> _collectScreenAData() {
    return {
      'projectName': projectNameController.text.trim(),
      'briefDescription': briefDescriptionController.text.trim(),
      'detailedDescription': detailedDescriptionController.text.trim(),
      'projectCategory': projectCategoryController.text.trim(),
      'projectStartDate': projectStartDateController.text.trim(),
      'geographicalLocation': geographicalLocationController.text.trim(),
      'teamSize': teamSizeController.text.trim(),
      'projectLogoFile': _pickedLogoFile, // Pass the actual PlatformFile object
    };
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
                'Phase 2:\nInsert your data to be reperesnted to the investor\nNote: If this data is not completed \nwithin 3 days from the date of\nsending the email, the request willbe\ntemporarily frozen until it is\ncompleted,\nBasic Information for the Project',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  height: 1.4,
                  color: Color(0xFF082347),
                ),
              ),
              const SizedBox(height: 10),
              _buildLabel('• Project Name (in Arabic and English) '),
              _buildTextField('type here', controller: projectNameController),
              _buildLabel('• Project Logo'),
              SizedBox(
                width: 200,
                child: OutlinedButton.icon(
                  onPressed: _isPickingLogoFile ? null : _handleLogoFilePicking,
                  style: OutlinedButton.styleFrom(
                    foregroundColor: _isLogoFilePicked
                        ? const Color(0xFF082347)
                        : Colors.grey,
                    side: BorderSide(
                        color: _isLogoFilePicked
                            ? const Color(0xFF082347)
                            : Colors.black26),
                    minimumSize: const Size.fromHeight(50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  icon: _isPickingLogoFile
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Color(0xFF082347),
                          ),
                        )
                      : Icon(
                          _isLogoFilePicked
                              ? Icons.check_circle
                              : Icons.attach_file,
                          color: _isLogoFilePicked
                              ? Colors.green
                              : const Color(0xFF082347),
                          size: 20,
                        ),
                  label: Text(
                    _isPickingLogoFile
                        ? 'Picking file...'
                        : _isLogoFilePicked
                            ? 'Picked!'
                            : 'Choose File',
                    style: TextStyle(
                      color: _isLogoFilePicked
                          ? const Color(0xFF082347)
                          : Colors.grey,
                    ),
                  ),
                ),
              ),
              if (_isLogoFilePicked)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    'File selected: $_pickedLogoFileName',
                    style: const TextStyle(color: Colors.green, fontSize: 12),
                  ),
                ),
              _buildLabel(
                  '• Brief Description (Short Pitch) – not exceeding 300 characters'),
              _buildTextField('type here',
                  controller: briefDescriptionController, maxLines: 3),
              _buildLabel(
                  '• Detailed Description of the Project (Who you are, what you do)'),
              _buildTextField('type here',
                  controller: detailedDescriptionController, maxLines: 5),
              const SizedBox(height: 10),
              _buildLabel('•Project Category (Food, Fashion, Fitness, etc.)'),
              _buildDropdownField(
                context,
                ['Food', 'Fashion', 'Fitness', 'Food Truck'],
                controller: projectCategoryController, // Pass the controller
              ),
              _buildLabel('• Project Start Date'),
              _buildTextField('type here',
                  controller: projectStartDateController),
              _buildLabel('• Geographical Location (City/Province)'),
              _buildTextField('type here',
                  controller: geographicalLocationController),
              _buildLabel('• Team size'),
              _buildTextField('Enter team size',
                  controller: teamSizeController,
                  keyboardType: TextInputType.number),
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
                        // Collect data from this screen
                        Map<String, dynamic> currentScreenData =
                            _collectScreenAData();

                        // Navigate to the next screen, passing collected data AND a projectId
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PhaseTwoScreenB(
                                allCollectedData: currentScreenData,
                                // هنا تم إضافة الـ projectId
                                projectId:
                                    'ProjectID_123'), // يمكنك تغيير هذه القيمة أو جلبها من مكان آخر
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

  Widget _buildTextField(String hint,
      {TextEditingController? controller,
      TextInputType keyboardType = TextInputType.text,
      int maxLines = 1}) {
    return Container(
      width: double.infinity,
      height: maxLines > 1 ? null : 44,
      margin: const EdgeInsets.only(bottom: 10),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        maxLines: maxLines,
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
                      setState(() {
                        controller!.text = option;
                      });
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
          width: double.infinity,
          height: 44,
          margin: const EdgeInsets.only(bottom: 10),
          child: TextField(
            controller: controller,
            readOnly: true, // عشان محدش يعرف يكتب فيها بايده
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
              suffixIcon:
                  const Icon(Icons.arrow_drop_down, color: Color(0xFF082347)),
            ),
          ),
        ),
      ),
    );
  }
}
