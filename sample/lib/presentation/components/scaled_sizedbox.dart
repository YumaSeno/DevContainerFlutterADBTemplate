import 'package:cariri/presentation/utils.dart';
import 'package:flutter/material.dart';

/// スケーリングされたSizedBoxウィジェット
///
/// widthおよびheightプロパティはテキストスケーリングに基づいて調整されます。
class ScaledSizedBox extends StatelessWidget {
  /// 幅
  final double width;

  /// 高さ
  final double height;

  /// 子ウィジェット
  final Widget? child;

  /// コンストラクタ
  const ScaledSizedBox({
    super.key,
    this.width = 0,
    this.height = 0,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width > 0 ? width.scaled(context) : null,
      height: height > 0 ? height.scaled(context) : null,
      child: child,
    );
  }
}
