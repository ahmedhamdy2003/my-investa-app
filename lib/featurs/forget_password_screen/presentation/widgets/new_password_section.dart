import 'package:flutter/material.dart';
import 'package:investa4/core/utils/app_styles.dart';
import 'package:investa4/core/utils/constant.dart';
import 'package:investa4/core/widgets/custom_buttons.dart';
import 'package:investa4/core/widgets/custom_text_field.dart';

class NewPasswordSection extends StatefulWidget {
  const NewPasswordSection({super.key});

  @override
  State<NewPasswordSection> createState() => _NewPasswordSectionState();
}

class _NewPasswordSectionState extends State<NewPasswordSection> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    bool atLeast8Character = value.length >= 8;
    bool atLeast8Number = value.contains(RegExp(r'\d'));
    bool bothUpperAndLower =
        value.contains(RegExp(r'[A-Z]')) && value.contains(RegExp(r'[a-z]'));

    if (!atLeast8Character) {
      return 'Password must be at least 8 characters long';
    }
    if (!atLeast8Number) {
      return 'Password must contain at least one number';
    }
    if (!bothUpperAndLower) {
      return 'Password must contain both upper and lower case letters';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Forgot password?',
            style: AppStyles.headerText.copyWith(fontSize: 36),
          ),
          Text(
            'Set your new password to login into your account!',
            style: AppStyles.text15,
          ),
          verticalSpce,
          Text('New Password', style: AppStyles.text14black),
          smallVerticalSpce,
          CustomTextField(
            hint: '',
            isPassword: true,
            validator: _validatePassword,
          ),
          verticalSpce,
          Text('Confirm Password', style: AppStyles.text14black),
          smallVerticalSpce,
          CustomTextField(
            hint: '',
            isPassword: true,
            validator:
                (p0) => p0!.isEmpty ? 'Confirm Password is required' : null,
          ),
          bigVerticalSpce,
          CustomButtom(
            title: 'Sumbit',
            onTap: () {
              if (formKey.currentState!.validate()) {}
            },
          ),
        ],
      ),
    );
  }
}
