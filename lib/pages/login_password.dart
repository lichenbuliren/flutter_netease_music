import 'package:flutter/material.dart';
import 'package:flutter_netease_music/common/http.dart';

class LoginPassword extends StatefulWidget {
  @override
  _LoginPasswordState createState() => _LoginPasswordState();
}

class _LoginPasswordState extends State<LoginPassword> {
  final TextEditingController pwdController = TextEditingController(text: '');

  var phone = '';

  void handlePwdChange() async {}

  void handleLogin() async {
    var pwd = pwdController.value.text;
    print('phone $phone, pwd $pwd');
    try {
      Map<String, dynamic> data =
          await Http().get('/login/cellphone?phone=$phone&password=$pwd');
      var account = data['account'];
      print(account);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    dynamic params = ModalRoute.of(context).settings.arguments;
    setState(() {
      phone = params['phone'];
    });
    print('phone $phone');
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '手机号登录',
          style: new TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 0.5,
                    color: Colors.black12,
                  ),
                ),
              ),
              child: TextField(
                onChanged: (v) {
                  handlePwdChange();
                },
                controller: pwdController,
                style: TextStyle(
                  fontSize: 16,
                ),
                // 密码输入
                obscureText: true,
                cursorColor: Color(0xFF777777).withOpacity(0.8),
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  enabledBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  border: InputBorder.none,
                  focusColor: Colors.black54,
                  hintText: '输入密码',
                  hintStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.black12,
                  ),
                ),
              ),
            ),
            Container(
              width: 600,
              margin: EdgeInsets.only(top: 40),
              decoration: BoxDecoration(
                color: Colors.white,
                gradient: LinearGradient(
                  colors: [Color(0xFFFF594B), Color(0xFFFF1D13)],
                  stops: [0, 1],
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
              child: RaisedButton(
                textColor: Colors.white,
                color: Colors.transparent,
                highlightColor: Colors.transparent,
                highlightElevation: 0,
                elevation: 0,
                child: Text('立即登录'),
                onPressed: () {
                  handleLogin();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
