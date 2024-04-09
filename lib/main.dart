import 'package:deegaamiye_2/Src/Screens/faqs_screen.dart';
import 'package:deegaamiye_2/Src/Screens/home_screen.dart';
import 'package:deegaamiye_2/Src/Screens/socials_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FaqsScreen(),
    );
  }
}
