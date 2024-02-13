import 'package:flutter/material.dart';
import 'package:news_app/pages/Home.dart';
import 'package:news_app/provider/provider_string.dart';
import 'package:news_app/utils/colors.dart';
import 'package:provider/provider.dart';

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
    return ChangeNotifierProvider(
      create: (_) => changestring(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: appcolor.primary,
        ),
        home: Home(),
      ),
    );
  }
}
