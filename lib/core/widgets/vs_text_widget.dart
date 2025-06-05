import 'package:flutter/material.dart';
import 'package:investa4/core/utils/app_styles.dart';

class VsTextWidget extends StatelessWidget {
  const VsTextWidget({
    super.key,
    required this.firestSection,
    required this.secondSection,
  });
  final String firestSection;
  final String secondSection;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: AppStyles.vsTitleStyle,
        children: [
          TextSpan(text: firestSection),
          TextSpan(text: ' Vs ', style: TextStyle(color: Color(0xFFDD2925))),
          TextSpan(text: secondSection),
        ],
      ),
    );
  }
}
