import 'package:flutter/material.dart';

class MainContainer extends StatelessWidget {
  final Widget child;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  const MainContainer({
    Key? key,
    required this.child,
    this.padding,
    this.margin,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      padding: padding == null
          ? EdgeInsets.symmetric(horizontal: 36, vertical: 24)
          : padding,
      margin: margin,
      child: child,
    );
  }
}
