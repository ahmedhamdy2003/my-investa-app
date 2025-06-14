import 'package:flutter/material.dart';
import 'package:investa4/core/utils/app_styles.dart';
import 'package:investa4/core/widgets/custom_lines_charts.dart';
import 'package:investa4/core/widgets/founder_side_bar.dart';
import 'package:investa4/core/widgets/single_line_chart.dart';
import 'package:investa4/core/widgets/standard_founder_scaffold.dart';
import 'package:investa4/core/widgets/vs_text_widget.dart';
import 'package:investa4/featurs/dashboard/presentation/widgets/build_bar_data.dart';

class FounderAnalytics extends StatelessWidget {
  const FounderAnalytics({super.key});

  @override
  Widget build(BuildContext context) {
    return StandardFounderScaffold(
      screenType: FounderSideMenuScreen.analysis,
      isMain: false,
      title: 'Analytics',
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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

            Text(
              'Portfolio Perfomance ',
              style: AppStyles.founderAnalysisSectionTitle1,
            ),
            const SizedBox(height: 12),
            CustomLineChart(data: mockData),

            const VsTextWidget(
              firestSection: 'Investment Return',
              secondSection: 'Comparison Data',
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: AspectRatio(
                aspectRatio: 1,
                child: barData(
                  title1: 'Comparison',
                  title2: 'Investing',
                  investing: seriesA,
                  saving: seriesB,
                  labels: monthLabels,
                  minY: 0,
                  maxY: 500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final chartData = [
  LineChartModel(month: "Apr", data1: 11000, data2: 10000),
  LineChartModel(month: "May", data1: 3000, data2: 20000),
  LineChartModel(month: "Jun", data1: 50000, data2: 35000),
  LineChartModel(month: "Jul", data1: 20000, data2: 10000),
  LineChartModel(month: "Aug", data1: 10000, data2: 20000),
  LineChartModel(month: "Sep", data1: 40000, data2: 40000),
];

List<CustomLineChartData> mockData = [
  CustomLineChartData(label: 2016, value: 20000),
  CustomLineChartData(label: 2017, value: 30000),
  CustomLineChartData(label: 2018, value: 30000),
  CustomLineChartData(label: 2019, value: 10000),
  CustomLineChartData(label: 2020, value: 40000),
  CustomLineChartData(label: 2021, value: 35000),
];

List<double> seriesA = [400, 0, 133, 223, 403, 20, 100];
List<double> seriesB = [400.0, 438.0, 415.0, 92.0, 50, 0, 29.0];
final monthLabels = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul'];
