import 'package:flutter/material.dart';
import 'package:investa4/core/apis/send_reset_links.dart';
import 'package:investa4/core/utils/app_styles.dart';
import 'package:investa4/core/utils/constant.dart';
import 'package:investa4/core/utils/global_variables.dart';
import 'package:investa4/core/widgets/custom_buttons.dart';
import 'package:investa4/core/widgets/custom_text_field.dart';
import 'package:investa4/featurs/forget_password_screen/manager/manage_forget_password.dart';
import 'package:investa4/featurs/forget_password_screen/presentation/widgets/new_password_section.dart';
import 'package:investa4/featurs/otpscreen/presentation/widget/otp_section.dart';

class ForgetPasswordEnterEmailSection extends StatefulWidget {
  const ForgetPasswordEnterEmailSection({super.key});

  @override
  State<ForgetPasswordEnterEmailSection> createState() =>
      _ForgetPasswordEnterEmailSectionState();
}

class _ForgetPasswordEnterEmailSectionState
    extends State<ForgetPasswordEnterEmailSection> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Forgot password?',
          style: AppStyles.headerText.copyWith(fontSize: 36),
        ),
        Text(
          'Enter your email address and we’ll send you confirmation code to reset your password.',
          style: AppStyles.text15,
        ),
        bigVerticalSpce,
        verticalSpce,
        Text('Email Address', style: AppStyles.text14black),
        verticalSpce,
        Form(
          key: formKey,
          child: CustomTextField(
            addAutovalidateMode: true,
            controller: emailController,
            hint: 'example@.com',
            validator: (value) {
              if ((value == null || value.isEmpty)) {
                return 'Mail is required';
              }
              // Regex for validating email address
              final emailRegex = RegExp(
                r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
              );
              // Regex for validating 11-digit phone number
              // final phoneRegex = RegExp(r'^\d{11}$');

              // Validate if the input is a valid email or a valid phone number
              if (!emailRegex.hasMatch(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
        ),
        verticalSpce,
        verticalSpce,
        bigVerticalSpce,
        CustomButtom(
          title: 'Sumbit',
          onTap: () async {
            if (formKey.currentState!.validate()) {
              rebuildForgetPasswordWidget.value = true;
              // ManageForgetPassword.email = emailController.text;
              bool isSend = await sendResetLink(emailController.text);
              rebuildForgetPasswordWidget.value = false;
              if (!isSend) {
                return;
              }
              ManageForgetPassword.currentSection = OtpSection(
                email: emailController.text,
                onTap: (notifier, otp) {
                  ManageForgetPassword.currentSection =
                      const NewPasswordSection();
                },
              );
            }
          },
        ),
      ],
    );
  }
}
