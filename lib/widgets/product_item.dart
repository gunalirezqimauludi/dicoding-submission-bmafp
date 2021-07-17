import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

/// Screens
import 'package:friendly_vegetarian/screens/detail_screen.dart';

/// Utils
import 'package:friendly_vegetarian/utils/helper.dart';

/// Data
import 'package:friendly_vegetarian/data/product.dart';

class ProductItem extends StatelessWidget {
  final List<Product> items;
  ProductItem({this.items});

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    final double _itemHeight = (_size.height) / 2;
    final double _itemWidth = _size.width / 1.7;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        height: 750,
        child: GridView.count(
          padding: EdgeInsets.all(0),
          primary: false,
          shrinkWrap: true,
          crossAxisCount: 2,
          childAspectRatio: (_itemWidth / _itemHeight),
          children: items.map((item) {
            return GestureDetector(
              onTap: () => {
                pushNewScreen(
                  context,
                  screen: DetailScreen(product: item),
                  withNavBar: false,
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                )
              },
              child: Container(
                margin: EdgeInsets.all(2.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Color(0xFFE4E3E3),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        _imageProduct(item.image),
                        _categoryProduct(item.category),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              _discountProduct(item.discount),
                              _productPrice(item.price),
                            ],
                          ),
                          SizedBox(height: 6),
                          _productPriceAfterDisc(
                            calcDiscPrice(
                              item.price,
                              item.discount,
                            ),
                          ),
                          SizedBox(height: 8),
                          _productName(item.name),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

Widget _imageProduct(String image) {
  return Container(
    width: double.infinity,
    child: Image.asset(
      image,
      fit: BoxFit.cover,
      height: 100.0,
    ),
  );
}

Widget _categoryProduct(String category) {
  return Container(
    padding: EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 5,
    ),
    decoration: BoxDecoration(
      color: Color(0xFFE5E9EF),
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(20),
      ),
    ),
    child: Text(
      category,
      style: TextStyle(
        fontSize: 12.0,
      ),
    ),
  );
}

Widget _discountProduct(int discount) {
  return Container(
    color: colorTheme['primary'],
    padding: EdgeInsets.symmetric(
      horizontal: 10,
      vertical: 5,
    ),
    margin: EdgeInsets.only(right: 5.0),
    child: Text(
      '$discount%',
      style: TextStyle(
        color: Colors.white,
      ),
    ),
  );
}

Widget _productPrice(double price) {
  return Text(
    '\$$price',
    style: TextStyle(
      color: colorTheme['concrete'],
      decoration: TextDecoration.lineThrough,
    ),
  );
}

Widget _productPriceAfterDisc(double price) {
  return Text(
    '\$${price.toStringAsFixed(2)}',
    style: TextStyle(
      color: colorTheme['primary'],
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
    ),
  );
}

Widget _productName(String name) {
  return Text(
    name,
    style: TextStyle(
      color: colorTheme['concrete'],
      fontSize: 14.0,
      fontWeight: FontWeight.bold,
    ),
  );
}
