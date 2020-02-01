import 'package:erik/views/auth/login.dart';
import 'package:erik/views/auth/register.dart';
import 'package:flutter/material.dart';

class DefaultAuth extends StatefulWidget {
  @override
  _DefaultAuthState createState() => _DefaultAuthState();
}

class _DefaultAuthState extends State<DefaultAuth> {
   bool _isLoggingIn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoggingIn ? LoginPage() : RegisterPage(),
    );
  }
}