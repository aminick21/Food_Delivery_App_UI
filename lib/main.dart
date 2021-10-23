import 'package:flutter/material.dart';
import 'package:food_delivery_app/screens/home_screen.dart';

void main() {
  runApp(MaterialApp(
    home: HomeScreen(),
    theme:ThemeData(
      scaffoldBackgroundColor: Colors.grey[50],
      primaryColor: Colors.deepOrangeAccent,

    )
  ));
}

