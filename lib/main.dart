import 'package:flutter/material.dart';
import 'package:friendly_vegetarian/menu.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Friendly Vegetarian',
      home: Scaffold(
        backgroundColor: Color(0xFFF5F5F5),
        body: MainMenu(),
      ),
    );
  }
}
