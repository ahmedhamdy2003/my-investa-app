import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CustomLineChartData {
  final int label; // e.g., "Jan", "Feb", etc.
  final double value;

  CustomLineChartData({required this.label, required this.value});

  // /// Creates a list from API response map (with month names as keys)
  // static List<CustomLineChartData> fromApiMap(Map<dynamic, dynamic> data) {
  //   const monthOrder = [
  //     'Jan',
  //     'Feb',
  //     'Mar',
  //     'Apr',
  //     'May',
  //     'Jun',
  //     'Jul',
  //     'Aug',
  //     'Sep',
  //     'Oct',
  //     'Nov',
  //     'Dec',
  //   ];

  //   List<CustomLineChartData> chartData = [];

  //   data.forEach((label, value) {
  //     if (monthOrder.contains(label) && value is num) {
  //       chartData.add(CustomLineChartData(
  //         label: label,
  //         value: value.toDouble(),
  //       ));
  //     }
  //   });

  //   // Sort by predefined month order
  //   chartData.sort((a, b) =>
  //       monthOrder.indexOf(a.label).compareTo(monthOrder.indexOf(b.label)));

  //   return chartData;
  // }

  /// Optional: Convert to JSON-style map
  Map<String, dynamic> toJson() {
    return {
      'label': label,
      'value': value,
    };
  }
}

// class CustomLineChart extends StatelessWidget {
//   final List<CustomLineChartData> data;

//   const CustomLineChart({super.key, required this.data});

//   static const List<String> _monthOrder = [
//     'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
//     'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
//   ];

//   @override
//   Widget build(BuildContext context) {
//     // Map label to index for x-axis (e.g., Jan=0, Feb=1...)
//     final spotData = data.map((point) {
//       final x = _monthOrder.indexOf(point.label).toDouble();
//       return FlSpot(x, point.value);
//     }).toList();

//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//         color: Colors.white,
//       ),
//       padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
//       child: SizedBox(
//         height: 240,
//         child: LineChart(
//           LineChartData(
//             minY: 0,
//             maxY: 40000,
//             titlesData: FlTitlesData(
//               bottomTitles: AxisTitles(
//                 sideTitles: SideTitles(
//                   interval: 1,
//                   showTitles: true,
//                   getTitlesWidget: (value, meta) {
//                     final index = value.toInt();
//                     if (index >= 0 && index < _monthOrder.length) {
//                       return Text(
//                         _monthOrder[index],
//                         style: const TextStyle(
//                           color: Colors.blueGrey,
//                           fontSize: 12,
//                         ),
//                       );
//                     }
//                     return const SizedBox.shrink();
//                   },
//                 ),
//               ),
//               leftTitles: AxisTitles(
//                 sideTitles: SideTitles(
//                   reservedSize: 56,
//                   showTitles: true,
//                   getTitlesWidget: (value, meta) {
//                     if (value % 10000 == 0) {
//                       return Text(
//                         '\$${value ~/ 1000},000',
//                         style: const TextStyle(
//                           color: Colors.blueGrey,
//                           fontSize: 12,
//                         ),
//                       );
//                     }
//                     return const SizedBox.shrink();
//                   },
//                 ),
//               ),
//               topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
//               rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
//             ),
//             lineBarsData: [
//               LineChartBarData(
//                 spots: spotData,
//                 isCurved: true,
//                 barWidth: 4,
//                 color: Colors.cyan,
//                 belowBarData: BarAreaData(show: false),
//                 dotData: const FlDotData(show: false),
//               ),
//             ],
//             gridData: const FlGridData(show: true, drawVerticalLine: false),
//             borderData: FlBorderData(show: false),
//           ),
//         ),
//       ),
//     );
//   }
// }


class CustomLineChart extends StatelessWidget {
  final List<CustomLineChartData> data;

  const CustomLineChart({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: SizedBox(
        height: 240,
        child: LineChart(
          LineChartData(
            // minX: data.first.year.toDouble(),
            // maxX: data.last.year.toDouble(),
            minY: 0,
            maxY: 40000,
            titlesData: FlTitlesData(
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  interval: 1,
                  showTitles: true,
                  // reservedSize: 56,
                  getTitlesWidget: (value, meta) {
                    return Text(
                      value.toInt().toString(),
                      style: const TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 12,
                      ),
                    );
                  },
                ),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  reservedSize: 56,
                  showTitles: true,
                  getTitlesWidget: (value, meta) {
                    if (value % 10000 == 0) {
                      return Text(
                        '\$${value ~/ 1000},000',
                        style: const TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 12,
                        ),
                      );
                    }
                    return Container();
                  },
                ),
              ),
              topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
              rightTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
            ),
            lineBarsData: [
              LineChartBarData(
                spots:
                    data
                        .map(
                          (point) => FlSpot(point.label.toDouble(), point.value),
                        )
                        .toList(),
                isCurved: true,
                barWidth: 4,
                color: Colors.cyan,
                belowBarData: BarAreaData(show: false),
                dotData: const FlDotData(show: false),
              ),
            ],
            gridData: const FlGridData(show: true, drawVerticalLine: false),
            borderData: FlBorderData(show: false),
          ),
        ),
      ),
    );
  }
}
