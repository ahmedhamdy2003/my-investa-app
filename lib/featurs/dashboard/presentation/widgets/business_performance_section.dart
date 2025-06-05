import 'package:flutter/material.dart';
import 'package:investa4/core/utils/app_styles.dart';
import 'package:investa4/featurs/dashboard/presentation/widgets/dasboard_items.dart';

class BusinessPerformanceSection extends StatelessWidget {
  const BusinessPerformanceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Business Performance ', style: AppStyles.vsTitleStyle),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              DasboardItems(
                title: 'Zerosugar by ketonista  ',
                subTitle: 'Started investing since →  1-1-2025 ',
              ),
              DasboardItems(
                title: 'total WWW',
                subTitle: 'Since 1 January 2025',
                trailingText: '12.322 LE',
                trailGreen: true,
              ),
              DasboardItems(
                title: 'NEXT w',
                subTitle: 'short',
                trailingText: 'short',
                trailGreen: true,
              ),
              DasboardItems(
                title: 'Businesses you Invested in ',
                subTitle: 'Zero sugar by ketonista - Fakhr ',
                // trailingText: '12.322 LE',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
