import 'package:flutter/material.dart';
import 'package:mobtech/pages/apple.dart';
import 'package:mobtech/pages/categories.dart';
import 'package:mobtech/pages/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: " Mobtech",
      theme: ThemeData(fontFamily: 'Cairo'),
      home: Home(),
      routes: {
        'r_home': (context) {
          return Home();
        },
        'r_categories': (context) {
          return categories();
        },
        'r_apple': (context) {
          return Apple();
        },
      },
    );
  }
}
