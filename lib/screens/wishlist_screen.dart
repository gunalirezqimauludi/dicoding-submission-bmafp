import 'package:flutter/material.dart';

/// Utils
import 'package:friendly_vegetarian/utils/helper.dart';

class WishlistScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Wishlist',
          style: TextStyle(
            color: colorTheme['concrete'],
          ),
        ),
      ),
      body: Center(
        child: Text('Wishlist Screen'),
      ),
    );
  }
}
