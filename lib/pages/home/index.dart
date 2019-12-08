import 'package:flutter/material.dart';
import 'package:flutter_netease_music/pages/home/animate_circle.dart';
import 'package:flutter_netease_music/pages/home/icon_circle.dart';
import 'package:flutter_netease_music/pages/home/radio_select.dart';
import 'package:oktoast/oktoast.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  bool _agreement = false;

  void handlePhoneLogin() {
    if (!_agreement) {
      return showWarning();
    }

    Navigator.pushNamed(context, '/login');
  }

  void showWarning() {
    showToast(
      "请先勾选《服务条款》《隐私政策》《儿童隐私政策》",
      textPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      backgroundColor: Colors.black87,
      radius: 6,
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = TextStyle(color: Colors.white60, fontSize: 12);
    final TextStyle textStyle2 = textStyle.merge(
      TextStyle(color: Colors.white),
    );
    return OKToast(
      textAlign: TextAlign.left,
      child: Scaffold(
        body: Container(
          color: Colors.red,
          child: Column(
            children: <Widget>[
              Container(
                height: 600,
                child: Center(
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: <Widget>[
                      AnimatedCircle(),
                      AnimatedCircle(delay: 2000),
                      ClipOval(
                        child: Image.asset(
                          'assets/images/logo.png',
                          fit: BoxFit.cover,
                          width: 80,
                          height: 80,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
                            child: RaisedButton(
                              textColor: Colors.red,
                              color: Colors.white,
                              onPressed: () {
                                handlePhoneLogin();
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text('手机号登录'),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
                            child: RaisedButton(
                              textColor: Colors.white,
                              color: Colors.transparent,
                              // 阴影偏移量
                              elevation: 0,
                              onPressed: () => print('立即体验'),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side: BorderSide(width: 1, color: Colors.white),
                              ),
                              child: Text('立即体验'),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          IconCircle(path: 'assets/images/weixin.svg'),
                          IconCircle(path: 'assets/images/qq.svg'),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(right: 4),
                          child: RadioSelect(
                            onChanged: (val) {
                              setState(() {
                                _agreement = !_agreement;
                              });
                            },
                            value: _agreement,
                          ),
                        ),
                        Text('同意', style: textStyle),
                        Text('《服务条款》', style: textStyle2),
                        Text('《隐私政策》', style: textStyle2),
                        Text('《儿童隐私政策》', style: textStyle2),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
