import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginRegisterPage extends StatefulWidget {
  LoginRegisterPage({Key key}) : super(key: key);

  @override
  _LoginRegisterPageState createState() => _LoginRegisterPageState();
}

class _LoginRegisterPageState extends State<LoginRegisterPage> {
  final num maxInputLength = 11;

  bool phoneNumberEnabled = false;

  TextEditingController phoneController = TextEditingController(text: '');

  void handleInputChange() {
    setState(() {
      phoneNumberEnabled = phoneController.value.text.length == maxInputLength;
    });
  }

  void handleClearPhone() {
    phoneController.text = '';
  }

  void handleNextStep() {
    Navigator.pushNamed(context, '/login_pwd', arguments: {
      'phone': phoneController.value.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '手机号登录',
          style: new TextStyle(color: Colors.black),
        ),
        // 去除顶部下边框投影
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
                    color: Colors.black12,
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
                    child: Stack(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: TextField(
                            onChanged: (v) {
                              handleInputChange();
                            },
                            controller: phoneController,
                            style: TextStyle(
                              fontSize: 20,
                            ),
                            maxLengthEnforced: true,
                            cursorColor: Color(0xFF777777).withOpacity(0.8),
                            // 电话号码键盘
                            keyboardType: TextInputType.phone,
                            // 只允许输入数字
                            inputFormatters: <TextInputFormatter>[
                              WhitelistingTextInputFormatter.digitsOnly,
                              // 最多允许 11 位的电话号码
                              LengthLimitingTextInputFormatter(maxInputLength),
                            ],
                            textInputAction: TextInputAction.next,
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
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          top: 0,
                          child: phoneNumberEnabled
                              ? Align(
                                  child: InkWell(
                                    child: Icon(
                                      Icons.close,
                                      size: 20,
                                    ),
                                    onTap: () {
                                      handleClearPhone();
                                    },
                                  ),
                                  alignment: Alignment.center,
                                )
                              : Container(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 600,
              decoration: BoxDecoration(
                color: Colors.purple,
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFFFB7B3).withOpacity(0.5),
                    Color(0xFFFFB7B3)
                  ],
                  stops: [0, 1],
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
                // 取消按压事件下的灰色投影
                highlightElevation: 0,
                onPressed: () {
                  handleNextStep();
                },
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide.none,
                ),
                child: Text(
                  '下一步',
                  style: TextStyle(
                    color:
                        phoneNumberEnabled ? Colors.white : Color(0xEEEEEEEE),
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
