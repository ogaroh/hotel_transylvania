import 'package:erik/views/auth/login.dart';
import 'package:erik/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:erik/theme/colors.dart' as theme;
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var token = preferences.getString('token');
  print(token);
  runApp(
    MaterialApp(
      title: 'FireFly',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: theme.primaryColor,
        accentColor: theme.accentColor,
        backgroundColor: theme.backgroundColor,
        scaffoldBackgroundColor: theme.scaffoldBackgroundColor,
        textTheme: GoogleFonts.varelaRoundTextTheme(
        ),
      ),
      home: token == null ? LoginPage() : HomeScreen(),
    )
  );
}

