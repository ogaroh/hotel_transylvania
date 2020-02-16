import 'package:flutter/material.dart';

import 'auth/login.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2.0,
        title: Text('Settings'),
      ),
      body: SafeArea(
        child: Center(
          child: RaisedButton(
            textColor: Colors.white,
            child: Text('Sgn Out'),
            color: Theme.of(context).primaryColor,
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => LoginPage(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
