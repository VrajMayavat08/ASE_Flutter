import 'package:flutter/material.dart';

class FiltersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Filters")),
      body: Column(
        children: [
          CheckboxListTile(title: Text('Vegetarian'), value: false, onChanged: (val) {}),
          CheckboxListTile(title: Text('Halal'), value: false, onChanged: (val) {}),
        ],
      ),
    );
  }
}
