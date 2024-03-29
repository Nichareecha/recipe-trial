import 'package:flutter/material.dart';
import 'package:secret_recipe/Formating/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unfolded recipe',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: SplashScreen(),
    );
  }
}

class AppData {
  static List<String> history = [];
  static Map<int, int> dailyTotalCalories = {};
  static Map<String, int> dateAdded = {};
}
