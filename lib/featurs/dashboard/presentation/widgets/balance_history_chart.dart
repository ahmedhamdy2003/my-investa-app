import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BalanceHistoryChart extends StatelessWidget {
  const BalanceHistoryChart({super.key, required this.spotsData});
  final List<FlSpot> spotsData;
  // Sample data points for Jul→Jan

  // X-axis labels
  static const _months = ['Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec', 'Jan'];

  @override
  Widget build(BuildContext context) {
    const lineColor = Color(0xFF3B4DF5);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 8),
          child: Text(
            'Balance History',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),
        AspectRatio(
          aspectRatio: 1.7,
          child: LineChart(
            LineChartData(
              minX: 0,
              maxX: 6,
              minY: 0,
              maxY: 800,
              gridData: FlGridData(
                show: true,
                drawVerticalLine: false,
                horizontalInterval: 200,
                getDrawingHorizontalLine:
                    (y) => FlLine(
                      color: Colors.grey.withAlpha(50),
                      strokeWidth: 1,
                      dashArray: [5, 5],
                    ),
              ),
              titlesData: FlTitlesData(
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    interval: 1,
                    getTitlesWidget: (x, meta) {
                      final idx = x.toInt();
                      if (idx < 0 || idx > 6) return const SizedBox.shrink();
                      return SideTitleWidget(
                        meta: meta,
                        child: Text(
                          _months[idx],
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 12,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    interval: 200,
                    reservedSize: 40,
                    getTitlesWidget: (y, meta) {
                      return SideTitleWidget(
                        meta: meta,
                        child: Text(
                          y.toInt().toString(),
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 12,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                topTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                rightTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
              ),
              borderData: FlBorderData(show: false),
              lineBarsData: [
                LineChartBarData(
                  spots: spotsData,
                  isCurved: true,
                  color: lineColor,
                  barWidth: 4,
                  dotData: const FlDotData(show: false),
                  belowBarData: BarAreaData(
                    show: true,
                    gradient: LinearGradient(
                      colors: [
                        lineColor.withValues(alpha: .4),
                        lineColor.withValues(alpha: 0),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
