import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'dart:typed_data';
import 'package:http/http.dart' as http; // Import http
import 'package:first_page/fingerORface_screen.dart'; // Import the next screen

class NationalIDBScreen extends StatefulWidget {
  // Receive the front ID image from NationalIDScreen
  final Uint8List nationalIDFrontImageBytes;

  const NationalIDBScreen({
    super.key,
    required this.nationalIDFrontImageBytes,
  });

  @override
  _NationalIDBScreenState createState() => _NationalIDBScreenState();
}

class _NationalIDBScreenState extends State<NationalIDBScreen> {
  Uint8List? _nationalIDBackImageBytes; // This will hold the back ID image
  CameraController? _cameraController;
  bool _isCameraInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    if (cameras.isNotEmpty) {
      _cameraController = CameraController(
        cameras.first,
        ResolutionPreset.medium,
        enableAudio: false,
      );

      await _cameraController!.initialize();
      setState(() {
        _isCameraInitialized = true;
      });
    }
  }

  Future<void> _takePhoto() async {
    if (_cameraController != null && _cameraController!.value.isInitialized) {
      try {
        final XFile photo = await _cameraController!.takePicture();
        final bytes = await photo.readAsBytes();
        setState(() {
          _nationalIDBackImageBytes = bytes;
        });
      } catch (e) {
        print("Error taking photo: $e");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error taking photo: $e")),
        );
      }
    }
  }

  void _retakePhoto() async {
    setState(() {
      _nationalIDBackImageBytes = null;
      _isCameraInitialized = false;
    });
    await _initializeCamera();
  }

  // Function to upload both ID images to the backend
  void _uploadIDImagesAndNavigate() async {
    if (_nationalIDBackImageBytes == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text("Please take a photo of the back of your ID.")),
      );
      return;
    }

    const String uploadUrl =
        'https://2859-41-44-137-9.ngrok-free.app/upload-national-card/';

    try {
      var request = http.MultipartRequest('POST', Uri.parse(uploadUrl));

      // Add the national ID front image
      request.files.add(http.MultipartFile.fromBytes(
        'id_front_image', // Django expects this field name for the front ID image
        widget.nationalIDFrontImageBytes,
        filename: 'id_front.jpg',
      ));

      // Add the national ID back image
      request.files.add(http.MultipartFile.fromBytes(
        'id_back_image', // Django expects this field name for the back ID image
        _nationalIDBackImageBytes!,
        filename: 'id_back.jpg',
      ));

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Uploading ID images...")),
      );

      var response = await request.send();

      if (response.statusCode == 200 || response.statusCode == 201) {
        // Images uploaded successfully
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Color(0xff4CAF50),
            content: Text("ID images uploaded successfully!"),
          ),
        );
        // Navigate to the next screen after successful upload
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const FingerOrFaceScreen()),
        );
      } else {
        // Handle upload failure
        final responseBody = await response.stream.bytesToString();
        print(
            'ID images upload failed: ${response.statusCode} - $responseBody');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: const Color(0xffF44336),
            content: Text(
                "Failed to upload ID images: ${response.statusCode} - $responseBody"),
          ),
        );
      }
    } catch (e) {
      print('Error uploading ID images: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Color(0xffF44336),
          content: Text("Network error: Could not upload ID images."),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          backgroundColor: const Color(0xff001F3F),
          elevation: 0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white, size: 32),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Please take a picture of the back side of the personal ID card:',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Spacer(),
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Container(
                width: double.infinity,
                height: 230,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xff082347),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: _nationalIDBackImageBytes != null
                    ? Image.memory(
                        _nationalIDBackImageBytes!,
                        fit: BoxFit.cover,
                      )
                    : _isCameraInitialized && _cameraController != null
                        ? CameraPreview(_cameraController!)
                        : const Center(
                            child: CircularProgressIndicator(),
                          ),
              ),
            ),
            const Spacer(),
            const Spacer(),
            _nationalIDBackImageBytes == null
                ? ElevatedButton.icon(
                    onPressed: _takePhoto,
                    icon: const Icon(Icons.camera_alt, color: Colors.white),
                    label: const Text(
                      'Take a photo',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff001F3F),
                      padding: const EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 55),
                      minimumSize: const Size(double.infinity, 48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OutlinedButton(
                        onPressed: _retakePhoto,
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              vertical: 16.0, horizontal: 32),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          side: const BorderSide(color: Color(0xff001F3F)),
                        ),
                        child: const Text(
                          'Retake',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff001F3F),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      ElevatedButton(
                        onPressed:
                            _uploadIDImagesAndNavigate, // This now uploads both ID images
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff001F3F),
                          padding: const EdgeInsets.symmetric(
                              vertical: 16.0, horizontal: 32),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                        child: const Text(
                          'Looks Good !',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildTipBox(String imagePath) {
    return Container(
      width: 130,
      height: 84,
      decoration: BoxDecoration(
        color: const Color(0xffD9E4FF),
        borderRadius: BorderRadius.circular(16),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
