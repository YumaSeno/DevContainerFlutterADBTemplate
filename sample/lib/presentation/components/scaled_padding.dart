import 'package:cariri/presentation/utils.dart';
import 'package:flutter/material.dart';

/// スケーリングされたパディングウィジェット
///
/// 子ウィジェットに対して、テキストスケーリングに基づいたパディングを適用します。
class ScaledPadding extends StatelessWidget {
  /// 子ウィジェット
  final Widget child;

  /// パディング
  final EdgeInsetsGeometry padding;

  /// コンストラクタ
  const ScaledPadding({super.key, required this.child, required this.padding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        padding.resolve(TextDirection.ltr).left.scaled(context),
        padding.resolve(TextDirection.ltr).top.scaled(context),
        padding.resolve(TextDirection.ltr).right.scaled(context),
        padding.resolve(TextDirection.ltr).bottom.scaled(context),
      ),
      child: child,
    );
  }
}
