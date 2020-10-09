import 'package:admu_qpi_calculator/screens/onboarding-2.dart';
import 'package:flutter/material.dart';
import 'mainscreen.dart';

void main() => runApp(MaterialApp(home: Onboarding2()));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'AdMU Student App',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MainScreen(title: 'AdMU Student App'),
    );
  }
}
