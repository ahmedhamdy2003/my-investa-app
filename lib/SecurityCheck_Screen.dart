import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'dart:typed_data';
import 'package:http/http.dart' as http; // استيراد مكتبة http
import 'nationalID_screen.dart'; // تأكد أن nationalID_screen.dart في نفس المجلد

class SecurityCheckScreen extends StatefulWidget {
  @override
  _SecurityCheckScreenState createState() => _SecurityCheckScreenState();
}

class _SecurityCheckScreenState extends State<SecurityCheckScreen> {
  Uint8List? _imageBytes;
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
          _imageBytes = bytes;
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
      _imageBytes = null;
      _isCameraInitialized = false;
    });
    // إعادة تهيئة الكاميرا لتجنب الشاشة السوداء
    await _initializeCamera();
  }

  // هذه الدالة تم تعديلها لإرسال الصورة للباك إند ثم الانتقال للصفحة التالية
  void _uploadPhotoAndNavigate() async {
    if (_imageBytes == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("No image taken yet!")),
      );
      return;
    }

    const String uploadUrl =
        'https://2859-41-44-137-9.ngrok-free.app/life-picture/'; //
    try {
      var request = http.MultipartRequest('POST', Uri.parse(uploadUrl));
      request.files.add(http.MultipartFile.fromBytes(
        'image',
        _imageBytes!,
        filename: 'user_face_capture.jpg',
      ));

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Uploading image...")),
      );

      var response = await request.send();

      if (response.statusCode == 200 || response.statusCode == 201) {
        // الصورة تم رفعها بنجاح
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Color(0xff4CAF50),
            content: Text("Image uploaded successfully!"),
          ),
        );
        // الانتقال للصفحة التالية بعد الرفع الناجح
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NationalIDScreen()),
        );
      } else {
        // حدث خطأ أثناء الرفع
        final responseBody = await response.stream.bytesToString();
        print('Image upload failed: ${response.statusCode} - $responseBody');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Color(0xffF44336),
            content: Text("Failed to upload image: ${response.statusCode}"),
          ),
        );
      }
    } catch (e) {
      print('Error uploading image: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Color(0xffF44336),
          content: Text("Network error: Could not upload image."),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // استخدام PreferredSize لضبط ارتفاع الـ AppBar وجعل الحواف العلوية منحنية
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          backgroundColor: const Color(0xff001F3F),
          elevation: 0,
          // الحواف العلوية منحنية
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
                'Smile Below',
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
                child: _imageBytes != null
                    ? Image.memory(
                        _imageBytes!,
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
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Follow the below tips:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildTipBox('assets/not_cropped.png'),
                _buildTipBox('assets/no_reflictions.png'),
              ],
            ),
            const SizedBox(height: 8),
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 28),
                  child: Text('Not cropped',
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 105),
                  child: Text('No reflections',
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            const Spacer(),
            _imageBytes == null
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
                            _uploadPhotoAndNavigate, // تم ربط هذا الزر بالدالة المعدلة
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
