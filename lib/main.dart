import 'package:flutter/material.dart';
import 'package:news_app/pages/Home.dart';
import 'package:news_app/utils/colors.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: appcolor.primary,
      ),
      home: Home(),
    );
  }
}
