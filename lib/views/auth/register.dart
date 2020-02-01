import 'package:erik/views/widgets/bottom/auth_navigation.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 10.0,
          ),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[
              Text('Register Page '),
            ],
          ),
        ),
      ),
      bottomNavigationBar: AuthNav(),
    );
  }
}