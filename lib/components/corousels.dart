import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class VerticalSliderDemo extends StatelessWidget {
  final List imgslide;
  const VerticalSliderDemo({super.key, required this.imgslide});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        aspectRatio: 2.0,
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
        autoPlay: true,
      ),
      items: [],
      // items: imageSliders,
    );
  }
}
