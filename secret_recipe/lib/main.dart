import 'package:flutter/material.dart';
import 'package:secret_recipe/input_page.dart';
import 'package:secret_recipe/screen/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unfolded recipe',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: InputPage(),
    );
  }
}
