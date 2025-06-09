import 'package:flutter/material.dart';
import 'package:investa4/core/widgets/sidebar.dart';
import 'package:investa4/featurs/transactions/presentation/widgets/history_chart.dart';
import 'package:investa4/featurs/transactions/presentation/widgets/tables_widget.dart';
import 'package:investa4/featurs/transactions/presentation/widgets/transaction_top_section.dart';

class Treansactions extends StatelessWidget {
  Treansactions({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var topPadding = MediaQuery.of(context).padding.top;
    return Scaffold(
      key: _scaffoldKey,
      drawer: const SideBar(currentScreen: SideMenuScreen.transaction),
      backgroundColor: const Color(0xFFF5F7FA),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: topPadding),
            TransactionTopSection(scaffoldKey: _scaffoldKey),
            const SizedBox(height: 12),
            const HistoryChart(),
            const SizedBox(height: 16),
            const RecentTransactions(),
          ],
        ),
      ),
    );
  }
}
