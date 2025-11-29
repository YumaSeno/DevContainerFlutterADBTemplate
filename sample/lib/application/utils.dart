import 'package:flutter/material.dart';

extension ResponsiveSize on BuildContext {
  // 画面幅（ウィンドウサイズ）に対する割合
  double w(double percent) => MediaQuery.of(this).size.width * (percent / 100);

  // 画面高さに対する割合
  double h(double percent) => MediaQuery.of(this).size.height * (percent / 100);
}

extension TextScaleExtension on num {
  /// 数値を現在のテキスト倍率でスケーリングして返す
  /// Webの rem のような挙動を再現
  double scaled(BuildContext context) {
    return MediaQuery.textScalerOf(context).scale(toDouble());
  }
}
