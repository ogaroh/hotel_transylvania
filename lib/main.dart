import 'package:erik/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:erik/theme/colors.dart' as theme;
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Erik Travel',
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
      home: HomeScreen(),
    );
  }
}
