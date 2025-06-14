import 'package:flutter/material.dart';
import 'package:investa4/core/widgets/founder_side_bar.dart';
import 'package:investa4/core/widgets/standard_founder_scaffold.dart';
import 'package:investa4/featurs/transactions/presentation/widgets/history_chart.dart';

class FounderTransaction extends StatelessWidget {
  const FounderTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    return StandardFounderScaffold(
      screenType: FounderSideMenuScreen.transaction,
      isMain: false,
      title: 'Transaction',
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [HistoryChart(bars: bars)],
        ),
      ),
    );
  }
}

const bars = <BarData>[
  BarData('2023', 0.2, false),
  BarData('2024', 0.1, false),
  BarData('2025', 0.4, true),
  BarData('2026', 0, false),
];
