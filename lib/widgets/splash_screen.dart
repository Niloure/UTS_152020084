import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../screens/home_screen.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/aji.jpg', width: 100, height: 100),
            SizedBox(height: 20),
            Text('Mochammad Fajri Somantri', style: TextStyle(fontSize: 20)),
            Text('NRP: 15-2020-084', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}