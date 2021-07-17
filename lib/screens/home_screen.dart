import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

/// Screens
import 'package:friendly_vegetarian/screens/cart_screen.dart';

/// Components Widget
import 'package:friendly_vegetarian/widgets/badge.dart';
import 'package:friendly_vegetarian/widgets/input_search.dart';
import 'package:friendly_vegetarian/widgets/image_slider.dart';
import 'package:friendly_vegetarian/widgets/group_section.dart';
import 'package:friendly_vegetarian/widgets/category_item.dart';
import 'package:friendly_vegetarian/widgets/product_item.dart';

/// Data
import 'package:friendly_vegetarian/data/slider.dart';
import 'package:friendly_vegetarian/data/category.dart';
import 'package:friendly_vegetarian/data/product.dart';
import 'package:friendly_vegetarian/data/cart.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _headerSection(context),
          _bodySection(),
        ],
      ),
    );
  }
}

Widget _headerSection(BuildContext context) {
  final String username = 'Gunali Rezqi';

  return Stack(
    children: [
      _headerBackground(
        image: 'assets/images/geometric-yellow.jpg',
      ),
      Padding(
        padding: EdgeInsets.only(
          top: 40.0,
          right: 20.0,
          bottom: 10.0,
          left: 20.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 30.0, bottom: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _labelGreetings(username),
                      SizedBox(height: 4),
                      _labelSlogans('Lets keep healthy'),
                      SizedBox(height: 4),
                    ],
                  ),
                  Row(
                    children: [
                      _buttonCart(context, totalItem: listCart.length),
                      _buttonNotification(),
                    ],
                  )
                ],
              ),
            ),
            InputSearch(),
            SizedBox(height: 20),
            ImageSlider(
              images: imageSlider,
            ),
          ],
        ),
      ),
    ],
  );
}

Widget _bodySection() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      SectionGroup('Diets'),
      CategoryItem(
        items: categoryDiets,
      ),
      SectionGroup('Bestsellers'),
      ProductItem(
        items: productBestsellers,
      ),
    ],
  );
}

Widget _headerBackground({String image}) {
  return Container(
    width: double.infinity,
    child: Image.asset(
      image,
      fit: BoxFit.cover,
      height: 300.0,
    ),
  );
}

Widget _buttonCart(BuildContext context, {totalItem}) {
  return Stack(
    alignment: Alignment.topRight,
    children: [
      IconButton(
        onPressed: () => {
          pushNewScreen(
            context,
            screen: CartScreen(),
            withNavBar: false,
            pageTransitionAnimation: PageTransitionAnimation.cupertino,
          )
        },
        color: Colors.white,
        icon: Icon(
          FeatherIcons.shoppingCart,
        ),
      ),
      totalItem > 0 ? Badge('$totalItem') : Container(),
    ],
  );
}

Widget _buttonNotification() {
  return IconButton(
    onPressed: () => {},
    color: Colors.white,
    icon: Icon(
      FeatherIcons.bell,
    ),
  );
}

Widget _labelGreetings(String username) {
  return Text(
    'Hi, $username!',
    style: TextStyle(
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  );
}

Widget _labelSlogans(String slogan) {
  return Text(
    slogan,
    style: TextStyle(
      fontSize: 14.0,
      color: Colors.white70,
    ),
  );
}
