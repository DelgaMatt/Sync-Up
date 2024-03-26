import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

final List<String> imageList = [
  '',
  '',
];

class HomeCarousel extends StatelessWidget {
  const HomeCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: items, 
      options: options,
    );
  }
}
