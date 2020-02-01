/*
Initial development sponsored by Zaynin Pty (Ltd)
*/

import 'package:custom_bottom_navigation_bar/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:custom_bottom_navigation_bar/custom_bottom_navigation_bar_item.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          Center(
            child: Icon(
              Icons.map,
              color: Color(0XFF003051),
            ),
          ),
          Center(
            child: Icon(
              Icons.near_me,
              color: Color(0XFF003051),
            ),
          ),
          Center(
            child: Icon(
              Icons.shopping_cart,
              color: Color(0XFF003051),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        items: [
          CustomBottomNavigationBarItem(
            icon: Icon(Icons.map),
            title: "Map",
          ),
          CustomBottomNavigationBarItem(
            icon: Icon(Icons.near_me),
            title: "Directions",
          ),
          CustomBottomNavigationBarItem(
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
}
