import 'dart:convert';
import 'package:http/http.dart' as http;

class LostFoundService {
  static Future<List> fetchItems() async {
    final response = await http.get(Uri.parse('http://localhost:5000/api/lost-found'));
    if (response.statusCode == 200) {
      return List.from(json.decode(response.body));
    }
    return [];
  }

  static Future<void> claimItem(String itemId, String userId) async {
    await http.post(Uri.parse('http://localhost:5000/api/lost-found/claim'), body: json.encode({'itemId': itemId, 'userId': userId}));
  }
}
