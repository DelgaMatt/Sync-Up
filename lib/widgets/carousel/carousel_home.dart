import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

final List<String> imageList = [
  'lib/assets/images/carousel/_DSC2137.JPG',
  'lib/assets/images/carousel/_DSC2114.JPG',
  'lib/assets/images/carousel/_DSC2109.JPG',
  'lib/assets/images/carousel/_DSC2097.JPG',
  'lib/assets/images/carousel/_DSC2092.JPG',
];

class HomeCarousel extends StatelessWidget {
  const HomeCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        aspectRatio: 2.0,
        enlargeCenterPage: true,),
      items: 
        imageList
          .map((item) => Center(
              child: Image.asset(
                item,
                fit: BoxFit.cover, 
                width: 500,
              ),
            ),
          )
          .toList()
    );
  }
}