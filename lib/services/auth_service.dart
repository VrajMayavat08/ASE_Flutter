import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  static Future<Map?> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('http://localhost:5000/api/auth/login'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'email': email, 'password': password}),
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    }
    return null;
  }
}
