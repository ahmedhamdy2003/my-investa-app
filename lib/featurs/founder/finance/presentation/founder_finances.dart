import 'package:flutter/material.dart';
import 'package:investa4/core/widgets/founder_side_bar.dart';
import 'package:investa4/core/widgets/standard_founder_scaffold.dart';

class FounderFinance extends StatelessWidget {
  const FounderFinance({super.key});

  @override
  Widget build(BuildContext context) {
    return StandardFounderScaffold(
      screenType: FounderSideMenuScreen.finance,
      isMain: false,
      title: 'Finance',
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [],
        ),
      ),
    );
  }
}
