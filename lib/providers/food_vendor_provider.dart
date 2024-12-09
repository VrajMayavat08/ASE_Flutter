import 'package:flutter/material.dart';

class FoodVendorProvider with ChangeNotifier {
  List _foodVendors = [];
  List get foodVendors => _foodVendors;

  void setFoodVendors(List vendors) {
    _foodVendors = vendors;
    notifyListeners();
  }
}
