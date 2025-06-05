import 'package:flutter/material.dart';
import 'package:investa4/core/utils/text_field_style.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.validator,
    required this.hint,
    this.isPassword = false,
    this.controller,
    this.suffixIcon,
    this.addAutovalidateMode = false,
  });

  final String? Function(String?)? validator;
  final String hint;
  final bool isPassword;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final bool addAutovalidateMode;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      autovalidateMode:
          (widget.isPassword || widget.addAutovalidateMode)
              ? AutovalidateMode.onUserInteraction
              : null,
      decoration: textFieldDecoration(
        widget.hint,
        suffixIcon: widget.suffixIcon,
        isPassword: widget.isPassword,
        togglePassword:
            widget.isPassword
                ? () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                }
                : null,
        obscureText: _obscureText,
      ),
      obscureText: widget.isPassword ? _obscureText : false,
      validator: widget.validator,
    );
  }
}
