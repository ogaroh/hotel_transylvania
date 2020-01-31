import 'package:erik/models/activity_model.dart';
import 'package:erik/models/destination_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:erik/theme/colors.dart' as theme;
import 'package:google_fonts/google_fonts.dart';

class DestinationScreen extends StatefulWidget {
  final Destination place;

  DestinationScreen({this.place});

  @override
  _DestinationScreenState createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {
  int _currentTab = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(0.0, 2.0),
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: Hero(
                  tag: widget.place.imageUrl,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: Image(
                      image: AssetImage(widget.place.imageUrl),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 40.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Feather.arrow_left,
                        color: theme.cardColor,
                        size: 30.0,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Text(
                      widget.place.city,
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 25.0,
                        letterSpacing: 1.2,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Feather.search,
                            color: theme.cardColor,
                            size: 25.0,
                          ),
                          onPressed: () => {},
                        ),
                        IconButton(
                          icon: Icon(
                            FontAwesome.sort_amount_desc,
                            color: theme.cardColor,
                            size: 25.0,
                          ),
                          onPressed: () => {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 20.0,
                bottom: 15.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.place.city,
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 25.0,
                        letterSpacing: 1.2,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Feather.map_pin,
                          size: 18.0,
                          color: Colors.white70,
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          widget.place.country,
                          style: GoogleFonts.dosis(
                            color: Colors.white70,
                            fontSize: 16.0,
                            letterSpacing: 1.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                right: 20.0,
                bottom: 20.0,
                child: Icon(
                  Feather.camera,
                  size: 23.0,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.place.activities.length,
              itemBuilder: (BuildContext context, int index) {
                Activity activity = widget.place.activities[index];
                return Stack(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(70.0, 5.0, 20.0, 5.0),
                      height: 170.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: theme.cardColor,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(100.0, 20.0, 20.0, 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  width: 100.0,
                                  child: Text(
                                    '${activity.name}',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Text('KES'),
                                    Container(
                                      width: 100.0,
                                      child: Text(
                                        '${activity.price}',
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        overflow: TextOverflow.fade,
                                      ),
                                      alignment: Alignment.centerRight,
                                    ),
                                    Text(
                                      'per pax',
                                      style: TextStyle(
                                        color: theme.descriptionColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Text(
                              activity.type,
                              style: TextStyle(
                                color: theme.descriptionColor,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Icon(
                                  Feather.star,
                                  color: theme.ratings,
                                  size: 15.0,
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Text(
                                  '${activity.rating} Stars',
                                  style: TextStyle(
                                    color: theme.descriptionColor,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              children: <Widget>[
                                Icon(
                                  Feather.watch,
                                  color: theme.foregroundColor,
                                  size: 15.0,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 5.0,
                                    right: 5.0,
                                  ),
                                  child: Container(
                                    width: 80.0,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).accentColor,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Container(
                                        child: Text(
                                          activity.startTimes[0],
                                          overflow: TextOverflow.clip,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Container(
                                  width: 80.0,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).accentColor,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Container(
                                      child: Text(
                                        activity.startTimes[1],
                                        overflow: TextOverflow.clip,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
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
