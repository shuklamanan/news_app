import 'package:flutter/material.dart';
import 'package:news_app/utils/colors.dart';
import 'package:news_app/utils/text.dart';

class DividerWidget extends StatelessWidget {
  DividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Divider(color: appcolor.lightwhite),
    );
  }
}

class bottomsheetimage extends StatelessWidget {
  final String imageurl, title;
  const bottomsheetimage(
      {super.key, required this.imageurl, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Stack(
        children: [
          Container(
            foregroundDecoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.black, Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter),
            ),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                image: DecorationImage(
                    image: NetworkImage(imageurl), fit: BoxFit.cover)),
          ),
          Positioned(
            bottom: 10,
            child: Container(
              padding: EdgeInsets.all(10),
              width: 300,
              child: boldtext(text: title, color: Colors.white, size: 18),
            ),
          )
        ],
      ),
    );
  }
}
