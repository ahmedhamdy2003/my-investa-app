import 'package:flutter/material.dart';
import 'package:investa4/core/utils/app_styles.dart';

class PasswordValidItem extends StatelessWidget {
  const PasswordValidItem({
    super.key,
    required this.title,
    required this.isValid,
  });
  final String title;
  final bool isValid;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child:
                isValid
                    ? Image.asset('assets/images/approved.png')
                    : Image.asset('assets/images/Cancel.png'),
          ),
          Text(title, style: AppStyles.passValStyle),
        ],
      ),
    );
  }
}
