import 'package:flutter/material.dart';
import 'package:investa4/core/utils/app_styles.dart';
import 'package:investa4/core/widgets/custom_lines_charts.dart';
import 'package:investa4/core/widgets/founder_filter.dart';
import 'package:investa4/core/widgets/founder_side_bar.dart';
import 'package:investa4/core/widgets/single_line_chart.dart';
import 'package:investa4/core/widgets/standard_founder_scaffold.dart';
import 'package:investa4/featurs/founder/founder_dash/presentation/widgets/founder_dash_item.dart';

class FounderDashboard extends StatelessWidget {
  const FounderDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return StandardFounderScaffold(
      screenType: FounderSideMenuScreen.home,
      isMain: true,
      title: 'Dashboard',
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const FounderFilter(),
            const SizedBox(height: 20),
            const FounderDashItem(
              iconPath: 'assets/icon/totalinv.png',
              title: 'Total Invested Amount',
              value: '\$12,345',
            ),
            const SizedBox(height: 6),
            const FounderDashItem(
              iconPath: 'assets/icon/numberinv.png',
              title: 'Number of Investors',
              value: '\$12,345',
            ),
            const SizedBox(height: 6),
            const FounderDashItem(
              iconPath: 'assets/icon/revenue.png',
              title: 'Revenue',
              value: '\$12,345',
            ),
            const SizedBox(height: 6),
            const FounderDashItem(
              iconPath: 'assets/icon/profit.png',
              title: 'profit',
              value: '\$12,345',
            ),
            const SizedBox(height: 6),
            const SizedBox(height: 12),
            Text(
              'Investment Return',
              style: AppStyles.founderAnalysisSectionTitle1,
            ),
            const SizedBox(height: 12),
            InvestmentLineChart(
              data: chartData,
              data1Title: 'Investment Return',
              data2Title: 'Comparison Data',
            ),
            const SizedBox(height: 22),
            CustomLineChart(data: mockData),
            const SizedBox(height: 22),
          ],
        ),
      ),
    );
  }
}

final chartData = [
  LineChartModel(month: "Apr", data1: 15000, data2: 10000),
  LineChartModel(month: "May", data1: 5000, data2: 20000),
  LineChartModel(month: "Jun", data1: 20000, data2: 15000),
  LineChartModel(month: "Jul", data1: 25000, data2: 30000),
  LineChartModel(month: "Aug", data1: 40000, data2: 10000),
  LineChartModel(month: "Sep", data1: 10000, data2: 20000),
];

List<CustomLineChartData> mockData = [
  CustomLineChartData(label: '2016', value: 10000),
  CustomLineChartData(label: '2017', value: 20000),
  CustomLineChartData(label: '2018', value: 10000),
  CustomLineChartData(label: '2019', value: 40000),
  CustomLineChartData(label: '2020', value: 30000),
  CustomLineChartData(label: '2021', value: 35000),
];

// In your widget tree
