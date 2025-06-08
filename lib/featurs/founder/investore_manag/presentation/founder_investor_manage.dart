import 'package:flutter/material.dart';
import 'package:investa4/core/widgets/founder_side_bar.dart';
import 'package:investa4/core/widgets/standard_founder_scaffold.dart';

class FounderInvestorManage extends StatelessWidget {
  const FounderInvestorManage({super.key});

  @override
  Widget build(BuildContext context) {
    return StandardFounderScaffold(
      screenType: FounderSideMenuScreen.investorManage,
      isMain: false,
      title: 'Investor Management',
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [],
        ),
      ),
    );
  }
}
