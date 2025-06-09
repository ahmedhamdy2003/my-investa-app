import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:investa4/core/utils/app_styles.dart';

class InvestmentLineChart extends StatelessWidget {
  final List<LineChartModel> data;
  final String data1Title;
  final String data2Title;
  const InvestmentLineChart({
    super.key,
    required this.data,
    required this.data1Title,
    required this.data2Title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.blue, width: 2),
                      ),
                    ),
                  ),
                  Text(data1Title, style: AppStyles.solidChartTitle),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.orange, width: 2),
                      ),
                    ),
                  ),
                  Text(data2Title, style: AppStyles.solidChartTitle),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(
              right: 18.0,
              left: 8.0,
              // vertical: 8.0,
            ),
            child: SizedBox(
              height: 240,
              child: LineChart(
                LineChartData(
                  titlesData: FlTitlesData(
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          int index = value.toInt();
                          if (index < 0 || index >= data.length) {
                            return const SizedBox.shrink();
                          }
                          return Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              data[index].month,
                              style: AppStyles.solidChartLabels,
                            ),
                          );
                        },
                        interval: 1,
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 56,
                        getTitlesWidget: (value, _) {
                          return Text(
                            '${value ~/ 1000 * 1000},L.E',
                            style: AppStyles.solidChartLabels,
                          );
                        },
                        interval: 10000,
                      ),
                    ),
                  ),
                  lineBarsData: [
                    // Investment Return Line
                    LineChartBarData(
                      spots:
                          data
                              .asMap()
                              .entries
                              .map(
                                (e) => FlSpot(e.key.toDouble(), e.value.data1),
                              )
                              .toList(),
                      isCurved: false,
                      barWidth: 2.5,
                      color: Colors.blue,
                      dotData: FlDotData(
                        show: true,
                        getDotPainter: (spot, percent, bar, index) {
                          return FlDotCirclePainter(
                            radius: 4,
                            color:
                                Colors
                                    .white, // fill color (white makes it hollow on light background)
                            strokeWidth: 2,
                            strokeColor: bar.color ?? Colors.black,
                          );
                        },
                      ),
                    ),
                    // Comparison Data Line
                    LineChartBarData(
                      spots:
                          data
                              .asMap()
                              .entries
                              .map(
                                (e) => FlSpot(e.key.toDouble(), e.value.data2),
                              )
                              .toList(),
                      isCurved: false,
                      barWidth: 2.5,
                      color: Colors.orange,
                      dotData: FlDotData(
                        show: true,
                        getDotPainter: (spot, percent, bar, index) {
                          return FlDotCirclePainter(
                            radius: 4,
                            color:
                                Colors
                                    .white, // fill color (white makes it hollow on light background)
                            strokeWidth: 2,
                            strokeColor: bar.color ?? Colors.black,
                          );
                        },
                      ),
                    ),
                  ],
                  gridData: const FlGridData(
                    show: true,
                    drawHorizontalLine: true,
                    drawVerticalLine: false,
                  ),
                  borderData: FlBorderData(show: false),
                  minY: 0,
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}

class LineChartModel {
  final String month;
  final double data1;
  final double data2;

  LineChartModel({
    required this.month,
    required this.data1,
    required this.data2,
  });
}
