import 'package:flutter/material.dart';
import 'package:gscarousel/gscarousel.dart';

/// Utils
import 'package:friendly_vegetarian/utils/helper.dart';

class ImageSlider extends StatelessWidget {
  final List<NetworkImage> images;
  ImageSlider({this.images});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(4.0)),
      child: SizedBox(
        height: 170.0,
        child: GSCarousel(
          images: images,
          indicatorSize: Size.square(8.0),
          indicatorActiveSize: Size(18.0, 8.0),
          indicatorColor: Colors.white,
          indicatorActiveColor: colorTheme['orange'],
          animationCurve: Curves.easeIn,
          contentMode: BoxFit.cover,
          // indicatorBackgroundColor: Colors.greenAccent,
        ),
      ),
    );
  }
}
