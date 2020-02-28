import 'dart:convert';
import 'package:erik/views/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:erik/theme/colors.dart' as theme;
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:erik/env/development.dart';
import '../../models/http_response.dart';
import 'package:http/http.dart' as http;
// import '../home_screen.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _isLoading = false;
  String _message = '';

  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  TextStyle errorStyle = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 12.0,
    color: theme.heading,
    fontWeight: FontWeight.w600,
  );
  TextStyle linkStyle = TextStyle(
      fontFamily: 'Montserrat', fontSize: 15.0, color: Colors.teal[900]);

  @override
  Widget build(BuildContext context) {
    // create an account through the API
    signUp(String name, String email, String password) async {
      // SharedPreferences localStorage = await SharedPreferences.getInstance();
      var userInfo =
          json.encode({"name": name, "email": email, "password": password});
      var res = await http.post(
        '${Environment.apiURL}/account/register',
        headers: {"Content-Type": "application/json"},
        body: userInfo,
      );

      var jsonData = json.decode(res.body);
      var response = Response(jsonData);
      print("Status: ${response.status}, Message: ${response.message}");

      if (response.status == 200) {
        print("${response.message}");
        setState(() {
          _isLoading = false;
          // localStorage.setString("token", response.message);
          _message = 'New user created. You can now login using your email';
        });
        Navigator.push(context, MaterialPageRoute(builder: (_) => LoginPage()));
      } else {
        setState(() {
          _isLoading = false;
          String msg = response.message;
          _message = '${msg[0].toUpperCase()}${msg.substring(1)}.';
        });
      }
    }

    TextEditingController _nameController = new TextEditingController();
    TextEditingController _emailController = new TextEditingController();
    TextEditingController _passwordController = new TextEditingController();
    final userNameField = TextField(
      controller: _nameController,
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Username",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final emailField = TextField(
      controller: _emailController,
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final passwordField = TextField(
      controller: _passwordController,
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final registerButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Theme.of(context).primaryColor,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          setState(() {
            _isLoading = true;
          });
          signUp(
            _nameController.text,
            _emailController.text,
            _passwordController.text,
          );
        },
        child: Text("Create Account",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
    final goToLogin = GestureDetector(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (_) => LoginPage())),
      child: Text(
        'Already have an account? Sign in.',
        style: linkStyle,
      ),
    );
    final errorMessage = Text(
      '$_message',
      style: errorStyle,
    );

    return Scaffold(
      body: Center(
        child: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: _isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding: const EdgeInsets.all(36.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 40.0,
                          color: Theme.of(context).primaryColor,
                          letterSpacing: 1.5,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 35.0,
                      ),
                      SizedBox(
                        height: 155.0,
                        child: Image.asset(
                          "assets/images/logo.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(height: 45.0),
                      userNameField,
                      SizedBox(height: 25.0),
                      emailField,
                      SizedBox(height: 25.0),
                      passwordField,
                      SizedBox(
                        height: 35.0,
                      ),
                      registerButton,
                      SizedBox(
                        height: 15.0,
                      ),
                      errorMessage,
                      SizedBox(
                        height: 15.0,
                      ),
                      goToLogin,
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
