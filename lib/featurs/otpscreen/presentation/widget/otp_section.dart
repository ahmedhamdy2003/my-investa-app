import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:investa4/core/utils/app_styles.dart';
import 'package:investa4/core/utils/constant.dart';
import 'package:investa4/core/widgets/custom_buttons.dart';
import 'package:investa4/featurs/otpscreen/presentation/widget/otp_text_field.dart';

class OtpSection extends StatefulWidget {
  const OtpSection({
    super.key,
    this.onTap,
    this.headerText,
    required this.email,
  });
  final Function(ValueNotifier notifier, String otp)? onTap;
  final String? headerText;
  final String email;
  @override
  State<OtpSection> createState() => _OtpSectionState();
}

class _OtpSectionState extends State<OtpSection> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  ValueNotifier<bool> rebuildForgetPasswordWidget = ValueNotifier<bool>(false);
  String otp = '';
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.headerText ?? 'Email verification',
          style: AppStyles.headerText.copyWith(fontSize: 36),
        ),
        Text(
          'Enter the verification code we send you on: \n ${widget.email}',
          style: AppStyles.text15,
        ),
        verticalSpce,
        verticalSpce,
        bigVerticalSpce,
        Form(
          key: formKey,
          child: OTPTextField(
            length: 6,
            onCompleted: (texts) {
              log('otp $texts');
              otp = texts;
            },
          ),
        ),
        verticalSpce,
        verticalSpce,
        bigVerticalSpce,
        ValueListenableBuilder(
          valueListenable: rebuildForgetPasswordWidget,
          builder: (context, value, child) {
            return CustomButtom(
              loading: rebuildForgetPasswordWidget.value,
              title: 'Verify',
              onTap: () {
                if (formKey.currentState!.validate()) {
                  // ManageForgetPassword.currentSection =
                  //     const NewPasswordSection();
                  // rebuildForgetPasswordWidget.value =
                  //     !rebuildForgetPasswordWidget.value;
                  widget.onTap?.call(rebuildForgetPasswordWidget, otp);
                }
              },
            );
          },
        ),
      ],
    );
  }
}
