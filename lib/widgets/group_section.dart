import 'package:flutter/material.dart';
import 'package:friendly_vegetarian/utils/helper.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

/// Screens
import 'package:friendly_vegetarian/screens/category_screen.dart';

class SectionGroup extends StatelessWidget {
  final sectionName;
  SectionGroup(this.sectionName);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$sectionName',
            style: TextStyle(
              color: colorTheme['concrete'],
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
          TextButton(
            onPressed: () => pushNewScreen(
              context,
              screen: CategoryScreen(),
              withNavBar: false,
              pageTransitionAnimation: PageTransitionAnimation.cupertino,
            ),
            child: Text(
              'See All',
              style: TextStyle(
                color: colorTheme['peterriver'],
                fontWeight: FontWeight.w600,
                fontSize: 16.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
