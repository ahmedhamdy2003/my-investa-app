// phaseTwo_screenD.dart
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
// Removed http import

import 'package:investa4/nasar/phaseTwo_screenE.dart'; // Navigation to the next screen

class PhaseTwoScreenD extends StatefulWidget {
  // 1. إضافة projectId كـ parameter مطلوب في constructor
  final String projectId;
  final Map<String, dynamic> allCollectedData; // Data from previous screens

  // 2. تحديث الـ constructor ليطلب projectId
  const PhaseTwoScreenD({
    super.key,
    required this.allCollectedData,
    required this.projectId,
  });

  @override
  State<PhaseTwoScreenD> createState() => _PhaseTwoScreenDState();
}

class _PhaseTwoScreenDState extends State<PhaseTwoScreenD> {
  final TextEditingController _mediaController = TextEditingController();
  final TextEditingController _testimonialsController = TextEditingController();
  final TextEditingController _websiteLinksController = TextEditingController();
  final TextEditingController _awardsController = TextEditingController();

  final List<String> _uploadedFileNames =
      []; // To store names of uploaded files
  final List<PlatformFile> _pickedMediaFiles =
      []; // To store actual PlatformFile objects

  @override
  void initState() {
    super.initState();
    // Initialize controllers with any existing data if navigating back
    _mediaController.text = widget.allCollectedData['photosVideosMedia'] ?? '';
    _testimonialsController.text =
        widget.allCollectedData['customerTestimonials'] ?? '';
    _websiteLinksController.text =
        widget.allCollectedData['projectWebsiteLinks'] ?? '';
    _awardsController.text =
        widget.allCollectedData['awardsCertifications'] ?? '';

    // If there were previously picked media files (PlatformFile objects) passed, re-add them.
    // This is a simplification; for robust solution, consider a more complex state management
    // or local caching for large files across screens.
    if (widget.allCollectedData['pickedMediaFiles'] is List<PlatformFile>) {
      _pickedMediaFiles.addAll(
        List<PlatformFile>.from(widget.allCollectedData['pickedMediaFiles']),
      );
      _uploadedFileNames.addAll(_pickedMediaFiles.map((f) => f.name).toList());
      _mediaController.text = _uploadedFileNames.join(', ');
    } else if (widget.allCollectedData['uploadedMediaFileNames'] != null) {
      // Fallback if only names were passed (less ideal for actual file objects)
      _uploadedFileNames.addAll(
        List<String>.from(widget.allCollectedData['uploadedMediaFileNames']),
      );
      _mediaController.text = _uploadedFileNames.join(', ');
    }
  }

  // Function to handle file picking
  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true, // Allow picking multiple files
      type: FileType.media, // Specify media files (images, videos)
      withData: true, // Crucial for getting bytes on web
    );

    if (result != null) {
      setState(() {
        _uploadedFileNames.clear(); // Clear previous selections
        _pickedMediaFiles.clear(); // Clear previous PlatformFile objects
        for (var platformFile in result.files) {
          _uploadedFileNames.add(platformFile.name);
          _pickedMediaFiles.add(platformFile); // Store the actual file object
        }
        _mediaController.text = _uploadedFileNames.join(
          ', ',
        ); // Update the text field
      });
    } else {
      // User canceled the picker
      print('User cancelled media file picking.');
    }
  }

  // Helper to collect data from this screen and merge with previous
  Map<String, dynamic> _collectAndMergeData() {
    Map<String, dynamic> currentScreenData = {
      'photosVideosMedia': _mediaController.text.trim(),
      'customerTestimonials': _testimonialsController.text.trim(),
      'projectWebsiteLinks': _websiteLinksController.text.trim(),
      'awardsCertifications': _awardsController.text.trim(),
      'pickedMediaFiles':
          _pickedMediaFiles, // Pass the list of PlatformFile objects
    };
    return {...widget.allCollectedData, ...currentScreenData}; // Merge maps
  }

  @override
  void dispose() {
    _mediaController.dispose();
    _testimonialsController.dispose();
    _websiteLinksController.dispose();
    _awardsController.dispose();
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
                'Supporting Media (Builds trust and attracts investors):',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff082347),
                ),
              ),
              const SizedBox(height: 10),
              _buildLabel(
                '• Photos and Videos of Products, Actual Location, or Team',
              ),
              _buildMediaInput(
                _mediaController,
                _pickFile,
              ), // Custom media input
              _buildLabel('• Customer Testimonials or Reviews (if available)'),
              _buildTextField('type here', controller: _testimonialsController),
              _buildLabel('• Project Website or Social Media Links'),
              _buildTextField('type here', controller: _websiteLinksController),
              _buildLabel(
                '• Any Awards or Certifications Received by the Project',
              ),
              _buildTextField('type here', controller: _awardsController),
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
                                (context) => PhaseTwoScreenE(
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

  Widget _buildMediaInput(
    TextEditingController controller,
    VoidCallback onPickFile,
  ) {
    return Container(
      width: 328,
      height: 44,
      margin: const EdgeInsets.only(bottom: 10),
      child: TextField(
        controller: controller,
        readOnly: true, // Make it read-only to prevent manual typing
        onTap: onPickFile, // Allow tapping to pick files
        decoration: InputDecoration(
          hintText: 'Upload files or paste link',
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
          suffixIcon: IconButton(
            icon: const Icon(Icons.attach_file, color: Color(0xFF082347)),
            onPressed: onPickFile,
          ),
        ),
      ),
    );
  }
}
