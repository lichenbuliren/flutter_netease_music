import 'package:flutter/material.dart';
import 'package:flutter_netease_music/pages/home/animate_circle.dart';
import 'package:flutter_netease_music/pages/home/icon_circle.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
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
                    child: AnimatedCircle(delay: 2000),
                  ),
                  Center(
                    // 裁剪圆形
                    child: ClipOval(
                      child: Image.asset(
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
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      IconCircle(path: 'assets/images/weixin.svg'),
                      IconCircle(path: 'assets/images/qq.svg'),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
