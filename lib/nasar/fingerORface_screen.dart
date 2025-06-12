// fingerORface_screen.dart

import 'package:investa4/nasar/createPin_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:local_auth/local_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart'; // عشان PlatformException

class FingerOrFaceScreen extends StatefulWidget {
  // 1. أضف خاصية userId هنا
  final String? userId; // <--- هنا تم إضافة الـ userId

  const FingerOrFaceScreen({
    super.key,
    this.userId,
  }); // <--- هنا تم استقبال الـ userId

  @override
  State<FingerOrFaceScreen> createState() => _FingerOrFaceScreenState();
}

class _FingerOrFaceScreenState extends State<FingerOrFaceScreen> {
  final LocalAuthentication auth = LocalAuthentication();
  bool _canCheckBiometrics = false;
  List<BiometricType> _availableBiometrics = [];

  @override
  void initState() {
    super.initState();
    _checkBiometrics(); // بنتحقق من توفر البصمة/الوش أول ما الشاشة تفتح
  }

  // دالة للتحقق من إذا كان الجهاز بيدعم بصمة/وش ولا لأ
  Future<void> _checkBiometrics() async {
    bool canCheckBiometricsResult;
    List<BiometricType> availableBiometricsResult;
    try {
      canCheckBiometricsResult = await auth.canCheckBiometrics;
      availableBiometricsResult = await auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      canCheckBiometricsResult = false;
      availableBiometricsResult = [];
      print(e); // لو حصل أي مشكلة في الوصول للبصمة/الوش
    }

    if (!mounted) {
      return;
    }

    setState(() {
      _canCheckBiometrics = canCheckBiometricsResult;
      _availableBiometrics = availableBiometricsResult;
    });
  }

  // دالة لتفعيل البصمة أو الفيس آي دي
  Future<void> _authenticate(BiometricType selectedType) async {
    bool authenticated = false;
    try {
      authenticated = await auth.authenticate(
        localizedReason:
            selectedType == BiometricType.fingerprint
                ? 'يرجى وضع إصبعك لتأمين حسابك'
                : 'يرجى النظر إلى الكاميرا لتأمين حسابك',
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
        ),
      );
    } on PlatformException catch (e) {
      print("Error during biometric authentication: $e");
      String errorMessage = "حدث خطأ غير متوقع.";
      if (e.code == 'notAvailable') {
        errorMessage =
            "خاصية ${selectedType == BiometricType.fingerprint ? 'البصمة' : 'الوجه'} غير متاحة على جهازك.";
      } else if (e.code == 'notEnrolled') {
        errorMessage =
            "لم يتم تسجيل ${selectedType == BiometricType.fingerprint ? 'بصمات' : 'وجه'} على جهازك. يرجى إعدادها أولاً من إعدادات الجهاز.";
      } else if (e.code == 'passcodeNotSet') {
        errorMessage = "يرجى تعيين كلمة مرور أو رمز مرور للجهاز أولاً.";
      } else if (e.code == 'lockedOut') {
        errorMessage = "تم قفل خاصية الأمان. يرجى المحاولة لاحقاً.";
      }
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(errorMessage)));
      return;
    }

    if (authenticated) {
      // لو العميل فعل البصمة/الوش بنجاح
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('biometrics_enabled', true);
      await prefs.setString('biometric_type_used', selectedType.toString());

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("تم تفعيل ميزة الأمان بنجاح!"),
          backgroundColor: Colors.green,
        ),
      );

      print(
        'Biometrics successfully enabled. Now navigate to CreatePinScreen.',
      );
      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const CreatePinScreen()));
    } else {
      // لو العميل فشل أو لغى عملية التفعيل
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("فشل التفعيل أو تم الإلغاء."),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xff001F3F),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            const Text(
              'Apply your\nFingerprint or Face ID',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xff001F3F),
              ),
            ),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'by applying one of them your Account will be more secured and private',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey, height: 1.5),
              ),
            ),
            // [DEBUG] لعرض الـ userId للتأكد من وصوله
            if (widget.userId != null && widget.userId!.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Text(
                  "User ID: ${widget.userId}",
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.blueGrey,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            const SizedBox(height: 60),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FaIcon(
                  FontAwesomeIcons.fingerprint,
                  size: 100,
                  color: Colors.black87,
                ),
                SizedBox(width: 50),
                FaIcon(
                  FontAwesomeIcons
                      .faceGrin, // أو FontAwesomeIcons.faceRecognition
                  size: 100,
                  color: Colors.black87,
                ),
              ],
            ),
            const SizedBox(height: 80),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton.icon(
                onPressed: () {
                  _authenticate(BiometricType.fingerprint);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff001F3F),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                icon: const FaIcon(
                  FontAwesomeIcons.fingerprint,
                  color: Colors.white,
                  size: 28,
                ),
                label: const Text(
                  'using Fingerprint',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton.icon(
                onPressed: () {
                  _authenticate(BiometricType.face);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff001F3F),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                icon: const FaIcon(
                  FontAwesomeIcons.faceGrin,
                  color: Colors.white,
                  size: 28,
                ), // أو FontAwesomeIcons.faceRecognition
                label: const Text(
                  'using Face ID',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            // هنا بنستخدم Spacer() عشان ندفع العناصر اللي فوق لأعلى
            const Spacer(),
            // ده الجزء اللي طلبته
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context); // للرجوع للشاشة السابقة
                  },
                  child: const Text(
                    'Back',
                    style: TextStyle(color: Color(0xFF082347), fontSize: 24),
                  ),
                ),
                // الأيقونة الأمامية اللي بتنقل لـ CreatePinScreen
                Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF082347),
                  ),
                  child: IconButton(
                    // *** هنا التغيير المطلوب: النقل لـ CreatePinScreen ***
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => CreatePinScreen(
                                userId: widget.userId,
                              ), // <--- هنا تم تمرير الـ userId
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
            const SizedBox(height: 20), // مسافة من الأسفل
          ],
        ),
      ),
    );
  }
}
