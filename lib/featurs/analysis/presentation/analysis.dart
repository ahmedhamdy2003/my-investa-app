import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:investa4/core/utils/app_styles.dart';
import 'package:investa4/core/widgets/search_text_field.dart';
import 'package:investa4/core/widgets/shared_top_section.dart';
import 'package:investa4/core/widgets/sidebar.dart';
import 'package:investa4/core/widgets/vs_text_widget.dart';
import 'package:investa4/featurs/dashboard/presentation/widgets/balance_history_chart.dart';
import 'package:investa4/featurs/dashboard/presentation/widgets/build_bar_data.dart';
import 'package:investa4/featurs/dashboard/presentation/widgets/pie_chart_with_legend.dart';

class Analysis extends StatelessWidget {
  Analysis({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var topPadding = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      drawer: const SideBar(currentScreen: SideMenuScreen.analysis),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: topPadding),
            SharedTopSection(
              onTap: () {
                _scaffoldKey.currentState?.openDrawer();
              },
            ),
            const Padding(
              padding: EdgeInsets.all(20),
              child: SearchTextField(
                hintText: 'Search for businesses you investment in',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text('Analysis', style: AppStyles.vsTitleStyle),
                  ),
                  const SizedBox(height: 14),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'Ratio in your investment',
                      style: AppStyles.vsTitleStyle,
                    ),
                  ),
                  const SizedBox(height: 14),
                  const PieChartWithLegend(
                    data: pieChartData,
                    title: 'Investing in Investa Categories ',
                  ),
                  const PieChartWithLegend(
                    data: pieChartData2,
                    title: 'Your investments',
                  ),
                  const VsTextWidget(
                    firestSection: ' ROI if you invested',
                    secondSection: 'Saving',
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40),
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: barData(
                        investing: seriesA,
                        saving: seriesB,
                        labels: monthLabels,
                        minY: 0,
                        maxY: 500,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 40,
                      horizontal: 10,
                    ),
                    child: BalanceHistoryChart(spotsData: spots),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

const pieChartData = <PieData>[
  PieData('Food & Beverage', 20, Color(0xFF254195)),
  PieData('Fashion', 15, Color(0xFFC494E9)),
  PieData('Health & Fitness', 25, null), // null→use theme secondary
  PieData('Food Trucks', 10, Color(0xFF0EDE9A)),
  PieData('Beauty', 30, Color(0xFFEDC5AE)),
];
const pieChartData2 = <PieData>[
  PieData('Zerosugar by ketonista', 56.3, Color(0xFF254195)),
  PieData('Fakhr', 43.7, Color(0xFFC494E9)),
];

List<double> seriesA = [200, 0, 233, 123, 453, 20, 120];
List<double> seriesB = [500.0, 138.0, 115.0, 92.0, 500, 480, 23.0];
final monthLabels = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul'];

const spots = <FlSpot>[
  FlSpot(0, 150), // Jul
  FlSpot(1, 250), // Aug
  FlSpot(2, 300), // Sep
  FlSpot(3, 750), // Oct
  FlSpot(4, 700), // Nov
  FlSpot(5, 550), // Dec
  FlSpot(6, 100), // Jan
];
