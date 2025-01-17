import 'package:deegaamiye_2/Src/Screens/camera_screen.dart';
import 'package:deegaamiye_2/Src/Screens/faqs_screen.dart';
import 'package:deegaamiye_2/Src/Screens/home_screen.dart';
import 'package:deegaamiye_2/Src/Screens/socials_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  // Initialize Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // Run your app
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
