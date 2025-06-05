import 'package:flutter/material.dart';
import 'package:investa4/core/utils/app_styles.dart';
import 'package:investa4/featurs/dashboard/manager/manage_dashboard.dart';
import 'package:investa4/featurs/dashboard/presentation/widgets/dasboard_items.dart';

class OverViewSection extends StatelessWidget {
  const OverViewSection({super.key, required this.manageDashboard});
  final ManageDashboard manageDashboard;
  @override
  Widget build(BuildContext context) {
    return manageDashboard.dashOverView == null
        ? const SizedBox()
        : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Overview', style: AppStyles.vsTitleStyle),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  DasboardItems(
                    title: 'total investments',
                    subTitle: 'Since 1 January 2025',
                    trailingText:
                        '${manageDashboard.dashOverView!.totalInvestment} LE',
                  ),
                  DasboardItems(
                    title: 'total returns',
                    subTitle: 'Since 1 January 2025',
                    trailingText:
                        '${manageDashboard.dashOverView!.totalCurrentNetProfit} LE',
                  ),
                  DasboardItems(
                    title: 'Inverstment returns',
                    subTitle: manageDashboard.dashOverView!.investmentTypes
                        .join(', '),
                    trailingText: 'short',
                  ),
                  DasboardItems(
                    title: 'Businesses you Invested in ',
                    subTitle: manageDashboard.dashOverView!.businessesInvestedIn
                        .map((business) => business.name)
                        .join(', '),
                    // trailingText: '12.322 LE',
                  ),
                ],
              ),
            ),
          ],
        );
  }
}
