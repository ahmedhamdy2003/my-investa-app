import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CustomLineChartData {
  final int year;
  final double value;

  CustomLineChartData({required this.year, required this.value});
}

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
                    return Text(value.toInt().toString(),
                        style: TextStyle(color: Colors.blueGrey, fontSize: 12));
                  },
                ),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  reservedSize: 56,
                  showTitles: true,
                  getTitlesWidget: (value, meta) {
                    if (value % 10000 == 0) {
                      return Text('\$${value ~/ 1000},000',
                          style:
                              TextStyle(color: Colors.blueGrey, fontSize: 12));
                    }
                    return Container();
                  },
                ),
              ),
              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              rightTitles:
                  AxisTitles(sideTitles: SideTitles(showTitles: false)),
            ),
            lineBarsData: [
              LineChartBarData(
                spots: data
                    .map((point) => FlSpot(point.year.toDouble(), point.value))
                    .toList(),
                isCurved: true,
                barWidth: 4,
                color: Colors.cyan,
                belowBarData: BarAreaData(show: false),
                dotData: FlDotData(show: false),
              ),
            ],
            gridData: FlGridData(show: true, drawVerticalLine: false),
            borderData: FlBorderData(show: false),
          ),
        ),
      ),
    );
  }
}
