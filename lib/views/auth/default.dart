import 'package:erik/views/widgets/bottom/bottom_navigation.dart';
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
              Text('Default Page '),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNav(),
    );
  }
}