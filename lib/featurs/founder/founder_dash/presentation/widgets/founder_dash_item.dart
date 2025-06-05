import 'package:flutter/material.dart';
import 'package:investa4/core/utils/app_styles.dart';

class FounderDashItem extends StatelessWidget {
  final String iconPath;
  final String title;
  final String value;

  const FounderDashItem({
    super.key,
    required this.iconPath,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.grey.shade200,
        //     blurRadius: 6,
        //     offset: const Offset(0, 3),
        //   ),
        // ],
      ),
      child: Row(
        children: [
          Image.asset(iconPath, width: 44, height: 44),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: AppStyles.founderISubtemTitle),
              const SizedBox(height: 4),
              Text(value, style: AppStyles.founderDashItemTitle),
            ],
          ),
        ],
      ),
    );
  }
}
