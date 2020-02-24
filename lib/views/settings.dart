import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'auth/login.dart';
import '../models/http_response.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  SharedPreferences localStorage;

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  checkLoginStatus() async {
    localStorage = await SharedPreferences.getInstance();
    if (localStorage.getString("token") == null) {}
  }

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
            child: Text('Sign Out'),
            color: Theme.of(context).primaryColor,
            onPressed: () {
              localStorage.clear();
              print(localStorage.getString("token"));
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => LoginPage(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
