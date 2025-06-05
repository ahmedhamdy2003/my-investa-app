import 'package:flutter/material.dart';
import 'package:investa4/core/utils/app_styles.dart';
import 'package:investa4/core/utils/constant.dart';
import 'package:investa4/featurs/start_screen/presentation/start_screen.dart';
import 'package:investa4/featurs/term_of_service_screen/presentation/ter_screen.dart';

class TermsSection extends StatelessWidget {
  const TermsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(value: true, onChanged: (fed) {}, activeColor: mainTextColor),
        Column(
          children: [
            Text(
              'By Signing up I agree tp Investa’s',
              style: AppStyles.text14black,
            ),
            Row(
              children: [
                TabMainText(
                  text: 'Terms of Service',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TermScreen(),
                      ),
                    );
                  },
                ),
                Text(' & ', style: AppStyles.blackStyle),
                TabMainText(
                  text: 'Privacy Policy ',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TermScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
