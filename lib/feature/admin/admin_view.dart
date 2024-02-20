import 'package:flutter/material.dart';
import 'package:web_to_app/product/utility/padding.dart';
import 'package:web_to_app/product/widgets/fl_bard_chart_data.dart';
import 'package:web_to_app/product/widgets/fl_liner_chart_data.dart';
import 'package:fl_chart/fl_chart.dart';

class AdminView extends StatefulWidget {
  const AdminView({super.key});
  @override
  State<AdminView> createState() => _AdminViewState();
}

class _AdminViewState extends State<AdminView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        title: const Text('Admin'),
        backgroundColor: Colors.grey[400],
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: AppPadding.pageNormalPadding,
          child: Column(
            children: [
              Row(
                children: [
                  FlLinerChartData(
                    x1: 0,
                    x2: 1,
                    x3: 2,
                    x4: 3,
                    x5: 4,
                    y1: 40,
                    y2: 20,
                    y3: 50,
                    y4: 20,
                    y5: 60,
                  ),
                  Padding(
                    padding: AppPadding.leftLowPadding,
                    child: FlBardChartData(
                      y1: 50,
                      y2: 52,
                      y3: 51,
                      y4: 20,
                      y5: 25,
                      y6: 10,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
