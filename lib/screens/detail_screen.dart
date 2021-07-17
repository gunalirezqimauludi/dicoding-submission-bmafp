import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

/// Screens
import 'package:friendly_vegetarian/screens/cart_screen.dart';

/// Components Widget
import 'package:friendly_vegetarian/widgets/badge.dart';
import 'package:friendly_vegetarian/widgets/hero_image.dart';
import 'package:friendly_vegetarian/widgets/label_tag.dart';
import 'package:friendly_vegetarian/widgets/separator.dart';

/// Utils
import 'package:friendly_vegetarian/utils/helper.dart';

/// Data
import 'package:friendly_vegetarian/data/product.dart';
import 'package:friendly_vegetarian/data/cart.dart';

class DetailScreen extends StatefulWidget {
  final Product product;

  DetailScreen({key, this.product}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  static final _containerHeight = 80.0;

  var _fromTop = -_containerHeight;
  var _controller = ScrollController();
  var _allowReverse = true, _allowForward = true;
  var _prevOffset = 0.0;
  var _prevForwardOffset = -_containerHeight;
  var _prevReverseOffset = 0.0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_listener);
  }

  void _listener() {
    double offset = _controller.offset;
    var direction = _controller.position.userScrollDirection;

    if (direction == ScrollDirection.reverse) {
      _allowForward = true;
      if (_allowReverse) {
        _allowReverse = false;
        _prevOffset = offset;
        _prevForwardOffset = _fromTop;
      }

      var difference = offset - _prevOffset;
      _fromTop = _prevForwardOffset + difference;
      if (_fromTop > 0) _fromTop = 0;
    } else if (direction == ScrollDirection.forward) {
      _allowReverse = true;
      if (_allowForward) {
        _allowForward = false;
        _prevOffset = offset;
        _prevReverseOffset = _fromTop;
      }

      var difference = offset - _prevOffset;
      _fromTop = _prevReverseOffset + difference;
      if (_fromTop < -_containerHeight) _fromTop = -_containerHeight;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var product = listCart.firstWhere(
        (item) => item.productId == widget.product.id,
        orElse: () => null);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        titleSpacing: 0,
        leadingWidth: 45,
        backgroundColor: Colors.white,
        leading: navigationBack(context),
        actions: [
          buttonCart(context),
        ],
        title: inputSearch(widget.product.name),
      ),
      floatingActionButton: Opacity(
        opacity: 1 - (-_fromTop / _containerHeight),
        child: GestureDetector(
          onTap: () {
            if (product == null) {
              setState(() {
                listCart.add(
                  Cart(
                    productId: widget.product.id,
                    quantity: 1,
                  ),
                );
              });
            } else {
              setState(() {
                listCart.removeWhere(
                  (item) => item.productId == widget.product.id,
                );
              });
            }

            pushNewScreen(
              context,
              screen: CartScreen(),
              withNavBar: false,
              pageTransitionAnimation: PageTransitionAnimation.cupertino,
            );
          },
          child: product == null
              ? buttonActionCart(
                  height: _containerHeight,
                  label: 'Add to cart',
                  icon: FeatherIcons.shoppingCart,
                  color: Color(0xFFFA9415),
                )
              : buttonActionCart(
                  height: _containerHeight,
                  label: 'Remove item',
                  icon: FeatherIcons.trash,
                  color: Color(0xFFEB5857),
                ),
        ),
      ),
      body: SingleChildScrollView(
        controller: _controller,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeroImage(
              images: widget.product.image,
              wishlistAction: () => {},
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  labelTitle(widget.product.name),
                  SizedBox(
                    height: 10,
                  ),
                  Row(children: [
                    labelDiscount(widget.product.discount),
                    labelPrice(widget.product.price),
                  ]),
                  SizedBox(
                    height: 10,
                  ),
                  Row(children: [
                    labelPriceAfterDiscount(
                      calcDiscPrice(
                        widget.product.price,
                        widget.product.discount,
                      ),
                      widget.product.unit,
                    ),
                    labelCategory(widget.product.category),
                  ]),
                  SizedBox(
                    height: 15,
                  ),
                  labelStock(widget.product.stock, widget.product.unit),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      LabelTag(
                        icon: FeatherIcons.thumbsUp,
                        label: 'Recomended',
                        status: 'success',
                      ),
                      LabelTag(
                        icon: FeatherIcons.star,
                        label: 'Best Selling',
                        status: 'warning',
                      ),
                      LabelTag(
                        icon: FeatherIcons.sun,
                        label: 'Hot Seller',
                        status: 'primary',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Separator(),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  labelTitle('Description'),
                  SizedBox(
                    height: 10,
                  ),
                  labelDescription(widget.product.description),
                  SizedBox(
                    height: 20,
                  ),
                  labelTitle('Health & Benefit'),
                  ListView(
                    shrinkWrap: true,
                    children: <Widget>[
                      listTile('Antioxidants and Cancer Prevention'),
                      listTile('Reducing Blood Presure'),
                      listTile('Maintaining Heart Health'),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}

Widget navigationBack(BuildContext context) {
  return IconButton(
    icon: Icon(
      FeatherIcons.chevronLeft,
      color: colorTheme['concrete'],
    ),
    onPressed: () => Navigator.of(context).pop(),
  );
}

Widget buttonCart(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(
      left: 0,
      right: 8,
    ),
    child: Stack(
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
          color: colorTheme['concrete'],
          icon: Icon(
            FeatherIcons.shoppingCart,
          ),
        ),
        listCart.length > 0 ? Badge('${listCart.length}') : Container(),
      ],
    ),
  );
}

Widget buttonActionCart(
    {double height, String label, IconData icon, Color color}) {
  return Container(
    height: height,
    margin: EdgeInsets.only(
      left: 28.0,
      bottom: 5.0,
    ),
    padding: EdgeInsets.all(20.0),
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(5),
      boxShadow: [
        BoxShadow(
          color: color.withOpacity(0.3),
          spreadRadius: 1,
          blurRadius: 3,
          offset: Offset(0, 3),
        ),
      ],
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              '${listCart.length} item in cart',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 12,
              ),
            ),
          ],
        ),
        Icon(
          icon,
          color: Colors.white,
        )
      ],
    ),
  );
}

