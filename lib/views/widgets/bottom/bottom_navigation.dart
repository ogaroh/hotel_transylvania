import 'package:erik/views/auth/default.dart';
import 'package:erik/views/auth/login.dart';
import 'package:erik/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:erik/theme/colors.dart' as theme;

class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
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
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Feather.home,
            size: 25.0,
          ),
          title: Text('Home', style: GoogleFonts.varelaRound()),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Feather.search,
            size: 25.0,
          ),
          title: Text('Search', style: GoogleFonts.varelaRound()),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Feather.navigation,
            size: 25.0,
          ),
          title: Text('Nearby', style: GoogleFonts.varelaRound()),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Feather.users,
            size: 25.0,
          ),
          title: Text(
            'Profile',
            style: GoogleFonts.varelaRound(),
          ),
        ),
      ],
    );
  }
}
