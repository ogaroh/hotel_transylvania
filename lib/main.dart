import 'package:erik/views/auth/login.dart';
import 'package:erik/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:erik/theme/colors.dart' as theme;
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 1;
  final List<Widget> _pages = [HomeScreen(), LoginPage()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FireFly',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: theme.primaryColor,
        accentColor: theme.accentColor,
        backgroundColor: theme.backgroundColor,
        scaffoldBackgroundColor: theme.scaffoldBackgroundColor,
        textTheme: GoogleFonts.varelaRoundTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: _pages[_selectedIndex],
    );
  }
}
