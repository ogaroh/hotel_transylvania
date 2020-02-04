import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:erik/theme/colors.dart' as theme;
import './login.dart';
import './register.dart';

class DefaultAuth extends StatefulWidget {
  @override
  _DefaultAuthState createState() => _DefaultAuthState();
}

class _DefaultAuthState extends State<DefaultAuth> {
  int _currentTab = 0;
  final List<Widget> _pages = [LoginPage(), RegisterPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentTab],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: theme.cardColor,
        unselectedItemColor: theme.foregroundColor,
        selectedItemColor: theme.heading,
        type: BottomNavigationBarType.shifting,
        currentIndex: _currentTab,
        onTap: (int value) {
          setState(() {
            _currentTab = value;
          });
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => _pages[_currentTab]),
          );
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
      ),
    );
  }
}
