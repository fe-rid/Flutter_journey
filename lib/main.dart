import 'package:flutter/material.dart';
import 'package:flutter_app/base/bottom_nav_bar.dart';

void main() {

  runApp(const MyApp());
}

class TestClass{
  int x;
  int y;

  TestClass({required this.x, required this.y});
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    home: BottomNavBar()
      );
  }
}


