import 'dart:convert';
import '../../models/http_response.dart';
import 'package:erik/env/development.dart';
import 'package:erik/views/auth/register.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../home_screen.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoading = false;

  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  TextStyle linkStyle = TextStyle(
      fontFamily: 'Montserrat', fontSize: 15.0, color: Colors.teal[600]);

  @override
  Widget build(BuildContext context) {
    String message = '';
    // sign in to the app through the API
    signIn(String email, String password) async {
      Map userInfo = {
        "email": email,
        "password": password,
      };
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      var res = await http.post('${Environment.apiURL}/account/sign-in',
          body: json.encode(userInfo));

      var jsonData = json.decode(res.body);
      var response = Response(jsonData);
      print("Status: ${response.status}, Message: ${response.message}");
      if (response.status == 200) {
        setState(() {
          _isLoading = false;
          localStorage.setString("token", response.message);
        });
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => HomeScreen()));
      } else {
        setState(() {
          _isLoading = false;
        });
      }
    }

    TextEditingController _emailController = new TextEditingController();
    TextEditingController _passwordController = new TextEditingController();

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
    final loginButton = Material(
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
          signIn(
            _emailController.text,
            _passwordController.text,
          );
        },
        child: Text("Proceed",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    final goToRegister = GestureDetector(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (_) => RegisterPage())),
      child: Text(
        'New here? Create your account.',
        style: linkStyle,
      ),
    );
    final errorMessage = GestureDetector(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (_) => RegisterPage())),
      child: Text(
        '$message',
        style: linkStyle,
      ),
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
                        'Sign In',
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
                      emailField,
                      SizedBox(height: 25.0),
                      passwordField,
                      SizedBox(
                        height: 35.0,
                      ),
                      loginButton,
                      SizedBox(
                        height: 15.0,
                      ),
                      errorMessage,
                      SizedBox(
                        height: 35.0,
                      ),
                      goToRegister,
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}

class User {
  final String email, password;
  const User(this.email, this.password);

  Map<String, dynamic> toJson() =>
      {"email": this.email, "password": this.password};
}
