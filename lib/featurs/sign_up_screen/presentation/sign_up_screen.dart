// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:investa4/core/apis/request_otp.dart';
import 'package:investa4/core/apis/verify_otp.dart';
import 'package:investa4/core/model/user.dart';
import 'package:investa4/core/utils/app_styles.dart';
import 'package:investa4/core/utils/constant.dart';
import 'package:investa4/core/widgets/custom_buttons.dart';
import 'package:investa4/core/widgets/custom_text_field.dart';
import 'package:investa4/featurs/otpscreen/presentation/otp_screen.dart';
import 'package:investa4/featurs/sign_up_screen/manager/manage_signup.dart';
import 'package:investa4/featurs/sign_up_screen/presentation/widgets/date_picker_text_field.dart';
import 'package:investa4/featurs/sign_up_screen/presentation/widgets/password_valid_item.dart';
import 'package:investa4/featurs/sign_up_screen/presentation/widgets/terms_section.dart';
import 'package:investa4/presentation/screens/main_layout/main_layout.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late ManageSignUp manageSignUp;
  late TextEditingController passwordController;
  late TextEditingController emailController;
  late TextEditingController userNAmeController;
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String userName = '';
  DateTime? birthDate;
  String password = '';
  @override
  void initState() {
    super.initState();
    manageSignUp = ManageSignUp();
    passwordController = TextEditingController();
    emailController = TextEditingController();
    userNAmeController = TextEditingController();
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    bool atLeast8Character = value.length >= 8;
    bool atLeast8Number = value.contains(RegExp(r'\d'));
    bool bothUpperAndLower =
        value.contains(RegExp(r'[A-Z]')) && value.contains(RegExp(r'[a-z]'));

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // setState(() {
      manageSignUp.atLeast8Character = atLeast8Character;
      manageSignUp.atLeast8Number = atLeast8Number;
      manageSignUp.bothUpperAndLower = bothUpperAndLower;
      // });
      manageSignUp.rebuildPasswordValideItem.value =
          !manageSignUp.rebuildPasswordValideItem.value;
    });

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
  void dispose() {
    passwordController.dispose();
    emailController.dispose();
    userNAmeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset('assets/images/bb2.png'),
          Positioned(
            top: 60,
            right: 0,
            child: Image.asset('assets/images/bb4.png'),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: horizontalPadding,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Create \n Account', style: AppStyles.headerText),
                      Text('Email Address', style: AppStyles.text14black),
                      verticalSpce,
                      CustomTextField(
                        hint: 'example@.com',
                        controller: emailController,
                        validator: (p0) {
                          if ((p0 == null || p0.isEmpty)) {
                            return 'Mail is required';
                          }
                          // Regex for validating email address
                          final emailRegex = RegExp(
                            r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                          );
                          // Validate if the input is a valid email
                          if (!emailRegex.hasMatch(p0)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                      verticalSpce,
                      Text('User Name', style: AppStyles.text14black),
                      verticalSpce,
                      CustomTextField(
                        hint: 'example',
                        controller: userNAmeController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'User name is required';
                          }
                          return null;
                        },
                      ),
                      verticalSpce,
                      Text('Birth Date', style: AppStyles.text14black),
                      verticalSpce,
                      DatePickerTextField(
                        hint: '9-9-9999',
                        validator: (p0) {
                          if (p0 == null || p0.isEmpty) {
                            return 'Birth date is required';
                          }
                          return null;
                        },
                        onDateSelected: (date) {
                          birthDate = date;
                        },
                      ),
                      verticalSpce,
                      Text('Password', style: AppStyles.text14black),
                      verticalSpce,
                      CustomTextField(
                        hint: 'password',
                        isPassword: true,
                        controller: passwordController,
                        validator: _validatePassword,
                      ),
                      verticalSpce,
                      ValueListenableBuilder(
                        valueListenable: manageSignUp.rebuildPasswordValideItem,
                        builder: (context, value, child) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              PasswordValidItem(
                                title: 'At Least 8 characters',
                                isValid: manageSignUp.atLeast8Character,
                              ),
                              PasswordValidItem(
                                title: 'At Least a number',
                                isValid: manageSignUp.atLeast8Number,
                              ),
                              PasswordValidItem(
                                title: 'Both upper & lower case letters',
                                isValid: manageSignUp.bothUpperAndLower,
                              ),
                            ],
                          );
                        },
                      ),
                      verticalSpce,
                      ValueListenableBuilder(
                        valueListenable: manageSignUp.rebuildDoneButton,
                        builder: (context, value, child) {
                          return CustomButtom(
                            title: 'Done',
                            loading: manageSignUp.rebuildDoneButton.value,
                            onTap: () async {
                              if (_formKey.currentState?.validate() ?? false) {
                                // Perform sign up action
                                manageSignUp.rebuildDoneButton.value = true;
                                bool otpSend = await requestOtp(
                                  RequestOtp(
                                    email: emailController.text,
                                    password: passwordController.text,
                                    full_name: userNAmeController.text,
                                    date_of_birth: birthDate ?? DateTime.now(),
                                  ),
                                );
                                manageSignUp.rebuildDoneButton.value = false;
                                if (!otpSend) {
                                  return;
                                }
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (context) => OtpScreen(
                                          email: emailController.text,
                                          onTap: (notifier, otp) async {
                                            if (otp.isEmpty) {
                                              return;
                                            }
                                            notifier.value = true;
                                            String? userId = await verifyOtp(
                                              email: emailController.text,
                                              otp: otp,
                                            );
                                            if (userId != null) {
                                              UserMethods.saveUser(
                                                UserModel(
                                                  signedUp: true,
                                                  guid: userId,
                                                  email: emailController.text,
                                                  username:
                                                      userNAmeController.text,
                                                  birthdate:
                                                      birthDate ??
                                                      DateTime.now(),
                                                ),
                                              );
                                              Navigator.of(
                                                context,
                                              ).pushAndRemoveUntil(
                                                MaterialPageRoute(
                                                  builder:
                                                      (context) => MainLayout(),
                                                ),
                                                (Route<dynamic> route) => false,
                                              );
                                            }

                                            notifier.value = false;
                                          },
                                        ),
                                  ),
                                );
                                // Simulate a network call
                                // Future.delayed(const Duration(seconds: 2), () {
                                //   manageSignUp.rebuildDoneButton.value = false;
                                //   Navigator.pushReplacement(
                                //     context,
                                //     MaterialPageRoute(
                                //       builder: (context) => const StartScreen(),
                                //     ),
                                //   );
                                // });
                              }
                            },
                          );
                        },
                      ),
                      verticalSpce,
                      Center(
                        child: CancelButton(
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      verticalSpce,
                      TermsSection(),
                      verticalSpce,
                      verticalSpce,
                      verticalSpce,
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
