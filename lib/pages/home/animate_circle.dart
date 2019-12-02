// 封装动画组件
import 'dart:async';

import 'package:flutter/material.dart';

class AnimatedCircle extends StatefulWidget {
  final int delay;

  AnimatedCircle({Key key, this.delay = 0}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AnimatedCircle();
}

class _AnimatedCircle extends State<AnimatedCircle>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;
  final int animateDuration = 6000;
  final double startScale = 0.0;
  final double endScale = 1.2;

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(
      duration: Duration(milliseconds: animateDuration),
      vsync: this,
    );
    animation = Tween(
      begin: startScale,
      end: endScale,
    ).animate(controller);
    if (widget.delay != 0) {
      Timer(
        Duration(
          milliseconds: widget.delay,
        ),
        () {
          controller.repeat();
        },
      );
    } else {
      controller.repeat();
    }
    // controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      child: null,
      builder: (BuildContext ctx, Widget child) {
        final Matrix4 transform = Matrix4.identity()
          ..scale(
            animation.value,
            animation.value,
            1.0,
          );
        return Transform(
          transform: transform,
          alignment: Alignment.center,
          child: Container(
            width: 400,
            height: 400,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                width: 1,
                color: Colors.redAccent,
              ).scale(1.0),
            ),
            child: child,
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
