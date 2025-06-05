import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:investa4/core/widgets/vs_text_widget.dart';
import 'package:investa4/featurs/dashboard/presentation/widgets/balance_history_chart.dart';
import 'package:investa4/featurs/dashboard/presentation/widgets/build_bar_data.dart';
import 'package:investa4/featurs/dashboard/presentation/widgets/pie_chart_with_legend.dart';

class ChartsSection extends StatelessWidget {
  const ChartsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        VsTextWidget(
          firestSection: 'Monthly ROI if you invested',
          secondSection: 'Saving',
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: AspectRatio(
            aspectRatio: 1,
            child: barData(
              seriesA: seriesA,
              seriesB: seriesB,
              labels: monthLabels,
              minY: 0,
              maxY: 500,
            ),
          ),
        ),
        PieChartWithLegend(
          data: pieChartData,
          title: 'Investing in Investa Categories ',
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 10),
          child: BalanceHistoryChart(spotsData: spots),
        ),
      ],
    );
  }
}

List<double> seriesA = [200, 0, 233, 123, 453, 20, 120];
List<double> seriesB = [500.0, 138.0, 115.0, 92.0, 0, 0, 23.0];
final monthLabels = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul'];

const pieChartData = <PieData>[
  PieData('Food & Beverage', 20, Color(0xFF254195)),
  PieData('Fashion', 15, Color(0xFFC494E9)),
  PieData('Health & Fitness', 25, null), // null→use theme secondary
  PieData('Food Trucks', 10, Color(0xFF0EDE9A)),
  PieData('Beauty', 30, Color(0xFFEDC5AE)),
];

const spots = <FlSpot>[
  FlSpot(0, 50), // Jul
  FlSpot(1, 250), // Aug
  FlSpot(2, 300), // Sep
  FlSpot(3, 750), // Oct
  FlSpot(4, 200), // Nov
  FlSpot(5, 550), // Dec
  FlSpot(6, 600), // Jan
];
