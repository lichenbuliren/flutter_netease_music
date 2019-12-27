import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var counter = 3;
  final num duration = 3;
  Timer timer;

  void countDown() {
    timer = Timer(Duration(seconds: duration), () {
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
    // SystemChrome.setEnabledSystemUIOverlays([]);
    return Stack(children: <Widget>[
      Container(
        color: Colors.red,
        child: Image.asset('assets/images/splash.jpg', fit: BoxFit.fill),
      ),
      Positioned(
        top: 20.0,
        right: 10.0,
        child: FlatButton(
          child: Text(
            '跳过 $counter',
            style: TextStyle(color: Colors.white),
          ),
          color: Color.fromARGB(55, 0, 0, 0),
          onPressed: () {
            navigationToNextPage();
          },
        ),
      ),
    ]);
  }
}
