import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginRegisterPage extends StatefulWidget {
  LoginRegisterPage({Key key}) : super(key: key);

  @override
  _LoginRegisterPageState createState() => _LoginRegisterPageState();
}

class _LoginRegisterPageState extends State<LoginRegisterPage> {
  bool hasInput = false;
  final inputController = TextEditingController();

  void handleInputChange() {
    print('input value ${inputController.text}');
    setState(() {
      hasInput = inputController.text.length != 0;
    });
    print('hasInput $hasInput');
  }

  void handlePress() {
    // TODO 校验文本
  }

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
        padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                '未注册手机号登录后将自动创建账号',
                textAlign: TextAlign.left,
                style: new TextStyle(
                  color: Color(0xFFAAAAAA),
                  fontSize: 16,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
              margin: EdgeInsets.only(bottom: 40),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 0.5,
                    color: Color(0xFFBBBBBBB),
                  ),
                ),
              ),
              child: Row(
                children: <Widget>[
                  Text(
                    '+86',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 26,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Stack(
                        children: <Widget>[
                          TextField(
                            onChanged: (v) {
                              handleInputChange();
                            },
                            controller: inputController,
                            style: TextStyle(
                              fontSize: 20,
                            ),
                            cursorColor: Color(0xFF777777).withOpacity(0.8),
                            keyboardType: TextInputType.phone,
                            textInputAction: TextInputAction.done,
                            decoration: InputDecoration(
                              enabledBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              border: InputBorder.none,
                              focusColor: Colors.black54,
                              hintText: '输入手机号',
                              hintStyle: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            top: 0,
                            child: Icon(
                              Icons.close,
                              color: Colors.grey,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 400,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.purple,
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(253, 184, 180, 0.6),
                    Color.fromRGBO(253, 184, 180, 1)
                  ],
                  stops: [0.2, 1],
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
              child: RaisedButton(
                textColor: Colors.white,
                color: Colors.transparent,
                // 阴影偏移量
                elevation: 0,
                onPressed: () => this.handlePress(),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide.none,
                ),
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                highlightElevation: 0,
                child: Text(
                  '下一步',
                  style: TextStyle(
                    color: Color.fromRGBO(254, 213, 210, 1),
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
