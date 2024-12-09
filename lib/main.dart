import 'package:flutter/material.dart';
import 'screens/login.dart';
import 'screens/admin_dashboard.dart';
import 'screens/user_dashboard.dart';
import 'screens/lost_and_found.dart';
import 'screens/food_vendors.dart';
import 'screens/item_details.dart';
import 'screens/filters_screen.dart';
import 'routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lost and Found App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: routes,
    );
  }
}
