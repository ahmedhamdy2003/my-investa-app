import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

import 'phaseTwo_screenE.dart'; // Navigation to the next screen

class PhaseTwoScreenD extends StatefulWidget {
  final Map<String, dynamic> allCollectedData; // Data from previous screens

  const PhaseTwoScreenD({super.key, required this.allCollectedData});

  @override
  State<PhaseTwoScreenD> createState() => _PhaseTwoScreenDState();
}

class _PhaseTwoScreenDState extends State<PhaseTwoScreenD> {
  final TextEditingController _mediaController = TextEditingController();
  final TextEditingController _testimonialsController = TextEditingController();
  final TextEditingController _websiteLinksController = TextEditingController();
  final TextEditingController _awardsController = TextEditingController();

  final List<String> _uploadedFileNames =
      []; // To store names of uploaded files (not actual file data)

  // New: To store actual PlatformFile objects if you want to pass them
  // to the next screen or send them later
  final List<PlatformFile> _pickedMediaFiles = [];

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

    // Initialize _uploadedFileNames if coming back from PhaseTwoScreenE
    if (widget.allCollectedData['uploadedMediaFileNames'] != null) {
      _uploadedFileNames.addAll(
          List<String>.from(widget.allCollectedData['uploadedMediaFileNames']));
    }
    // Initialize _pickedMediaFiles if coming back (more complex, might require re-picking or temporary storage solutions)
    // For simplicity, we are only storing names for now. If you need the actual files,
    // you'd need a more robust state management or file caching mechanism.
  }

  // Function to handle file picking
  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true, // Allow picking multiple files
      type: FileType.media, // Specify media files (images, videos)
    );

    if (result != null) {
      setState(() {
        _uploadedFileNames.clear(); // Clear previous selections
        _pickedMediaFiles.clear(); // Clear previous PlatformFile objects
        for (var platformFile in result.files) {
          _uploadedFileNames.add(platformFile.name!);
          _pickedMediaFiles.add(platformFile); // Store the actual file object
        }
        _mediaController.text =
            _uploadedFileNames.join(', '); // Update the text field
      });
    } else {
      // User canceled the picker
    }
  }

  // Helper to collect data from this screen and merge with previous
  Map<String, dynamic> _collectAndMergeData() {
    Map<String, dynamic> currentScreenData = {
      'photosVideosMedia': _mediaController.text.trim(),
      'customerTestimonials': _testimonialsController.text.trim(),
      'projectWebsiteLinks': _websiteLinksController.text.trim(),
      'awardsCertifications': _awardsController.text.trim(),
      'uploadedMediaFileNames': _uploadedFileNames, // Include picked file names
      // IMPORTANT: Passing actual file data (bytes) directly in a Map
      // between screens might lead to performance issues or memory leaks
      // for large files. For simplicity, we are passing names.
      // If you need to send actual files, you should handle them as
      // multipart form data at the final submission stage in PhaseTwoScreenE.
      // 'pickedMediaFiles': _pickedMediaFiles, // You could pass this, but handle carefully
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
                  '• Photos and Videos of Products, Actual Location, or Team'),
              _buildMediaInput(
                  _mediaController, _pickFile), // Custom media input
              _buildLabel('• Customer Testimonials or Reviews (if available)'),
              _buildTextField('type here', controller: _testimonialsController),
              _buildLabel('• Project Website or Social Media Links'),
              _buildTextField('type here', controller: _websiteLinksController),
              _buildLabel(
                  '• Any Awards or Certifications Received by the Project'),
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
                        // Collect and merge data from this screen
                        Map<String, dynamic> mergedData =
                            _collectAndMergeData();

                        // Navigate to the next screen, passing all collected data
                        // NO BACKEND SUBMISSION YET
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                PhaseTwoScreenE(allCollectedData: mergedData),
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

  Widget _buildMediaInput(
      TextEditingController controller, VoidCallback onPickFile) {
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
          suffixIcon: IconButton(
            icon: const Icon(Icons.attach_file, color: Color(0xFF082347)),
            onPressed: onPickFile,
          ),
        ),
      ),
    );
  }
}