Widget inputSearch(String initialValue) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 15),
    decoration: BoxDecoration(
      color: Color(0xFFFAFAFA),
      border: Border.all(
        color: Color(0xFFD0D0D0),
        width: 0.5,
      ),
      borderRadius: BorderRadius.circular(5),
    ),
    child: TextFormField(
      initialValue: initialValue,
      decoration: InputDecoration(
        icon: Icon(
          FeatherIcons.search,
          color: colorTheme['asbestos'],
        ),
        border: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(vertical: 10),
        isDense: true,
      ),
    ),
  );
}

Widget listTile(String label) {
  return ListTile(
    dense: true,
    horizontalTitleGap: 0,
    contentPadding: EdgeInsets.zero,
    visualDensity: VisualDensity(
      horizontal: -4,
      vertical: -4,
    ),
    leading: Icon(
      FeatherIcons.disc,
      color: colorTheme['primary'],
      size: 12,
    ),
    title: Text(
      label,
      style: TextStyle(
        fontSize: 12,
      ),
    ),
  );
}

Widget labelTitle(String label) {
  return Text(
    label,
    style: TextStyle(
      color: colorTheme['concrete'],
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
    ),
  );
}

Widget labelDescription(String label) {
  return Text(
    label,
    style: TextStyle(
      color: Color(0xFF7E7E7E),
      fontSize: 12.0,
    ),
  );
}

Widget labelDiscount(int discount) {
  return Container(
    color: Color(0xFF868EA4),
    padding: EdgeInsets.symmetric(
      horizontal: 10,
      vertical: 5,
    ),
    margin: EdgeInsets.only(right: 8.0),
    child: Text(
      '$discount% OFF',
      style: TextStyle(
        color: Colors.white,
      ),
    ),
  );
}

Widget labelPrice(double price) {
  return Text(
    '\$$price',
    style: TextStyle(
      color: colorTheme['concrete'],
      decoration: TextDecoration.lineThrough,
    ),
  );
}

Widget labelPriceAfterDiscount(double price, String unit) {
  return Text(
    '\$${price.toStringAsFixed(2)} / $unit',
    style: TextStyle(
      color: colorTheme['primary'],
      fontWeight: FontWeight.bold,
      fontSize: 16.0,
    ),
  );
}

Widget labelCategory(String category) {
  return Container(
    padding: EdgeInsets.symmetric(
      horizontal: 15,
      vertical: 5,
    ),
    margin: EdgeInsets.only(left: 10.0),
    decoration: BoxDecoration(
      color: colorTheme['primary'],
      borderRadius: BorderRadius.circular(20),
    ),
    child: Text(
      category,
      style: TextStyle(
        color: Colors.white,
      ),
    ),
  );
}

Widget labelStock(double stock, String unit) {
  return Text(
    'Available Stock ${stock.toStringAsFixed(2)} $unit',
    style: TextStyle(
      color: Color(0xFF696662),
      fontSize: 14,
    ),
  );
}
