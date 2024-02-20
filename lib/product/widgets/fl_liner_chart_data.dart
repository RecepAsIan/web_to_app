import 'package:flutter/material.dart';
import 'package:web_to_app/product/utility/padding.dart';
import 'package:fl_chart/fl_chart.dart' as ap;

class FlLinerChartData extends StatelessWidget {
  const FlLinerChartData({
    super.key,
    required this.x1,
    required this.y1,
    required this.x2,
    required this.y2,
    required this.x3,
    required this.y3,
    required this.x4,
    required this.y4,
    required this.x5,
    required this.y5,
  });
  final double x1;
  final double x2;
  final double x3;
  final double x4;
  final double x5;
  final double y1;
  final double y2;
  final double y3;
  final double y4;
  final double y5;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      height: 200,
      width: 400,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '26k',
                    style: TextStyle(fontSize: 24),
                  ),
                  Padding(
                    padding: AppPadding.leftLowPadding,
                    child: Text(
                      '(-12.4% ↓)',
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 40, right: 10,bottom: 10),
            child: SizedBox(
              height: 60,
              width: 390,
              child: ap.LineChart(
                ap.LineChartData(
                  gridData: ap.FlGridData(show: false),
                  titlesData: ap.FlTitlesData(show: false),
                  borderData: ap.FlBorderData(show: false),
                  lineTouchData: ap.LineTouchData(
                    touchTooltipData: ap.LineTouchTooltipData(
                      getTooltipItems: (List<ap.LineBarSpot> touchedBarSpots) {
                        return touchedBarSpots.map((barSpot) {
                          final flSpot = barSpot;
                          return ap.LineTooltipItem(
                            'My Info : ${flSpot.y.toString()}',
                            const TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          );
                        }).toList();
                      },
                    ),
                  ),
                  lineBarsData: [
                    ap.LineChartBarData(
                      spots: [
                        ap.FlSpot(x1, y1),
                        ap.FlSpot(x2, y2),
                        ap.FlSpot(x3, y3),
                        ap.FlSpot(x4, y4),
                        ap.FlSpot(x5, y5),
                      ],
                      isCurved: true,
                      color: Colors.white,
                      barWidth: 1,
                      isStrokeCapRound: true,
                      dotData: ap.FlDotData(
                        show: true,
                        getDotPainter: (spot, percent, barData, index) =>
                            ap.FlDotCirclePainter(
                          radius: 3, // adjust size as needed
                          color: Colors.transparent, // makes the dot "hollow"
                          strokeColor: Colors.white, // color of the border
                          strokeWidth:
                              2, // thickness of the border color of the border
                        ),
                      ),
                      belowBarData: ap.BarAreaData(show: false),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
