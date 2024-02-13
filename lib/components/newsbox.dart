import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/components/bottomsheet.dart';
import 'package:news_app/components/componentes1.dart';
import 'package:news_app/utils/colors.dart';
import 'package:news_app/utils/text.dart';

class newsbox extends StatelessWidget {
  final String imageurl, title, time, description, url;
  const newsbox(
      {super.key,
      required this.imageurl,
      required this.title,
      required this.time,
      required this.description,
      required this.url});

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Column(
      children: [
        InkWell(
          onTap: () {
            showmybottomsheet(context, title, description, imageurl, url);
          },
          child: Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.only(left: 5, top: 5, right: 5),
            width: w,
            color: appcolor.black,
            child: Row(children: [
              CachedNetworkImage(
                imageUrl: imageurl,
                imageBuilder: (context, ImageProvider) => Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: ImageProvider, fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.yellow,
                  ),
                ),
                placeholder: (context, url) => CircularProgressIndicator(
                  color: appcolor.primary,
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Texting(text: title, color: appcolor.white, size: 16),
                  const SizedBox(
                    height: 5,
                  ),
                  Texting(text: time, color: appcolor.lightwhite, size: 12),
                ],
              ))
            ]),
          ),
        ),
        DividerWidget(),
      ],
    );
  }
}
