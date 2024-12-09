import 'package:flutter/material.dart';
import '../components/item_card.dart';
import '../services/food_vendor_service.dart';


class FoodVendorsScreen extends StatelessWidget {
  final Future<List> foodVendors = FoodVendorService.fetchVendors();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Food Vendors")),
      body: FutureBuilder<List>(
        future: foodVendors,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No food vendors found'));
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
