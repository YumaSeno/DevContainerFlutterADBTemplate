import 'package:cariri/application/utils.dart';
import 'package:flutter/material.dart';

class ScaledSizedBox extends StatelessWidget {
  final double width;
  final double height;
  final Widget? child;

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
