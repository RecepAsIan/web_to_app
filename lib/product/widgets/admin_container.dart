import 'package:flutter/material.dart';
import 'package:web_to_app/product/utility/padding.dart';

class AdminContainer extends StatelessWidget {
  const AdminContainer({
    super.key,
    required this.color,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.widget,
  });
  final Color color;
  final String text1;
  final String text2;
  final String text3;
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      height: 150,
      width: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        text1,
                        style: const TextStyle(fontSize: 24, color: Colors.white),
                      ),
                      Padding(
                        padding: AppPadding.leftLowPadding,
                        child: Text(
                          text2,
                          style: const TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    text2,
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  )
                ],
              ),
            ),
          ),
          widget
        ],
      ),
    );
  }
}
