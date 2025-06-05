import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:investa4/core/utils/text_field_style.dart';

class OTPTextField extends StatefulWidget {
  /// Number of OTP digits.
  final int length;

  /// Callback triggered when the OTP entry is completed.
  final void Function(String) onCompleted;

  /// Width for each OTP field.
  // final double fieldWidth;

  /// Text style for each OTP field.
  final TextStyle? textStyle;

  /// Decoration for each OTP field.
  final InputDecoration? inputDecoration;

  const OTPTextField({
    super.key,
    this.length = 4,
    required this.onCompleted,
    // this.fieldWidth = 50,
    this.textStyle,
    this.inputDecoration,
  });

  @override
  State<OTPTextField> createState() => _OTPTextFieldState();
}

class _OTPTextFieldState extends State<OTPTextField> {
  late List<FocusNode> _focusNodes;
  late List<TextEditingController> _controllers;

  @override
  void initState() {
    super.initState();
    _focusNodes = List.generate(widget.length, (index) => FocusNode());
    _controllers = List.generate(
      widget.length,
      (index) => TextEditingController(),
    );
  }

  @override
  void dispose() {
    for (final node in _focusNodes) {
      node.dispose();
    }
    for (final controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _onChanged(String value, int index) {
    if (value.isNotEmpty) {
      // Automatically move focus to the next field if available.
      if (index + 1 < widget.length) {
        FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
      } else {
        // If last field, unfocus and combine OTP.
        _focusNodes[index].unfocus();
      }
    }

    // Combine all OTP digits.
    final otp = _controllers.map((controller) => controller.text).join();

    // Trigger the callback if all fields are filled.
    log('otp.contains("") ${otp.contains("")}');
    if (otp.length == widget.length &&
        (otp.trim().split('').length == widget.length)) {
      widget.onCompleted(otp);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(widget.length, (index) {
        return SizedBox(
          width: (MediaQuery.of(context).size.width * 0.6) / widget.length,
          height:
              ((MediaQuery.of(context).size.width * 0.6) / widget.length) + 5,
          child: TextFormField(
            validator:
                (value) => value!.isEmpty ? 'required verification code' : null,
            controller: _controllers[index],
            focusNode: _focusNodes[index],
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            style: TextStyle(
              fontSize: 25,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            decoration: widget.inputDecoration ?? textFieldDecoration(null),
            // Limit input to one character.
            maxLength: 1,
            onChanged: (value) => _onChanged(value, index),
          ),
        );
      }),
    );
  }
}
