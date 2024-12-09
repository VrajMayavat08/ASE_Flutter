import 'package:all_integrated/screens/login.dart';
import 'package:flutter/material.dart';
import 'screens/admin_dashboard.dart';
import 'screens/user_dashboard.dart';
import 'screens/lost_and_found.dart';
import 'screens/food_vendors.dart';
import 'screens/item_details.dart';
import 'screens/filters_screen.dart';

final Map<String, WidgetBuilder> routes = {
  '/': (context) => LoginScreen(),
  '/admin_dashboard': (context) => AdminDashboardScreen(),
  '/user_dashboard': (context) => UserDashboardScreen(),
  '/lost_and_found': (context) => LostAndFoundScreen(),
  '/food_vendors': (context) => FoodVendorsScreen(),
  '/item_details': (context) => ItemDetailsScreen(),
  '/filters': (context) => FiltersScreen(),
};
