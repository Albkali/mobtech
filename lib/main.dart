import 'package:flutter/material.dart';
import 'package:mobtech/pages/samsung.dart';
import 'package:mobtech/pages/categories.dart';
import 'package:mobtech/pages/home.dart';
import 'package:mobtech/pages/mobiledetails.dart';
import 'package:mobtech/test.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: " Mobtech",
      // theme: ThemeData(fontFamily: 'Cairo'),
      home: Home(),
      routes: {
        'r_home': (context) {
          return Home();
        },
        'r_categories': (context) {
          return categories();
        },
        'r_apple': (context) {
          return Samsung();
        },
        'r_mobile_details': (context) {
          return MobileDetails();
        },
      },
    );
  }
}
