import 'dart:async';

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Column(
        children: <Widget>[
          Container(
            height: 500,
            child: Center(
              child: Stack(
                children: <Widget>[
                  Center(
                    child: AnimatedCircle(),
                  ),
                  Center(
                    child: AnimatedCircle(delay: 2500),
                  ),
                  Center(
                    // 裁剪圆形
                    child: ClipOval(
                      child: new Image.asset(
                        'assets/images/logo.png',
                        fit: BoxFit.cover,
                        width: 80,
                        height: 80,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: RaisedButton(
                          textColor: Colors.red,
                          color: Colors.white,
                          onPressed: () => print('手机登录'),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            child: Container(
                                width: 300,
                                child: Center(
                                  child: Text('手机登录'),
                                )),
                          )),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: RaisedButton(
                          textColor: Colors.white,
                          color: Colors.transparent,
                          // 阴影偏移量
                          elevation: 0,
                          onPressed: () => print('立即体验'),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: BorderSide(width: 1, color: Colors.white)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            child: Container(
                                width: 300,
                                child: Center(
                                  child: Text('立即体验'),
                                )),
                          )),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

// 封装动画组件
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
  final int animateDuration = 5000;
  final double startScale = 30.0;
  final double endScale = 450.0;

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(
        duration: Duration(milliseconds: animateDuration), vsync: this);
    animation = Tween(begin: startScale, end: endScale).animate(controller);
    if (widget.delay != 0) {
      Timer(Duration(milliseconds: widget.delay), () {
        controller.repeat();
      });
    } else {
      controller.repeat();
    }
    // controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    print(animation.value);
    return AnimatedBuilder(
      animation: animation,
      child: null,
      builder: (BuildContext context, child) {
        return Container(
            width: animation.value,
            height: animation.value,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 1, color: Colors.white)),
            child: child);
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
