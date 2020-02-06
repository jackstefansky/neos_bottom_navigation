/*
Initial development sponsored by Zaynin Pty (Ltd)
*/

import 'package:neos_bottom_navigation/neos_bottom_navigation.dart';
import 'package:neos_bottom_navigation/neos_bottom_navigation_item.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TestScreen(),
    );
  }
}

class TestScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TestScreenState();
  }
}

class TestScreenState extends State<TestScreen> {
  PageController _pageController = PageController();

  //int _setIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _buildBody(),
          _buildNavBar(),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [Colors.red, Colors.green],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
          height: 1000.0,
          width: double.infinity),
    );
  }

  Widget _buildNavBar() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: NeosBottomNavigation(
        //setIndex: _setIndex,
        items: [
          NeosBottomNavigationItem(
            icon: Icon(Icons.map),
            title: "Map",
          ),
          NeosBottomNavigationItem(
            icon: Icon(
              Icons.near_me,
            ),
            title: "Directions",
          ),
          NeosBottomNavigationItem(
            icon: Icon(Icons.settings),
            title: "Settings",
          ),
        ],
        onTap: (index) {
          _pageController.animateToPage(index,
              curve: Curves.fastLinearToSlowEaseIn,
              duration: Duration(milliseconds: 600));
        },
      ),
    );
  }

  /*
  void _changeIndexPlus() {
    setState(() {
      _setIndex++;
    });
  }

  void _changeIndexMinus() {
    setState(() {
      _setIndex--;
    });
  }
  */
}
