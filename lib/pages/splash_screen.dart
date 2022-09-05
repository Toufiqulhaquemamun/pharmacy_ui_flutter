import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pharmacy/pages/widgets/dot_circle.dart';

import 'login_page.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isVisible = false;
  late int rowCount = 4;
  late int _dotCount;
  late int _dotIndex;
  var _dotColor = [];
  late Timer _timer;
  _SplashScreenState(){

    new Timer(const Duration(milliseconds: 2000), (){
      setState(() {
        Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => LoginPage()), (route) => false);
      });
    });

    Timer(
      Duration(milliseconds: 10),(){
        setState(() {
          _isVisible = true; // Now it is showing fade effect and navigating to Login page
        });
      }
    );

  }
  List<Widget> _generateRow() {
    List<Widget> data = [];
    for (var i = 0; i < rowCount; i++) {
      data.add(DotCircle(color: getDotColor(i)));
      data.add(SizedBox(width: 10));
    }
    return data;
  }

  int get dotCount => _dotCount;

  Color getDotColor(int i) => _dotColor[i];
  _initRequired() {
    _dotCount = 4;
    _dotIndex = 0;
    for (var i = 0; i < _dotCount; i++) {
      var c = (i == 0) ? Colors.white10 : Colors.red;
      _dotColor.add(c);
    }
  }
  _initTimer() {
    _timer = Timer.periodic(
      Duration(milliseconds: 250),
          (Timer t) => _updateDotColor(),
    );
  }
  _updateDotColor() {
    _dotIndex += 1;
    _dotIndex = _dotIndex < _dotCount ? _dotIndex : 0;
    for (var i = 0; i < _dotCount; i++) {
      _dotColor[i] = (i == _dotIndex) ? Colors.white10 : Colors.red;
    }
  }
  @override
  void initState() {
    _initRequired();
    _initTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: Column(
        children: [
           Expanded(
            flex: 5,
            child: Center(
              child: Padding(
                padding:  EdgeInsets.only(top: 120),
                child: Image.asset("assets/images/splash.jpg", width: 200),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: _generateRow(),
            ),
          ),
        ],
      ),
    );
  }
}