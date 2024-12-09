import 'package:flutter/material.dart';
import '../components/custom_button.dart';
import '../services/auth_service.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _login() async {
    final email = _emailController.text;
    final password = _passwordController.text;
    final response = await AuthService.login(email, password);

    if (response != null) {
      if (response['role'] == 'admin') {
        Navigator.pushReplacementNamed(context, '/admin_dashboard');
      } else {
        Navigator.pushReplacementNamed(context, '/user_dashboard');
      }
    } else {
      // Handle invalid login
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: _emailController, decoration: InputDecoration(labelText: 'Email')),
            TextField(controller: _passwordController, obscureText: true, decoration: InputDecoration(labelText: 'Password')),
            CustomButton(text: 'Login', onPressed: _login),
          ],
        ),
      ),
    );
  }
}
