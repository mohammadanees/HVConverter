import 'dart:io';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:measurements_App1/pages/home.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    new Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => Home()
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Image(
                height: 100.0,
                width: 100.0,
                image: AssetImage('assets/loading.gif')
                ),
              // child: Icon(
              //   Icons.all_inclusive,
              //   color: Colors.white,
              //   size: 90.0,
              // )
            ),
            Center(
              child: Text(
              'Loading...',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 14.0,
              )
            ),
            )
          ],
        )
      )
    );
  }
}