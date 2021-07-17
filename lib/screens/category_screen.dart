import 'package:flutter/material.dart';

/// Utils
import 'package:friendly_vegetarian/utils/helper.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Categories',
          style: TextStyle(
            color: colorTheme['concrete'],
          ),
        ),
        iconTheme: IconThemeData(
          color: colorTheme['concrete'],
        ),
      ),
      body: Center(
        child: Text('Categories Screen'),
      ),
    );
  }
}
