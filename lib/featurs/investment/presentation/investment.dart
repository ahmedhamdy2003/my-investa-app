import 'package:flutter/material.dart';
import 'package:investa4/core/utils/app_styles.dart';
import 'package:investa4/core/widgets/search_text_field.dart';
import 'package:investa4/core/widgets/shared_top_section.dart';
import 'package:investa4/core/widgets/sidebar.dart';
import 'package:investa4/featurs/investment/presentation/widgets/investment_items.dart';

class Investment extends StatelessWidget {
  Investment({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var topPadding = MediaQuery.of(context).padding.top;

    return Scaffold(
      key: _scaffoldKey,
      drawer: const SideBar(currentScreen: SideMenuScreen.investment),
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
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SearchTextField(
                    hintText: 'Search for businesses you investment in',
                  ),
                  const SizedBox(height: 32),
                  Text(
                    'Zero sugar by ketonista',
                    style: AppStyles.vsTitleStyle,
                  ),
                  ...List.generate(
                    5,
                    (index) => const InvestmentItems(
                      title: 'type',
                      subTitle: 'Started investing since →  1-1-2025 ',
                      trailingText: 'Long term',
                    ),
                  ),
                  Text(
                    'Zero sugar by ketonista',
                    style: AppStyles.vsTitleStyle,
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
