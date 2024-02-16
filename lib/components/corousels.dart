import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:news_app/components/bottomsheet.dart';

class VerticalSliderDemo extends StatelessWidget {
  final List<Widget> imgslide;
  final List url, imgurl, description, text;
  const VerticalSliderDemo(
      {super.key,
      required this.imgslide,
      required this.url,
      required this.imgurl,
      required this.description,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("hi-------------------------");
        // MyBottomsheetlayout(title: text, description: description, imageurl: imageurl, url: url)
      },
      child: CarouselSlider(
        options: CarouselOptions(
          aspectRatio: 2.0,
          enlargeCenterPage: true,
          scrollDirection: Axis.horizontal,
          autoPlay: true,
        ),
        items: imgslide,
        // items: imageSliders,
      ),
    );
  }
}
