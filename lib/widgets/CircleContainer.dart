import 'package:flutter/material.dart';

class BorderCircleContainer extends StatelessWidget {
  final Widget child;
  final double width;
  final double height;
  final Border border;
  final EdgeInsetsGeometry padding;

  const BorderCircleContainer(
      {Key key, this.child, this.border, this.width, this.height, this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.width,
      height: this.height,
      padding: this.padding,
      decoration: BoxDecoration(shape: BoxShape.circle, border: this.border),
      child: this.child,
    );
  }
}
