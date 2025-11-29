import 'package:cariri/application/utils.dart';
import 'package:flutter/material.dart';

class ScaledPadding extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;

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
