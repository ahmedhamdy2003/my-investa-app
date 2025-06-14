import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:investa4/core/utils/text_field_style.dart';

class OTPTextField extends StatefulWidget {
  /// Number of OTP digits.
  final int length;

  /// Callback triggered when the OTP entry is completed.
  final void Function(String) onCompleted;

  /// Optional base TextStyle (its fontSize will be replaced by computedFontSize).
  final TextStyle? textStyle;

  /// Decoration for each OTP field.
  final InputDecoration? inputDecoration;

  const OTPTextField({
    super.key,
    this.length = 4,
    required this.onCompleted,
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
    _focusNodes = List.generate(widget.length, (_) => FocusNode());
    _controllers = List.generate(widget.length, (_) => TextEditingController());
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
      if (index + 1 < widget.length) {
        FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
      } else {
        _focusNodes[index].unfocus();
      }
    }

    final otp = _controllers.map((c) => c.text).join();
    if (otp.length == widget.length) {
      log('OTP completed: $otp');
      widget.onCompleted(otp);
    }
  }

  @override
  Widget build(BuildContext context) {
    // 1) Total width for all OTP boxes (60% of screen width)
    final totalOtpWidth = MediaQuery.of(context).size.width * 0.6;
    // 2) Width of a single box
    final fieldWidth = totalOtpWidth / widget.length;
    // 3) Compute fontSize as a fraction of that box width
    final computedFontSize = fieldWidth * 0.4;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: List.generate(widget.length, (index) {
        return SizedBox(
          width: fieldWidth,
          height: fieldWidth + 15,
          child: TextFormField(
            validator:
                (value) => (value == null || value.isEmpty) ? 'Required' : null,
            controller: _controllers[index],
            focusNode: _focusNodes[index],
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            style: (widget.textStyle ?? const TextStyle()).copyWith(
              fontSize: computedFontSize,
              fontWeight: FontWeight.bold,
            ),
            decoration: widget.inputDecoration ?? textFieldDecoration(null),
            maxLength: 1,
            onChanged: (value) => _onChanged(value, index),
          ),
        );
      }),
    );
  }
}
