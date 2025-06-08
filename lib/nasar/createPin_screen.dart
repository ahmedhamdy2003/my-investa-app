// createPin_screen.dart
import 'package:investa4/nasar/confirmPin_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CreatePinScreen extends StatefulWidget {
  const CreatePinScreen({super.key});

  @override
  State<CreatePinScreen> createState() => _CreatePinScreenState();
}

class _CreatePinScreenState extends State<CreatePinScreen> {
  final TextEditingController _pinController = TextEditingController();
  final int _pinLength = 5;
  bool _isPinComplete = false;
  late FocusNode _pinFocusNode;

  @override
  void initState() {
    super.initState();
    _pinFocusNode = FocusNode();
    _pinController.addListener(_onPinChanged);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_pinFocusNode);
    });
  }

  @override
  void dispose() {
    _pinController.removeListener(_onPinChanged);
    _pinController.dispose();
    _pinFocusNode.dispose();
    super.dispose();
  }

  void _onPinChanged() {
    setState(() {
      _isPinComplete = _pinController.text.length == _pinLength;
    });
  }

  void _navigateToNextScreen() {
    if (_isPinComplete) {
      String createdPin = _pinController.text;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ConfirmPinScreen(initialPin: createdPin),
        ),
      );
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
                const Text(
                  'Create a Pin',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.normal,
                    color: Color(0xFF082347),
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
                                ? const Color(0xFF082347)
                                : Colors.transparent,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color(0xFF082347),
                          width: 1.5,
                        ),
                      ),
                    );
                  }),
                ),
                Offstage(
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: TextFormField(
                      controller: _pinController,
                      focusNode: _pinFocusNode,
                      keyboardType: TextInputType.number,
                      obscureText: true,
                      maxLength: _pinLength,
                      autofocus: false,
                      showCursor: false,
                      style: const TextStyle(color: Colors.transparent),
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
                ),
                const Spacer(),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _isPinComplete ? const Color(0xFF082347) : Colors.grey,
                ),
                child: IconButton(
                  onPressed: _isPinComplete ? _navigateToNextScreen : null,
                  icon: const Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
