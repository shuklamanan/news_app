import 'package:flutter/material.dart';
import 'package:news_app/utils/colors.dart';

class filters extends StatelessWidget {
  final String text;
  final void Function(String temp)? f;
  const filters({super.key, required this.text, required this.f});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        f!(text);
      },
      child: Container(
        decoration: BoxDecoration(
          color: appcolor.lightwhite,
          borderRadius: BorderRadius.circular(5),
        ),
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.all(5),
        child: Text(
          text,
          style: TextStyle(color: appcolor.black),
        ),
      ),
    );
  }
}
