import 'package:flutter/material.dart';

/// Utils
import 'package:friendly_vegetarian/utils/helper.dart';

class HeroImage extends StatelessWidget {
  final String images;
  final Function wishlistAction;
  HeroImage({this.images, this.wishlistAction});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          height: 250,
          width: double.infinity,
          child: Image.asset(
            images,
            fit: BoxFit.cover,
            height: 100.0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: FloatingActionButton(
            mini: true,
            backgroundColor: Colors.white,
            foregroundColor: colorTheme['danger'],
            onPressed: wishlistAction,
            child: Icon(Icons.favorite_border),
          ),
        )
      ],
    );
  }
}
