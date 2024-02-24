import 'package:flutter/material.dart';
import 'package:web_to_app/product/constants/color_constants.dart';
import 'package:web_to_app/product/utility/padding.dart';
import 'package:web_to_app/product/widgets/admin_container.dart';
import 'package:web_to_app/product/widgets/deneme.dart';
import 'package:web_to_app/product/widgets/fl_bard_chart_data.dart';
import 'package:web_to_app/product/widgets/fl_liner_chart_data.dart';

class AdminView extends StatefulWidget {
  const AdminView({super.key});
  @override
  State<AdminView> createState() => _AdminViewState();
}

class _AdminViewState extends State<AdminView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.adminBackground,
      appBar: AppBar(
        title: const Text('Admin'),
        backgroundColor: MyColor.adminBackground,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: AppPadding.pageLowLeftPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  AdminContainer(
                    text1: '26K',
                    text2: '(-12.4% ↓)',
                    text3: 'Users',
                    color: MyColor.adminContainer1,
                    widget: FlLinerChartData(
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
                  ),
                  Padding(
                    padding: AppPadding.leftLowPadding,
                    child: AdminContainer(
                      color: MyColor.adminContainer2,
                      text1: 'text1',
                      text2: 'text2',
                      text3: 'text3',
                      widget: FlLinerChartData(
                          x1: 0,
                          y1: 50,
                          x2: 1,
                          y2: 100,
                          x3: 2,
                          y3: 80,
                          x4: 3,
                          y4: 150,
                          x5: 4,
                          y5: 70),
                    ),
                  ),
                  Padding(
                    padding: AppPadding.leftLowPadding,
                    child: AdminContainer(
                      color: MyColor.adminContainer3,
                      text1: '\$6.200',
                      text2: '(40.9% ↑)',
                      text3: 'Income',
                      widget: Padding(
                        padding: AppPadding.leftLowPadding,
                        child: FlBardChartData(
                          y1: 50,
                          y2: 52,
                          y3: 51,
                          y4: 20,
                          y5: 25,
                          y6: 10,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: AppPadding.leftLowPadding,
                    child: AdminContainer(
                      color: MyColor.adminContainer4,
                      text1: '44K',
                      text2: '(-23.6% ↓)',
                      text3: 'Sessions',
                      widget: FlLinerChartData(
                        x1: 0,
                        x2: 1,
                        x3: 2,
                        x4: 3,
                        x5: 4,
                        y1: 80,
                        y2: 100,
                        y3: 200,
                        y4: 70,
                        y5: 90,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: AppPadding.topLowPadding,
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    color: MyColor.adminContainer5,
                  ),
                  width: 1250,
                  height: 400,
                  child: Padding(
                    padding:
                        AppPadding.topLowPadding + AppPadding.leftLowPadding,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Traffic',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        const Padding(
                          padding: AppPadding.rightLowPadding,
                          child: Row(
                            children: [
                              Text('January'),
                              Text('-July 2023'),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: AppPadding.allLowPadding -
                                AppPadding.leftLowPadding,
                            child: const SizedBox(
                              child: LineChartSample(),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
