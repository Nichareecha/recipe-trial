// splash_screen.dart
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:secret_recipe/input_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final String backgroundImageUrl =
      'https://img.freepik.com/free-photo/ingredients-cooking-gray-concrete_127032-2082.jpg?size=626&ext=jpg&ga=GA1.1.1880011253.1699315200&semt=ais';

  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 10000),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => InputPage()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.network(
            backgroundImageUrl,
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    // Container (Frame) behind the text
                    Container(
                      width: 500, // Adjust the width as needed
                      height: 150, // Adjust the height as needed
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 87, 88, 88).withOpacity(0.6),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Unfolded',
                            style: TextStyle(
                              fontFamily: 'PlayfairDisplaySC',
                              fontSize: 60,
                              fontWeight: FontWeight.w700,
                              color: Color.fromARGB(255, 25, 61, 150),
                              shadows: [
                                Shadow(
                                  blurRadius: 5.0,
                                  color: Colors.white,
                                  offset: Offset(2.0, 2.0),
                                ),
                              ],
                            ),
                          ),
                          WidgetSpan(
                            child: Padding(
                              padding: EdgeInsets.only(top: 10.0, left: 2),
                              child: Transform.translate(
                                offset: Offset(0, 20.0),
                                child: Text(
                                  'Recipe',
                                  style: TextStyle(
                                    fontFamily: 'GFSDidot',
                                    fontSize: 40,
                                    fontWeight: FontWeight.w400,
                                    color: const Color.fromARGB(
                                        255, 137, 207, 240),
                                    shadows: [
                                      Shadow(
                                        blurRadius: 5.0,
                                        color: Color.fromARGB(255, 62, 61, 61),
                                        offset: Offset(0.5, 0.5),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  'Discover the Art of Cooking',
                  style: TextStyle(
                      fontSize: 22, color: Colors.black, fontFamily: 'Satisfy'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
