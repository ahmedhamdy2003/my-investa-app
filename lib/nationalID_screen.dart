import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'dart:typed_data';

// Make sure this import points to the correct file where NationalIDBScreen is defined.
import 'package:first_page/nationalIDB_screen.dart';

class NationalIDScreen extends StatefulWidget {
  @override
  _NationalIDScreenState createState() => _NationalIDScreenState();
}

class _NationalIDScreenState extends State<NationalIDScreen> {
  Uint8List? _nationalIDFrontImageBytes; // This will hold the front ID image
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
          _nationalIDFrontImageBytes = bytes;
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
      _nationalIDFrontImageBytes = null;
      _isCameraInitialized = false;
    });
    // Re-initialize the camera to avoid a black screen
    await _initializeCamera();
  }

  // This function will now navigate to NationalIDBScreen, passing the front ID image
  void _navigateToNationalIDBScreen() {
    if (_nationalIDFrontImageBytes != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NationalIDBScreen(
            nationalIDFrontImageBytes:
                _nationalIDFrontImageBytes!, // Pass the front ID image
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("No image taken yet!")),
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
                'Please take a picture of the front side of the personal ID card:',
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
                child: _nationalIDFrontImageBytes != null
                    ? Image.memory(
                        _nationalIDFrontImageBytes!,
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
            _nationalIDFrontImageBytes == null
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
                            _navigateToNationalIDBScreen, // Navigates to NationalIDBScreen with front ID
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
}
