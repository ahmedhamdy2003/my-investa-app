import 'package:flutter/material.dart';
import 'package:investa4/core/utils/global_variables.dart';

void showSnackBar(String message, BuildContext? context, {TextStyle? style}) {
  if (context == null) return;
  final snackBar = SnackBar(
    // backgroundColor: ManageAppFirm.subBgColor,
    behavior: SnackBarBehavior.floating,
    shape: const StadiumBorder(),
    elevation: 30,
    content: Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 400),
        child: SingleChildScrollView(child: Text(message, style: style)),
      ),
    ),
  );
  try {
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  } catch (e) {
    debugPrint(e.toString());
  }
}

void showDebugSnackBar(String message, BuildContext? context) {
  if (context == null || !debugging) return;
  showSnackBar('Debug: $message', context);
}
