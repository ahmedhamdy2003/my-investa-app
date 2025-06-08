import 'package:flutter/material.dart';
import 'package:investa4/core/utils/app_styles.dart';

class DasboardItems extends StatelessWidget {
  const DasboardItems({
    super.key,
    required this.title,
    required this.subTitle,
    this.trailingText,
    this.trailGreen = false,
    this.iconPath,
    this.normalTrailingText = false,
  });
  final String title;
  final String subTitle;
  final String? trailingText;
  final bool trailGreen;
  final String? iconPath;
  final bool normalTrailingText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                child:
                    iconPath != null
                        ? Image.asset(iconPath!)
                        : const Icon(Icons.person),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppStyles.dashItemTitle),
                  Text(subTitle, style: AppStyles.dashISubtemTitle),
                ],
              ),
            ],
          ),
          if (trailingText != null) // Check if trailingText is not null
            Text(
              trailingText!,
              style:
                  normalTrailingText
                      ? AppStyles.dashItemNormalTraining
                      : trailGreen
                      ? AppStyles.dashItemgreenTraining
                      : AppStyles.dashItemRedTraining,
            ),
        ],
      ),
    );
  }
}
