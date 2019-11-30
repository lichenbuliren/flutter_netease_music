import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconCircle extends StatelessWidget {
  final String path;

  const IconCircle({Key key, this.path}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 1, color: Colors.white24)),
        padding: EdgeInsets.all(4),
        child: SvgPicture.asset(
          this.path,
          color: Colors.white,
        ));
  }
}
