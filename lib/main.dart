import 'package:flutter/material.dart';
import 'package:clock_app/screen/home/home_screen.dart';

void main() {
  runApp(
      MaterialApp(
          debugShowCheckedModeBanner: false,
         routes:
        {
        "/":(context) => HomeScreen(),
        },
      )
  );
}