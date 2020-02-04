import 'package:erik/theme/colors.dart';
import 'package:erik/views/widgets/bottom/bottom_navigation.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      bottomNavigationBar: BottomNav(),
      body: Container(
        height: 200.0,
        child: Center(child: Text('Search Screen')),
      ),
    );
  }
}