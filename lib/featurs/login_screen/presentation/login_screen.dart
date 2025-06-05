import 'package:flutter/material.dart';
import 'package:investa4/core/utils/app_styles.dart';
import 'package:investa4/core/utils/constant.dart';
import 'package:investa4/core/widgets/custom_buttons.dart';
import 'package:investa4/core/widgets/custom_text_field.dart';
import 'package:investa4/featurs/forget_password_screen/presentation/forget_password.dart';
import 'package:investa4/featurs/login_screen/manager/manage_login.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final ManageLogin manageLogin = ManageLogin();
  @override
  void dispose() {
    manageLogin.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset('assets/images/bubble 02.png'),
            Image.asset(
              'assets/images/bubble 01.png',
              height: 200,
              width: 200,
              fit: BoxFit.fill,
            ),
            Positioned(
              right: 0,
              top: size.height * 0.2,
              child: Image.asset('assets/images/bubblle 03.png'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: horizontalPadding,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: size.height * 0.25),
                    child: Form(
                      key: manageLogin.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Login', style: AppStyles.headerText),
                          Row(
                            children: [
                              Text(
                                'Good to see you back  ',
                                style: AppStyles.text19,
                              ),
                              Image.asset('assets/images/heart.png'),
                            ],
                          ),
                          verticalSpce,
                          verticalSpce,
                          EmailSection(manageLogin: manageLogin),
                          verticalSpce,
                          PasswordSection(manageLogin: manageLogin),
                          Padding(
                            padding: EdgeInsets.only(top: size.height * 0.2),
                            child: ValueListenableBuilder(
                              valueListenable: manageLogin.rebuildNextButton,
                              builder: (context, value, child) {
                                return CustomButtom(
                                  loading: manageLogin.rebuildNextButton.value,
                                  title: 'Next',
                                  onTap: () {
                                    if (manageLogin.formKey.currentState!
                                        .validate()) {
                                      manageLogin.checkLoginVerification(
                                        context: context,
                                      );
                                    }
                                  },
                                );
                              },
                            ),
                          ),
                          verticalSpce,
                          Center(child: CancelButton(onTap: () {})),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EmailSection extends StatelessWidget {
  const EmailSection({super.key, required this.manageLogin});
  final ManageLogin manageLogin;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Email Address', style: AppStyles.text14black),
        verticalSpce,
        CustomTextField(
          hint: 'example@.com',
          controller: manageLogin.emailController,
          validator: (p0) {
            if (p0 == null || p0.isEmpty) {
              return 'Email is required';
            }
            if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(p0)) {
              return 'Enter a valid email';
            }
            return null;
          },
        ),
      ],
    );
  }
}

class PasswordSection extends StatelessWidget {
  const PasswordSection({super.key, required this.manageLogin});
  final ManageLogin manageLogin;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Password', style: AppStyles.text14black),
        verticalSpce,
        CustomTextField(
          hint: 'password',
          isPassword: true,
          controller: manageLogin.passwordController,
          validator: (p0) {
            if (p0 == null || p0.isEmpty) {
              return 'Password is required';
            }
            if (p0.length < 6) {
              return 'Password must be at least 6 characters';
            }
            return null;
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ForgetPassword();
                    },
                  ),
                );
              },
              child: Text('forgot password?', style: AppStyles.text14black),
            ),
          ],
        ),
      ],
    );
  }
}
