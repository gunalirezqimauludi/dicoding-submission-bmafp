import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_number_picker/flutter_number_picker.dart';

/// Screens
import 'package:friendly_vegetarian/screens/checkout_screen.dart';

/// Utils
import 'package:friendly_vegetarian/utils/helper.dart';

/// Data
import 'package:friendly_vegetarian/data/cart.dart';
import 'package:friendly_vegetarian/data/product.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
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
          'Cart',
          style: TextStyle(
            color: colorTheme['concrete'],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: listCart.length > 0
            ? Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      var product = productBestsellers.firstWhere(
                          (item) => item.id == listCart[index].productId,
                          orElse: () => null);
                      return Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(5.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _imageProduct(product.image),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      _productName(product.name),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      _productPriceAfterDisc(
                                        calcDiscPrice(
                                          product.price,
                                          product.discount,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      CustomNumberPicker(
                                        initialValue: listCart[index].quantity,
                                        maxValue: product.stock.toInt(),
                                        minValue: 0,
                                        step: 1,
                                        onValue: (value) {
                                          if (value > 0) {
                                            setState(() {
                                              listCart[index].quantity = value;
                                            });
                                          } else {
                                            setState(() {
                                              listCart.removeAt(index);
                                            });
                                          }
                                          return print(value.toString());
                                        },
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: 1,
                            color: Color(0xFFECECEC),
                          ),
                        ],
                      );
                    },
                    itemCount: listCart.length,
                  ),
                  _buttonCheckout(context)
                ],
              )
            : Center(child: Text('No items in cart')),
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

Widget _imageProduct(String image) {
  return Container(
    margin: EdgeInsets.only(right: 20.0),
    child: Image.asset(
      image,
      fit: BoxFit.cover,
      height: 110.0,
      width: 110.0,
    ),
  );
}

Widget _productName(String name) {
  return Text(
    name,
    style: TextStyle(
      color: colorTheme['concrete'],
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
    ),
  );
}

Widget _productPriceAfterDisc(double price) {
  return Text(
    '\$${price.toStringAsFixed(2)}',
    style: TextStyle(
      color: colorTheme['primary'],
      fontWeight: FontWeight.bold,
      fontSize: 14.0,
    ),
  );
}

Widget _buttonCheckout(BuildContext context) {
  return TextButton(
    onPressed: () => {
      pushNewScreen(
        context,
        screen: CheckoutScreen(),
        withNavBar: false,
        pageTransitionAnimation: PageTransitionAnimation.cupertino,
      )
    },
    child: Container(
      height: 50,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: colorTheme['primary'],
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: Text(
          'Checkout',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}
