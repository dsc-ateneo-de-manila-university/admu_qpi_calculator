import 'package:admu_qpi_calculator/screens/onboardingscreens.dart';
import 'package:flutter/material.dart';
import 'screens/main.dart';

void main() => runApp(MaterialApp(home: OnboardingScreen()));

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
