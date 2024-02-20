import 'package:flutter/material.dart';

class AppPadding {
  const AppPadding._();

  ///horizontal: 200
  static const pageNormalPadding = EdgeInsets.symmetric(horizontal: 300);

  ///horizontal: 600
  static const pageHighPadding = EdgeInsets.symmetric(horizontal: 600);

  ///left: 15
  static const leftLowPadding = EdgeInsets.only(left: 15);

  ///all: 15
  static const allLowPadding = EdgeInsets.all(15);

  ///right: 15
  static const rightLowPadding = EdgeInsets.only(right: 15);

  ///top: 15)
  static const topLowPadding = EdgeInsets.only(top: 15);

  ///horizontal: 400, vertical: 100
  static const allPagePadding =
      EdgeInsets.symmetric(horizontal: 400, vertical: 100);

  ///top: 15, left: 15, right: 15
  static const textFieldPadding = EdgeInsets.only(top: 15, left: 15, right: 15);
}
