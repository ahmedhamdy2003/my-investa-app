import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:investa4/core/utils/app_styles.dart';

class HistoryChart extends StatelessWidget {
  const HistoryChart({super.key});

  // Your data model
  static const _bars = <_BarData>[
    _BarData('2023', 0.5, false),
    _BarData('2024', 0.7, false),
    _BarData('2026', 1.0, true),
    _BarData('2027', 0.9, false),
  ];

  // Visual constants
  static const double _barWidth = 40;
  static const double _barMaxHeight = 200;
  static const double _groupSpacing = 20;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section title
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text('History', style: AppStyles.vsTitleStyle),
        ),
        const SizedBox(height: 8),

        // Card container
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),

              // Chart + labels
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // 1) The BarChart itself
                  SizedBox(
                    height: _barMaxHeight,
                    width: MediaQuery.of(context).size.width * .75,
                    child: BarChart(
                      BarChartData(
                        minY: 0,
                        maxY: 1,
                        alignment:
                            BarChartAlignment.center, // <-- make bars tighter
                        groupsSpace: _groupSpacing, // which is 0
                        barGroups: List.generate(_bars.length, (i) {
                          final d = _bars[i];
                          return BarChartGroupData(
                            x: i,
                            barRods: [
                              BarChartRodData(
                                toY: d.value,
                                width: _barWidth,
                                color:
                                    d.highlight
                                        ? const Color(0xFF16DBCC)
                                        : const Color(0xFFF0F1F6),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ],
                          );
                        }),
                        // titlesData: FlTitlesData(show: false),
                        gridData: FlGridData(show: false),
                        borderData: FlBorderData(show: false),
                        titlesData: FlTitlesData(
                          rightTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          topTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          leftTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              reservedSize: 40,
                              getTitlesWidget: (value, meta) {
                                return SideTitleWidget(
                                  meta: meta,
                                  space: 12,
                                  child: Text(
                                    _bars[value.toInt()].year,
                                    style: AppStyles.dashISubtemTitle,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  // const SizedBox(height: 18),

                  // 2) Manual year labels underneath
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: _bars.map((d) {
                  //     return Text(
                  //       d.year,
                  //       style: AppStyles.dashISubtemTitle,
                  //     );
                  //   }).toList(),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _BarData {
  final String year;
  final double value; // 0.0–1.0 fraction
  final bool highlight;
  const _BarData(this.year, this.value, this.highlight);
}
