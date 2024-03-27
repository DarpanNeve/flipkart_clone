import 'package:flutter/material.dart';

import '../pages/accounts_page.dart';
import '../pages/card_page.dart';
import '../pages/categories_page.dart';
import '../pages/home_page/home_page.dart';
import '../pages/notification_page.dart';

int currentIndex = 0;
List<Widget> pages = <Widget>[
  const HomePage(),
  const CategoriesPage(),
  const NotificationPage(),
  const AccountsPage(),
  const CardPage(),
];

List<BottomNavigationBarItem> homeBottomNavBarItem=[
  const BottomNavigationBarItem(
    icon: Icon(Icons.home),
    label: 'Home',
  ),
  const BottomNavigationBarItem(
    label: "Categories",
    icon: Icon(Icons.category),
  ),
  const BottomNavigationBarItem(
    label: "Notifications",
    icon: Icon(Icons.notifications),
  ),
  const BottomNavigationBarItem(
    icon: Icon(Icons.person),
    label: 'Account',
  ),
  const BottomNavigationBarItem(
    icon: Icon(Icons.shopping_cart),
    label: 'Cart',
  ),
];
