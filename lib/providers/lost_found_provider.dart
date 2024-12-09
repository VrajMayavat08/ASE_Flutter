import 'package:flutter/material.dart';

class LostFoundProvider with ChangeNotifier {
  List _lostItems = [];
  List get lostItems => _lostItems;

  void setLostItems(List items) {
    _lostItems = items;
    notifyListeners();
  }
}
