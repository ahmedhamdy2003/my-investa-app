import 'package:flutter/material.dart';

OutlineInputBorder get textFieldBorder {
  return const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
    borderSide: BorderSide(color: Colors.grey, width: 1.0),
  );
}

InputDecoration textFieldDecoration(
  String? hint, {
  String? errorText,
  bool isPassword = false,
  VoidCallback? togglePassword,
  bool obscureText = true,
  Widget? suffixIcon,
}) {
  return InputDecoration(
    labelText: hint,
    enabledBorder: textFieldBorder,
    focusedBorder: textFieldBorder,
    border: textFieldBorder,
    fillColor: Colors.white,
    filled: true,
    counterText: '',
    errorText: errorText,
    labelStyle: const TextStyle(color: Colors.black),
    suffixIcon:
        suffixIcon ??
        (isPassword
            ? InkWell(
              onTap: togglePassword,
              child:
                  obscureText
                      ? Image.asset('assets/images/notvisible.png')
                      : Image.asset('assets/images/visibility.png'),
            )
            : null),
  );
}
