import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

/// Utils
import 'package:friendly_vegetarian/utils/helper.dart';

class CheckoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        titleSpacing: 0,
        leadingWidth: 45,
        backgroundColor: Colors.white,
        leading: _navigationBack(context),
        title: Text(
          'Checkout',
          style: TextStyle(
            color: colorTheme['concrete'],
          ),
        ),
      ),
      body: Center(
        child: Text('Checkout Screen'),
      ),
    );
  }
}

Widget _navigationBack(BuildContext context) {
  return IconButton(
    icon: Icon(
      FeatherIcons.chevronLeft,
      color: colorTheme['concrete'],
    ),
    onPressed: () => Navigator.of(context).pop(),
  );
}
