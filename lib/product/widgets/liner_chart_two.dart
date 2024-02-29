import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:web_to_app/product/constants/color_constants.dart';

class LineChartSample extends StatelessWidget {
  const LineChartSample({super.key});
  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        maxY: 200,
        minY: 0,
        titlesData: const FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles:
                SideTitles(showTitles: true, interval: 50, reservedSize: 50),
          ),
          rightTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
        ),
        gridData: FlGridData(
          show: false,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              color: const Color(0xff37434d),
              strokeWidth: 1,
            );
          },
          drawVerticalLine: true,
          getDrawingVerticalLine: (value) {
            return FlLine(
              color: const Color(0xff37434d),
              strokeWidth: 1,
            );
          },
        ),
        borderData: FlBorderData(
          show: true,
          border: Border.all(color: MyColor.adminLinerBorder),
        ),
        lineBarsData: [
          LineChartBarData(
            spots: [
              FlSpot(0, 100),
              FlSpot(1, 175),
              FlSpot(2, 150),
              FlSpot(3, 80),
              FlSpot(4, 90),
              FlSpot(5, 130),
              FlSpot(6, 150),
            ],
            isCurved: true,
            color: Colors.green,
            barWidth: 2,
            isStrokeCapRound: true,
            dotData: FlDotData(
              show: false,
            ),
          ),
          LineChartBarData(
            spots: [
              FlSpot(0, 80),
              FlSpot(1, 150),
              FlSpot(2, 120),
              FlSpot(3, 60),
              FlSpot(4, 70),
              FlSpot(5, 110),
              FlSpot(6, 130),
            ],
            isCurved: true,
            color: Colors.blue,
            barWidth: 2,
            isStrokeCapRound: true,
            dotData: FlDotData(
              show: false,
            ),
            belowBarData: BarAreaData(
              show: true,
              color: MyColor.adminContainer5BlueBack,
            ),
          ),
        ],
      ),
    );
  }
}
