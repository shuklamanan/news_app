import 'package:flutter/material.dart';
import 'package:news_app/utils/colors.dart';
import 'package:news_app/utils/text.dart';

class appBar extends StatelessWidget implements PreferredSizeWidget {
  final String newstype;
  const appBar({super.key, required this.newstype})
      : preferredSize = const Size.fromHeight(50);
  // super(Key: key);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [],
      backgroundColor: appcolor.black,
      elevation: 0,
      title: Container(
        height: 40,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          boldtext(text: newstype, color: appcolor.primary, size: 20),
          Texting(text: 'News', color: appcolor.lightwhite, size: 20),
        ]),
      ),
      centerTitle: true,
    );
  }
}
