import 'package:flutter/material.dart';
import 'package:investa4/core/utils/app_styles.dart';

class InvestmentItems extends StatelessWidget {
  const InvestmentItems({
    super.key,
    required this.title,
    required this.subTitle,
    this.trailingText,
  });
  final String title;
  final String subTitle;
  final String? trailingText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: AppStyles.investmentItemTitle),
              Text(subTitle, style: AppStyles.investmentISubtemTitle),
            ],
          ),
          if (trailingText != null) // Check if trailingText is not null
            Text(trailingText!, style: AppStyles.investmentItemTrailing),
        ],
      ),
    );
  }
}
