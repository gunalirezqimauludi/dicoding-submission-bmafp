import 'dart:math';
import 'package:flutter/material.dart';

/// Utils
import 'package:friendly_vegetarian/utils/helper.dart';

/// Data
import 'package:friendly_vegetarian/data/category.dart';

class CategoryItem extends StatelessWidget {
  final List<Category> items;
  CategoryItem({this.items});

  final _random = new Random();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: items.map(
          (item) {
            int randomId = _random.nextInt(colorCategory.length);
            int indexItem = items.indexOf(item);
            return GestureDetector(
              onTap: () => showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  content: Text(item.name),
                ),
              ),
              child: Container(
                width: 150.0,
                margin: EdgeInsets.only(
                  top: 4.0,
                  right: 4.0,
                  bottom: 4.0,
                  left: indexItem == 0 ? 18.0 : 4.0,
                ),
                child: Center(
                  child: Text(
                    item.name,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      colorCategory[randomId]['primary'],
                      colorCategory[randomId]['accent'],
                    ],
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(4.0)),
                ),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
