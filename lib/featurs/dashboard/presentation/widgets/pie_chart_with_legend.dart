import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PieChartWithLegend extends StatelessWidget {
  const PieChartWithLegend({
    super.key,
    required this.data,
    required this.title,
  });
  final List<PieData> data;
  final String title; // Default title
  // Single source of truth for labels, values, and colors

  @override
  Widget build(BuildContext context) {
    final sections =
        data.map((d) {
          final color = d.color ?? Theme.of(context).colorScheme.secondary;
          return PieChartSectionData(
            value: d.value,
            color: color,
            radius: 50,
            showTitle: false, // no in-chart labels
            borderSide: const BorderSide(
              color: Colors.white,
              width: 0,
            ), // white border
          );
        }).toList();

    final legendItems =
        data.map((d) {
          final color = d.color ?? Theme.of(context).colorScheme.secondary;
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: color,
                  ),
                ),
                const SizedBox(width: 8),
                Text(d.label, style: const TextStyle(fontSize: 14)),
              ],
            ),
          );
        }).toList();

    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFF9F9FA),
        borderRadius: BorderRadius.circular(16),
      ),
      child: AspectRatio(
        aspectRatio: 1.3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 30),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: PieChart(
                      PieChartData(
                        sections: sections,
                        centerSpaceRadius: 40,
                        sectionsSpace: 4,
                        borderData: FlBorderData(show: false),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: legendItems,
                  ),
                  const SizedBox(width: 10),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

// Simple data holder
// class PieData {
//   final String label;
//   final double value;
//   final Color? color;
//   const PieData(this.label, this.value, this.color);

// }

class PieData {
  final String label;
  final double value;
  final Color? color;

  const PieData(this.label, this.value, this.color);

  static List<PieData> fromMap(Map<String, dynamic> dataMap) {
    final List<Color> colorPalette = _generateColorPalette(dataMap.length);
    int colorIndex = 0;

    return dataMap.entries.map((entry) {
      final cleanLabel = entry.key.trim();
      final color = colorPalette[colorIndex++ % colorPalette.length];
      return PieData(cleanLabel, entry.value, color);
    }).toList();
  }

  /// Generates a list of distinct colors
  static List<Color> _generateColorPalette(int count) {
    const baseColors = [
      Colors.blue,
      Colors.red,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.teal,
      Colors.yellow,
      Colors.brown,
      Colors.pink,
      Colors.indigo,
      Colors.cyan,
    ];

    if (count <= baseColors.length) return baseColors.take(count).toList();

    // Generate more colors dynamically if needed
    return List.generate(count, (i) {
      final hue = (i * 360.0 / count) % 360;
      return HSLColor.fromAHSL(1.0, hue, 0.6, 0.6).toColor();
    });
  }
}
