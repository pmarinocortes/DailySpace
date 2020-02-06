import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:space_nasa/presentation/marsrover/mars_rover_photos.dart';
import 'package:space_nasa/presentation/astronomypicofday/astronomy_pic_of_day_screen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [AstronomyPicOfDayScreen(), MarsRoverPhotos()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Nasa Daily"),
      ),
      body: IndexedStack(
        children: <Widget>[_children[_currentIndex]],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: new SvgPicture.asset(
                "assets/ic_camera_outline.svg",
                width: 24.0,
                height: 24.0,
              ),
              activeIcon: SvgPicture.asset(
                "assets/ic_camera_filled.svg",
                width: 24.0,
                height: 24.0,
              ),
              title: Text(""),
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.airplanemode_active), title: Text(""))
        ],
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}