import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

/// Utils
import 'package:friendly_vegetarian/utils/helper.dart';

class InputSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: ListTile(
        horizontalTitleGap: 0,
        leading: Icon(
          FeatherIcons.search,
          color: colorTheme['asbestos'],
        ),
        title: TextField(
          decoration: InputDecoration(
            hintText: 'What do you need...',
            hintStyle: TextStyle(color: colorTheme['silver']),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
