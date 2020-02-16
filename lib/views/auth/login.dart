import 'package:flutter/material.dart';

import '../home_screen.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In"),
        elevation: 2.0,
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Container(
                height: 400.0,
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Welcome',
                            style: TextStyle(
                              fontSize: 30.0,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            'Back',
                            style: TextStyle(fontSize: 30.0),
                          ),
                          Center(
                            child: FlutterLogo(
                              size: 250.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40.0, right: 40.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    TextField(
                      keyboardAppearance: Brightness.dark,
                      keyboardType: TextInputType.emailAddress,
                      maxLines: 1,
                      decoration: InputDecoration(
                          icon: Icon(Icons.person),
                          labelText: "Email Address",
                          helperText: "Enter a registered email address"),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextField(
                      keyboardAppearance: Brightness.dark,
                      keyboardType: TextInputType.visiblePassword,
                      maxLines: 1,
                      decoration: InputDecoration(
                        icon: Icon(Icons.lock_open),
                        labelText: "Password",
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Sign In',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        FloatingActionButton(
                          child: Icon(
                            Icons.arrow_forward,
                            color: Theme.of(context).cardColor,
                          ),
                          backgroundColor: Theme.of(context).primaryColor,
                          splashColor: Theme.of(context).accentColor,
                          elevation: 3.0,
                          onPressed: () => Navigator.push(context,
                              MaterialPageRoute(builder: (_) => HomeScreen())),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 25.0, left: 60.0, right: 50.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Sign Up',
                      style:
                          TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      'Forgot Password',
                      style:
                          TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
