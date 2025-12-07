import 'package:flutter/material.dart';

/// 汎用ローディングウィジェット
///
/// 中央に円形プログレスと任意のメッセージを表示します。
class Loading extends StatelessWidget {
  /// ローディングメッセージ
  final String? message;

  /// インジケーターのサイズ
  final double? indicatorSize;

  /// コンストラクタ
  const Loading({super.key, this.message, this.indicatorSize});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyMedium;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: indicatorSize ?? 48,
            height: indicatorSize ?? 48,
            child: const CircularProgressIndicator(),
          ),
          if (message != null) ...[
            const SizedBox(height: 12),
            Text(message!, style: textStyle),
          ],
        ],
      ),
    );
  }
}
