import 'package:flutter/material.dart';

class LoginRegisterPage extends StatefulWidget {
  LoginRegisterPage({Key key}) : super(key: key);

  @override
  _LoginRegisterPageState createState() => _LoginRegisterPageState();
}

class _LoginRegisterPageState extends State<LoginRegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '手机号登录',
          style: new TextStyle(color: Colors.black),
        ),
        elevation: 0.0,
        backgroundColor: Colors.white,
        iconTheme: new IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
        child: Column(
          children: <Widget>[
            Text(
              '未注册手机号登录后将自动创建账号',
              style: new TextStyle(
                color: Color(0xFF999999),
              ),
            ),
            Text(
              'asf',
              style: new TextStyle(
                color: Color(0xFF999999),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
