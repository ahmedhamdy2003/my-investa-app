import 'package:flutter/material.dart';import 'package:investa4/core/utils/app_styles.dart';
import 'package:investa4/featurs/dashboard/presentation/widgets/dasboard_items.dart';

class OverViewSection extends StatelessWidget {
  const OverViewSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Overview',
          style: AppStyles.vsTitleStyle,
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              DasboardItems(
                title: 'total investments',
                subTitle: 'Since 1 January 2025',
                trailingText: '12.322 LE',
              ),
              DasboardItems(
                title: 'total returns',
                subTitle: 'Since 1 January 2025',
                trailingText: '12.322 LE',
              ),
              DasboardItems(
                title: 'Inverstment returns',
                subTitle: 'short',
                trailingText: 'short',
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