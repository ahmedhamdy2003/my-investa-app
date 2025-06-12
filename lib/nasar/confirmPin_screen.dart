// confirmPin_screen.dart
import 'package:investa4/nasar/great_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// **[MODIFIED]** استيراد مكتبة flutter_secure_storage
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// ألغينا استيراد shared_preferences لأنه لم يعد يستخدم لحفظ الـ PIN
// import 'package:shared_preferences/shared_preferences.dart';

class ConfirmPinScreen extends StatefulWidget {
  final String initialPin; // الرقم السري اللي جاي من شاشة الإنشاء
  // 1. أضف خاصية userId هنا
  final String? userId; // <--- هنا تم إضافة الـ userId

  const ConfirmPinScreen({
    super.key,
    required this.initialPin,
    this.userId,
  }); // <--- هنا تم استقبال الـ userId

  @override
  State<ConfirmPinScreen> createState() => _ConfirmPinScreenState();
}

class _ConfirmPinScreenState extends State<ConfirmPinScreen> {
  final TextEditingController _pinController = TextEditingController();
  final int _pinLength = 5;
  bool _isPinComplete = false;
  bool _showError = false;
  String _errorMessage = '';
  bool _showSuccessEffect = false;
  bool _showConfirmButton =
      false; // New state to control confirm button visibility

  // **[MODIFIED]** تعريف FlutterSecureStorage
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  // مفتاح لحفظ الـ PIN في الـ secure storage
  static const String _pinKey = 'user_pin_secure';

  @override
  void initState() {
    super.initState();
    _pinController.addListener(_onPinChanged);
  }

  @override
  void dispose() {
    _pinController.removeListener(_onPinChanged);
    _pinController.dispose();
    super.dispose();
  }

  void _onPinChanged() {
    setState(() {
      _isPinComplete = _pinController.text.length == _pinLength;
      if (_showError || _showSuccessEffect) {
        _showError = false;
        _errorMessage = '';
        _showSuccessEffect = false;
      }
      if (_isPinComplete) {
        _verifyPin();
      } else {
        _showConfirmButton = false; // إخفاء الزر لو الـ PIN مش كامل
      }
    });
  }

  void _verifyPin() async {
    // التحقق من تطابق الـ PIN المدخل مع الـ PIN الأولي
    if (_pinController.text == widget.initialPin) {
      setState(() {
        _showError = false;
        _showSuccessEffect = true;
        _showConfirmButton = true; // إظهار زر التأكيد إذا تطابق الـ PIN
      });
    } else {
      setState(() {
        _showError = true;
        _errorMessage = 'The numbers don\'t match. Try again,';
        _showConfirmButton = false; // إخفاء الزر عند عدم التطابق
      });
      _pinController.clear(); // مسح حقل الإدخال ليعيد المستخدم المحاولة
    }
  }

  // دالة لحفظ الـ PIN في الموبايل بشكل آمن والانتقال للصفحة التالية
  void _savePinLocallyAndNavigate() async {
    // <--- تم تغيير اسم الدالة هنا
    // ممكن هنا تضيف مؤشر تحميل (Loading indicator) لو حبيت
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Saving the password to the device...")),
    );

    try {
      // **[MODIFIED]** هنا بنحفظ الـ PIN في الـ secure storage
      // الـ 'user_pin_secure' ده هو المفتاح اللي هنستخدمه عشان نجيب الـ PIN ده تاني
      await _secureStorage.write(
        key: _pinKey,
        value: widget.initialPin,
      ); // <--- ده سطر الحفظ الآمن

      // تم حفظ الـ PIN بنجاح
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Color(0xff4CAF50), // أخضر للنجاح
          content: Text("Password successfully saved on the device"),
        ),
      );

      // الانتقال للصفحة التالية بعد الحفظ بنجاح
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => GreatScreen(userId: widget.userId),
        ), // <--- هنا تم تمرير الـ userId
      );
    } catch (e) {
      // لو حصل أي خطأ في الحفظ المحلي
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: const Color(0xffF44336), // أحمر للخطأ
          content: Text(
            "An error occurred while saving the password: ${e.toString()}",
          ),
        ),
      );
      print('Error saving PIN locally: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F6FA),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Color(0xFF082347),
              size: 32,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.3,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.center,
                  child: RichText(
                    text: const TextSpan(
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.normal,
                        color: Color(0xFF082347),
                      ),
                      children: <TextSpan>[
                        TextSpan(text: 'Confirm the '),
                        TextSpan(
                          text: 'PIN',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('assets/logo (4).png', height: 60, width: 60),
                    const SizedBox(width: 8),
                    RichText(
                      text: const TextSpan(
                        style: TextStyle(
                          fontSize: 36,
                          color: Color(0xFF082347),
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Investa',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
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
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(_pinLength, (index) {
                    bool filled = index < _pinController.text.length;
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                        color:
                            filled
                                ? (_showError
                                    ? Colors.red
                                    : (_showSuccessEffect
                                        ? Colors.green
                                        : const Color(0xFF082347)))
                                : Colors.transparent,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color:
                              _showError
                                  ? Colors.red
                                  : (_showSuccessEffect
                                      ? Colors.green
                                      : const Color(0xFF082347)),
                          width: 1.5,
                        ),
                      ),
                    );
                  }),
                ),
                if (_showError) ...[
                  const SizedBox(height: 10),
                  Text(
                    _errorMessage,
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
                SizedBox(
                  width: 0,
                  height: 0,
                  child: TextFormField(
                    controller: _pinController,
                    keyboardType: TextInputType.number,
                    obscureText: true,
                    maxLength: _pinLength,
                    autofocus: true,
                    showCursor: false,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      counterText: '',
                    ),
                    onChanged: (value) {
                      _onPinChanged();
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(_pinLength),
                    ],
                  ),
                ),
                const Spacer(),
                if (_showConfirmButton) // إظهار زر التأكيد بناءً على الحالة
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: ElevatedButton(
                      onPressed:
                          _savePinLocallyAndNavigate, // <--- استدعاء دالة الحفظ المحلية الجديدة
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF082347),
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Confirm',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
