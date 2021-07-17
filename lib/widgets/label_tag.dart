import 'package:flutter/material.dart';

/// Utils
import 'package:friendly_vegetarian/utils/helper.dart';

class LabelTag extends StatelessWidget {
  final IconData icon;
  final String label;
  final String status;
  LabelTag({this.icon, this.label, this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      margin: EdgeInsets.only(
        right: 5,
      ),
      color: colorTheme[status],
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 10,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
            ),
          )
        ],
      ),
    );
  }
}
