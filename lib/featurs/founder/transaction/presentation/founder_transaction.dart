import 'package:flutter/material.dart';
import 'package:investa4/core/widgets/founder_side_bar.dart';
import 'package:investa4/core/widgets/standard_founder_scaffold.dart';

class FounderTransaction extends StatelessWidget {
  const FounderTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    return StandardFounderScaffold(
      screenType: FounderSideMenuScreen.transaction,
      isMain: false,
      title: 'Transaction',
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
