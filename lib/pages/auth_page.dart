import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter_tutorial/pages/home_page.dart';


class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLogin = true;
  bool _isLoading = false;

  final String baseUrl = "http://localhost:5039/api/auth";
  // Use 10.0.2.2 for Android Emulator, localhost for Windows/Linux desktop, or your LAN IP for real device

  Future<void> _authenticate() async {
    setState(() => _isLoading = true);

    final url = Uri.parse(_isLogin ? "$baseUrl/login" : "$baseUrl/register");
    final body = jsonEncode({
      "username": _usernameController.text.trim(),
      "password": _passwordController.text.trim(),
    });

    try {
      final res = await http.post(url,
          headers: {"Content-Type": "application/json"}, body: body);

      if (res.statusCode == 200) {
        if (_isLogin) {
          final data = jsonDecode(res.body);
          final token = data["token"];

          if (token != null) {
            final prefs = await SharedPreferences.getInstance();
            await prefs.setString("jwt", token);

            if (mounted) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const BottomNavScreen()),
              );
            }
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Registration successful!")),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error: ${res.body}")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Network error: $e")),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _checkToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("jwt");

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text(token != null ? "Token found!" : "No token stored")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isLogin ? "Login" : "Register"),
        actions: [
          IconButton(
            icon: const Icon(Icons.security),
            onPressed: _checkToken,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _usernameController,
                decoration: const InputDecoration(labelText: "Username"),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: "Password"),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              _isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: _authenticate,
                      child: Text(_isLogin ? "Login" : "Register"),
                    ),
              TextButton(
                onPressed: () => setState(() => _isLogin = !_isLogin),
                child: Text(_isLogin
                    ? "Don't have an account? Register"
                    : "Already have an account? Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
