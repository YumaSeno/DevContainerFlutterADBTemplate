import 'package:flutter/material.dart';
import 'package:decimal/decimal.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

/// BuildContext拡張
extension ResponsiveSize on BuildContext {
  /// 画面幅の指定パーセンテージに基づく幅を返す
  double w(double percent) => MediaQuery.of(this).size.width * (percent / 100);

  /// 画面高さの指定パーセンテージに基づく高さを返す
  double h(double percent) => MediaQuery.of(this).size.height * (percent / 100);
}

/// 通貨（円）を見やすい文字列に整形するユーティリティ
String formatYen(Decimal value) {
  // このサンプルでは小数を考慮せず、単純に整数として扱う
  final intValue = int.parse(value.toString());
  return '¥$intValue';
}

/// 数値拡張
extension TextScaleExtension on num {
  /// 数値を現在のテキスト倍率でスケーリングして返す
  /// Webの rem のような挙動を再現
  double scaled(BuildContext context) {
    return MediaQuery.textScalerOf(context).scale(toDouble());
  }
}

/// AsyncNotifier拡張
mixin $AsyncNotifierMixin<T> on $AsyncNotifier<T> {
  /// 現在の値が存在する場合に、その値を維持したままerrorやloading状態をクリアする
  void clearState() {
    if (state.hasValue) {
      state = AsyncValue.data(state.value as T);
    }
  }
}
