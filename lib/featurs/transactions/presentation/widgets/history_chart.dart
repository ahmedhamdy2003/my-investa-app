import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:investa4/core/utils/app_styles.dart';

class HistoryChart extends StatelessWidget {
  final List<BarData> bars;
  const HistoryChart({super.key, required this.bars});

  // Your data model


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
                        barGroups: List.generate(bars.length, (i) {
                          final d = bars[i];
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
                        gridData: const FlGridData(show: false),
                        borderData: FlBorderData(show: false),
                        titlesData: FlTitlesData(
                          rightTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          topTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          leftTitles: const AxisTitles(
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
                                    bars[value.toInt()].year,
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

class BarData {
  final String year;
  final double value; // 0.0–1.0 fraction
  final bool highlight;
  const BarData(this.year, this.value, this.highlight);
}
