import 'package:flutter/material.dart';
import 'package:quize_app_advance/start_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 46, 3, 121),
              Color.fromARGB(186, 111, 9, 129),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: const StartScreen(),
      ),
    ),
  ));
}
