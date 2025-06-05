import 'package:flutter/material.dart';
import 'package:investa4/core/utils/constant.dart';
import 'package:investa4/core/widgets/sidebar.dart';
import 'package:investa4/featurs/dashboard/presentation/widgets/business_performance_section.dart';
import 'package:investa4/featurs/dashboard/presentation/widgets/charts_section.dart';
import 'package:investa4/featurs/dashboard/presentation/widgets/dash_board_top_section.dart';
import 'package:investa4/featurs/dashboard/presentation/widgets/over_view_section.dart';

class Dashboard extends StatelessWidget {
  Dashboard({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var topPadding = MediaQuery.of(context).padding.top;
    return Scaffold(
      key: _scaffoldKey,
      drawer: SideBar(currentScreen: SideMenuScreen.home),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: topPadding),
            DashBoardTopSection(scaffoldKey: _scaffoldKey),
            verticalSpce,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  OverViewSection(),
                  BusinessPerformanceSection(),
                  ChartsSection(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
