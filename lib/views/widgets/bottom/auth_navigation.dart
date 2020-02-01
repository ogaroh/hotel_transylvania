import 'package:erik/views/auth/login.dart';
import 'package:erik/views/auth/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:erik/theme/colors.dart' as theme;

import '../../home_screen.dart';

class AuthNav extends StatefulWidget {
  @override
  _AuthNavState createState() => _AuthNavState();
}

class _AuthNavState extends State<AuthNav> {
  int _currentTab = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: theme.cardColor,
      unselectedItemColor: theme.foregroundColor,
      selectedItemColor: theme.heading,
      type: BottomNavigationBarType.shifting,
      currentIndex: _currentTab,
      onTap: (int value) {
        setState(() {
          _currentTab = value;
          if (value == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LoginPage(),
              ),
            );
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RegisterPage(),
              ),
            );
          }
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Feather.user_check,
            size: 25.0,
          ),
          title: Text('Sign In', style: GoogleFonts.varelaRound()),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Feather.user_plus,
            size: 25.0,
          ),
          title: Text(
            'Sign Up',
            style: GoogleFonts.varelaRound(),
          ),
        ),
      ],
    );
  }
}
