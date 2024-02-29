import 'package:flutter/material.dart';

class AppPadding {
  const AppPadding._();

  ///horizontal: 300
  static const pageNormalPadding = EdgeInsets.symmetric(horizontal: 300);

  ///horizontal: 300
  static const pageLowLeftPadding = EdgeInsets.only(left: 200);

  ///horizontal: 600
  static const pageHighPadding = EdgeInsets.symmetric(horizontal: 600);

  ///left: 15
  static const leftLowPadding = EdgeInsets.only(left: 15);

  ///left: 30
  static const leftNormalPadding = EdgeInsets.only(left: 30);

  ///top: 150
  static const topPageNormalPadding = EdgeInsets.only(top: 150);

  ///all: 15
  static const allLowPadding = EdgeInsets.all(15);

  ///right: 15
  static const rightLowPadding = EdgeInsets.only(right: 15);

  ///top: 15
  static const topLowPadding = EdgeInsets.only(top: 15);

  ///top: 
  static const priceTopLowPadding = EdgeInsets.only(top: 20);

  ///top: 40
  static const topNormalPadding = EdgeInsets.only(top: 40);

  ///EdgeInsets.only(top: 80)
  static const topHighPadding = EdgeInsets.only(top: 80);

  ///horizontal: 400, vertical: 100
  static const allPagePadding =
      EdgeInsets.symmetric(horizontal: 400, vertical: 100);

  ///top: 15, left: 15, right: 15
  static const textFieldPadding = EdgeInsets.only(top: 15, left: 15, right: 15);

  ///horizontal:15
  static const textFieldHorizontalPadding =
      EdgeInsets.symmetric(horizontal: 15);

  ///bottom: 15
  static const botLowPadding = EdgeInsets.only(bottom: 15);
}
