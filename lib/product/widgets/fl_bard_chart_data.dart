import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class FlBardChartData extends StatelessWidget {
  const FlBardChartData({
    super.key,
    required this.y1,
    required this.y2,
    required this.y3,
    required this.y4,
    required this.y5,
    required this.y6,
  });
  final double y1;
  final double y2;
  final double y3;
  final double y4;
  final double y5;
  final double y6;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: SizedBox(
        height: 60,
        width: 290,
        child: BarChart(
          BarChartData(
            borderData: FlBorderData(show: false),
            titlesData: const FlTitlesData(show: false),
            gridData: const FlGridData(show: false),
            barGroups: [
              BarChartGroupData(x: 0, barRods: [
                BarChartRodData(toY: y1, color: Colors.white.withOpacity(0.5))
              ]),
              BarChartGroupData(x: 1, barRods: [
                BarChartRodData(toY: y2, color: Colors.white.withOpacity(0.5))
              ]),
              BarChartGroupData(x: 2, barRods: [
                BarChartRodData(toY: y3, color: Colors.white.withOpacity(0.5))
              ]),
              BarChartGroupData(x: 3, barRods: [
                BarChartRodData(toY: y4, color: Colors.white.withOpacity(0.5))
              ]),
              BarChartGroupData(x: 4, barRods: [
                BarChartRodData(toY: y5, color: Colors.white.withOpacity(0.5))
              ]),
              BarChartGroupData(
                x: 5,
                barRods: [
                  BarChartRodData(toY: y6, color: Colors.white.withOpacity(0.5))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
