import 'package:flutter/material.dart';
import 'package:investa4/core/utils/constant.dart';
import 'package:investa4/core/widgets/sidebar.dart';
import 'package:investa4/featurs/dashboard/manager/manage_dashboard.dart';
import 'package:investa4/featurs/dashboard/presentation/widgets/business_performance_section.dart';
import 'package:investa4/featurs/dashboard/presentation/widgets/charts_section.dart';
import 'package:investa4/featurs/dashboard/presentation/widgets/dash_board_top_section.dart';
import 'package:investa4/featurs/dashboard/presentation/widgets/over_view_section.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  ManageDashboard manageDashboard = ManageDashboard();
  bool initDone = false;
  @override
  void initState() {
    super.initState();
    manageDashboard.init().then((_) {
      setState(() {
        initDone = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // manageDashboard.init();
    var topPadding = MediaQuery.of(context).padding.top;
    return Scaffold(
      key: _scaffoldKey,
      drawer: SideBar(currentScreen: SideMenuScreen.home),
      body:
          initDone == false
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
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
                          OverViewSection(manageDashboard: manageDashboard),
                          BusinessPerformanceSection(
                            manageDashboard: manageDashboard,
                          ),
                          ChartsSection(manageDashboard: manageDashboard),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
    );
  }
}
