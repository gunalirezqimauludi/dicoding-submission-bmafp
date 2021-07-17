import 'package:flutter/material.dart';

class Badge extends StatelessWidget {
  final String value;
  Badge(this.value);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 10.0,
        right: 4.0,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 7,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Colors.red,
      ),
      child: Text(
        value,
        style: TextStyle(
          fontSize: 9.0,
          color: Colors.white,
        ),
      ),
    );
  }
}
