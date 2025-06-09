import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class _LegendItem extends StatelessWidget {
  final Color color;
  final String label;
  const _LegendItem({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Color(0xFF718EBF)),
        ),
      ],
    );
  }
}

/// Returns a widget that shows the legend at the top-left,
/// then your BarChart below it.
Widget barData({
  required List<double> investing, // “Investing”
  required List<double> saving, // “Saving”
  required List<String> labels,
  double minY = 0,
  double maxY = 500,
}) {
  assert(
    investing.length == saving.length && investing.length == labels.length,
    'seriesA, seriesB, and labels must match length',
  );

  final count = investing.length;
  final step = (maxY - minY) / 5;

  return Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      // ─── Legend row ──────────────────────────────────────────────────────────
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _LegendItem(color: Color(0xFF16DBCC), label: 'Saving'),
            SizedBox(width: 16),
            _LegendItem(color: Color(0xFF1814F3), label: 'Investing'),
          ],
        ),
      ),

      // ─── The actual chart ────────────────────────────────────────────────────
      Expanded(
        child: BarChart(
          BarChartData(
            minY: minY,
            maxY: maxY,
            alignment: BarChartAlignment.spaceAround,
            gridData: FlGridData(
              show: true,
              drawVerticalLine: false,
              horizontalInterval: step,
              getDrawingHorizontalLine:
                  (_) => const FlLine(color: Color(0xFFF3F3F5), strokeWidth: 1),
            ),
            borderData: FlBorderData(show: false),
            barGroups: List.generate(count, (i) {
              return BarChartGroupData(
                x: i,
                barRods: [
                  BarChartRodData(
                    toY: saving[i],
                    width: 16,
                    borderRadius: BorderRadius.circular(4),
                    color: const Color(0xFF16DBCC), // Saving
                  ),
                  BarChartRodData(
                    toY: investing[i],
                    width: 16,
                    borderRadius: BorderRadius.circular(4),
                    color: const Color(0xFF1814F3), // Investing
                  ),
                ],
              );
            }),
            titlesData: FlTitlesData(
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, meta) {
                    final idx = value.toInt();
                    if (idx < 0 || idx >= labels.length) {
                      return const SizedBox.shrink();
                    }
                    return SideTitleWidget(
                      meta: meta,
                      child: Text(
                        labels[idx],
                        style: const TextStyle(
                          color: Color(0xFF718EBF),
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
                  interval: step,
                  reservedSize: 40,
                  getTitlesWidget: (value, meta) {
                    if (value < minY || value > maxY || value % step != 0) {
                      return const SizedBox.shrink();
                    }
                    return SideTitleWidget(
                      meta: meta,
                      child: Text(
                        value.toInt().toString(),
                        style: const TextStyle(
                          color: Color(0xFF718EBF),
                          fontSize: 12,
                        ),
                      ),
                    );
                  },
                ),
              ),
              rightTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              topTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
