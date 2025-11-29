import 'package:flutter/material.dart';

extension ResponsiveSize on BuildContext {
  // 画面幅（ウィンドウサイズ）に対する割合
  double w(double percent) => MediaQuery.of(this).size.width * (percent / 100);

  // 画面高さに対する割合
  double h(double percent) => MediaQuery.of(this).size.height * (percent / 100);
}
