import 'package:erik/views/widgets/hotel_carousel.dart';
import 'package:erik/views/widgets/places_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:erik/theme/colors.dart' as theme;
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  int _currentTab = 0;

  List<IconData> _icons = [
    Ionicons.ios_airplane,
    Ionicons.ios_bed,
    Ionicons.ios_wine,
    Icons.local_pizza,
    Feather.film,
  ];

  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
        print(_selectedIndex);
      },
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          color: _selectedIndex == index
              ? Theme.of(context).accentColor
              : Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Icon(
          _icons[index],
          size: 25.0,
          color: _selectedIndex == index
              ? Theme.of(context).primaryColor
              : theme.foregroundColor,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(
            vertical: 30.0,
          ),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                left: 20.0,
                right: 120.0,
              ),
              child: Text(
                'What would you like to find?',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: theme.heading,
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _icons
                  .asMap()
                  .entries
                  .map(
                    (MapEntry map) => _buildIcon(map.key),
                  )
                  .toList(),
            ),
            SizedBox(
              height: 20.0,
            ),
            PlacesCarousel(),
            SizedBox(
              height: 20.0,
            ),
            HotelCarousel(),
          ],
        ),
      ),
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
            // icon: CircleAvatar(
            //   radius: 25.0,
            //   backgroundImage: NetworkImage(
            //       'https://lh5.googleusercontent.com/-J37h4JheLnw/AAAAAAAAAAI/AAAAAAAAAQY/omswTpA7HQU/photo.jpg'),
            // ),
            title: Text(
              'Profile',
              style: GoogleFonts.varelaRound(),
            ),
          ),
        ],
      ),
    );
  }
}
