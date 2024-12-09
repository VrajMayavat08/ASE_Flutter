import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final dynamic item;

  ItemCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(item['name']),
        subtitle: Text(item['description']),
        leading: Image.network(item['image']),
        onTap: () {
          // Navigate to item details
        },
      ),
    );
  }
}
