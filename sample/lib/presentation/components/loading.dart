import 'package:cariri/presentation/utils.dart';
import 'package:flutter/material.dart';

/// 汎用ローディングウィジェット
///
/// 中央に円形プログレスと任意のメッセージを表示します。
class Loading extends StatelessWidget {
  /// インジケーターのサイズ
  ///
  /// フォントサイズでスケーリングされます。
  final double indicatorSize;

  /// 透明度
  final double opacity;

  /// コンストラクタ
  const Loading({super.key, this.indicatorSize = 48, this.opacity = 1});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.black.withValues(alpha: opacity),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: indicatorSize.scaled(context),
              height: indicatorSize.scaled(context),
              child: const CircularProgressIndicator(),
            ),
          ],
        ),
      ),
    );
  }
}
