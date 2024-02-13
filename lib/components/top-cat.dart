import 'package:flutter/material.dart';
import 'package:news_app/utils/colors.dart';

// import
class filters extends StatelessWidget {
  final String text;
  const filters({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: appcolor.lightwhite,
          borderRadius: BorderRadius.circular(5),
        ),
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.all(5),
        child: Text(
          text,
          style: TextStyle(color: appcolor.black),
        ),
      ),
    );
  }
}
