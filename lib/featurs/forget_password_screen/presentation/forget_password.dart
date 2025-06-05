import 'package:flutter/material.dart';
import 'package:investa4/core/utils/constant.dart';
import 'package:investa4/core/utils/global_variables.dart';
import 'package:investa4/featurs/forget_password_screen/manager/manage_forget_password.dart';
import 'package:investa4/featurs/forget_password_screen/presentation/widgets/email_section.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  void initState() {
    super.initState();
    ManageForgetPassword.currentSection = ForgetPasswordEnterEmailSection();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset('assets/images/forgetPas.png'),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: horizontalPadding,
              ),
              child: ValueListenableBuilder(
                valueListenable: rebuildForgetPasswordWidget,
                builder: (context, value, child) {
                  return Column(
                    children: [
                      const SizedBox(height: 80),
                      ManageForgetPassword.currentSection!,
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
