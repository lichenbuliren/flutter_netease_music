import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var counter = 5;
  Timer timer;

  void countDown() {
    timer = new Timer(new Duration(seconds: 1), () {
      if (counter != 1) {
        setState(() {
          counter = counter - 1;
          countDown();
        });
      } else {
        timer.cancel();
        navigationToNextPage();
      }
    });
  }

  void navigationToNextPage() {
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  void initState() {
    super.initState();
    countDown();
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    // It will hide status bar and notch.
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Container(
      color: Colors.red,
      child: new Image.asset('assets/images/splash.jpg', fit: BoxFit.fill)
    );
  }
}