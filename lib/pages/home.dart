import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(milliseconds: 5000),
        vsync: this,
        animationBehavior: AnimationBehavior.preserve);
    animation = Tween(begin: 80.0, end: 430.0).animate(controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reset();
          controller.forward();
        }
      });

    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose(); // 释放资源
    super.dispose();
  }

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
                    child: Container(
                      width: animation.value,
                      height: animation.value,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border:
                              Border.all(width: 1, color: Colors.redAccent)),
                      child: null,
                    ),
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
