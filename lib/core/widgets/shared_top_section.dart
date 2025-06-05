import 'package:flutter/material.dart';
import 'package:investa4/core/utils/app_styles.dart';
import 'package:investa4/core/utils/constant.dart';

class SharedTopSection extends StatelessWidget {
  const SharedTopSection({super.key, this.onTap});
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Hamburger menu icon
        const SizedBox(width: 20),
        InkWell(
          onTap: onTap,
          child: const Icon(Icons.menu, color: sideMenuColor, size: 24),
        ),

        // Spacer to center the logo
        const Spacer(),

        // Title or logo text
        Text('INVESTA', style: AppStyles.invistaTopSectionStyle),
        const SizedBox(width: 25),
        // Spacer to balance the layout (same as the menu icon width)
        const Spacer(),
      ],
    );
  }
}
