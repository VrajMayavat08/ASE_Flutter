import 'dart:convert';
import 'package:http/http.dart' as http;
import '../utils/constants.dart';

class ApiService {
  static Future<Map<String, dynamic>?> get(String endpoint) async {
    final response = await http.get(Uri.parse('${Constants.baseUrl}/$endpoint'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return null;  // Handle error or return null
    }
  }

  static Future<Map<String, dynamic>?> post(String endpoint, Map<String, dynamic> body) async {
    final response = await http.post(
      Uri.parse('${Constants.baseUrl}/$endpoint'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(body),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return json.decode(response.body);
    } else {
      return null;  // Handle error or return null
    }
  }

  static Future<Map<String, dynamic>?> put(String endpoint, Map<String, dynamic> body) async {
    final response = await http.put(
      Uri.parse('${Constants.baseUrl}/$endpoint'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(body),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return null;  // Handle error or return null
    }
  }

  static Future<Map<String, dynamic>?> delete(String endpoint) async {
    final response = await http.delete(Uri.parse('${Constants.baseUrl}/$endpoint'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return null;  // Handle error or return null
    }
  }
}
