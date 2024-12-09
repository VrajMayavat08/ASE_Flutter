import 'dart:convert';
import 'package:http/http.dart' as http;

class FoodVendorService {
  static Future<List> fetchVendors() async {
    final response = await http.get(Uri.parse('http://localhost:5000/api/food-vendors'));
    if (response.statusCode == 200) {
      return List.from(json.decode(response.body));
    }
    return [];
  }
}
