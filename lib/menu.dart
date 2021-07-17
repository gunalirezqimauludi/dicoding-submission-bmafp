import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import "package:flutter_feather_icons/flutter_feather_icons.dart";
import 'package:friendly_vegetarian/screens/home_screen.dart';
import 'package:friendly_vegetarian/screens/category_screen.dart';
import 'package:friendly_vegetarian/screens/scan_screen.dart';
import 'package:friendly_vegetarian/screens/wishlist_screen.dart';
import 'package:friendly_vegetarian/screens/more_screen.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PersistentTabController _controller;
    _controller = PersistentTabController(initialIndex: 0);

    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style15,
    );
  }
}

List<Widget> _buildScreens() {
  return [
    HomeScreen(),
    CategoryScreen(),
    ScanScreen(),
    WishlistScreen(),
    MoreScreen(),
  ];
}

List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    PersistentBottomNavBarItem(
      icon: Icon(FeatherIcons.home),
      title: ("Home"),
      activeColorPrimary: Color(0xFFFA9415),
      inactiveColorPrimary: Color(0xFF4f4c47),
    ),
    PersistentBottomNavBarItem(
      icon: Icon(FeatherIcons.tag),
      title: ("Categories"),
      activeColorPrimary: Color(0xFFFA9415),
      inactiveColorPrimary: Color(0xFF4f4c47),
    ),
    PersistentBottomNavBarItem(
      icon: Icon(FeatherIcons.maximize),
      title: (" "),
      activeColorPrimary: Color(0xFFFA9415),
      activeColorSecondary: Colors.white,
      inactiveColorPrimary: Color(0xFF4f4c47),
    ),
    PersistentBottomNavBarItem(
      icon: Icon(FeatherIcons.heart),
      title: ("Wishlist"),
      activeColorPrimary: Color(0xFFFA9415),
      inactiveColorPrimary: Color(0xFF4f4c47),
    ),
    PersistentBottomNavBarItem(
      icon: Icon(FeatherIcons.moreHorizontal),
      title: ("More"),
      activeColorPrimary: Color(0xFFFA9415),
      inactiveColorPrimary: Color(0xFF4f4c47),
    ),
  ];
}
