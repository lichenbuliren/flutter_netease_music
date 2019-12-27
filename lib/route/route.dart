import 'package:flutter/material.dart';
import 'package:flutter_netease_music/pages/home/index.dart';
import 'package:flutter_netease_music/pages/login_password.dart';
import 'package:flutter_netease_music/pages/login_register.dart';
import 'package:flutter_netease_music/pages/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  '/home': (context) => HomePage(),
  '/login': (context) => LoginRegisterPage(),
  '/login_pwd': (context) => LoginPassword(),
  '/': (context) => SplashScreen(),
};
