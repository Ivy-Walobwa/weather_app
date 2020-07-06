import 'package:flutter/material.dart';
import 'screens/location_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E13),
        scaffoldBackgroundColor: Color(0xFF0A0E13)
      ),
      home: LocationScreen(),
    );
  }
}

