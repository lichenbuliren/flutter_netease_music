import 'package:flutter/material.dart';
import 'package:flutter_netease_music/pages/home.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  '/home': (context) => MyHomePage(title: '网易云音乐'),
};