import 'package:flutter/material.dart';
import '../components/item_card.dart';
import '../services/lost_found_service.dart';


class LostAndFoundScreen extends StatelessWidget {
  final Future<List> lostItems = LostFoundService.fetchItems();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Lost and Found")),
      body: FutureBuilder<List>(
        future: lostItems,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No items found'));
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return ItemCard(item: snapshot.data![index]);
            },
          );
        },
      ),
    );
  }
}
