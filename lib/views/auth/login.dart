import 'package:flutter/material.dart';

import '../home_screen.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    final emailField = TextField(
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final passwordField = TextField(
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Theme.of(context).primaryColor,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (_) => HomeScreen())),
        child: Text("Login",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          child: Padding(
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
                loginButon,
                SizedBox(
                  height: 15.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text("Sign In"),
    //     elevation: 2.0,
    //   ),
    //   backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    //   body: SafeArea(
    //     child: Padding(
    //       padding: const EdgeInsets.all(8.0),
    //       child: Column(
    //         children: <Widget>[
    //           Container(
    //             height: 400.0,
    //             child: Column(
    //               children: <Widget>[
    //                 Container(
    //                   child: Column(
    //                     children: <Widget>[
    //                       Text(
    //                         'Welcome',
    //                         style: TextStyle(
    //                           fontSize: 30.0,
    //                         ),
    //                         textAlign: TextAlign.left,
    //                       ),
    //                       Text(
    //                         'Back',
    //                         style: TextStyle(fontSize: 30.0),
    //                       ),
    //                       Center(
    //                         child: FlutterLogo(
    //                           size: 250.0,
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //           Padding(
    //             padding: const EdgeInsets.only(left: 40.0, right: 40.0),
    //             child: Column(
    //               mainAxisAlignment: MainAxisAlignment.start,
    //               crossAxisAlignment: CrossAxisAlignment.stretch,
    //               children: <Widget>[
    //                 TextField(
    //                   keyboardAppearance: Brightness.dark,
    //                   keyboardType: TextInputType.emailAddress,
    //                   maxLines: 1,
    //                   decoration: InputDecoration(
    //                       icon: Icon(Icons.person),
    //                       labelText: "Email Address",
    //                       helperText: "Enter a registered email address"),
    //                 ),
    //                 SizedBox(
    //                   height: 20.0,
    //                 ),
    //                 TextField(
    //                   keyboardAppearance: Brightness.dark,
    //                   keyboardType: TextInputType.visiblePassword,
    //                   maxLines: 1,
    //                   decoration: InputDecoration(
    //                     icon: Icon(Icons.lock_open),
    //                     labelText: "Password",
    //                   ),
    //                 ),
    //                 SizedBox(
    //                   height: 20.0,
    //                 ),
    //                 Row(
    //                   crossAxisAlignment: CrossAxisAlignment.center,
    //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                   children: <Widget>[
    //                     Text(
    //                       'Sign In',
    //                       style: TextStyle(
    //                         fontSize: 20.0,
    //                         fontWeight: FontWeight.w600,
    //                       ),
    //                       textAlign: TextAlign.left,
    //                     ),
    //                     FloatingActionButton(
    //                       child: Icon(
    //                         Icons.arrow_forward,
    //                         color: Theme.of(context).cardColor,
    //                       ),
    //                       backgroundColor: Theme.of(context).primaryColor,
    //                       splashColor: Theme.of(context).accentColor,
    //                       elevation: 3.0,
    //                       onPressed: () => Navigator.push(context,
    //                           MaterialPageRoute(builder: (_) => HomeScreen())),
    //                     ),
    //                   ],
    //                 ),
    //               ],
    //             ),
    //           ),
    //           Padding(
    //             padding:
    //                 const EdgeInsets.only(top: 25.0, left: 60.0, right: 50.0),
    //             child: Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               children: <Widget>[
    //                 Text(
    //                   'Sign Up',
    //                   style:
    //                       TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
    //                   textAlign: TextAlign.left,
    //                 ),
    //                 Text(
    //                   'Forgot Password',
    //                   style:
    //                       TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
    //                   textAlign: TextAlign.right,
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
