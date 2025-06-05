import 'package:flutter/material.dart';
import 'package:investa4/core/utils/constant.dart';
import 'package:investa4/featurs/otpscreen/presentation/widget/otp_section.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key, required this.email, this.onTap});
  final String email;
  final Function(ValueNotifier notifier, String otp)? onTap;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset('assets/images/forgetPas.png'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Column(
              children: [
                const SizedBox(height: 80),
                OtpSection(
                  onTap: onTap,
                  email: email,
                  //  (notifier, otp) async {
                  //   if (otp.isEmpty) {
                  //     return;
                  //   }
                  //   notifier.value = true;
                  //   String? result = await verifyOtp(
                  //       email: email, otp: notifier.value.toString());
                  //   notifier.value = false;
                  // },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
