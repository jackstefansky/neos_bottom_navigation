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
      body: Column(
        children: <Widget>[
          /*RaisedButton(
            onPressed: _changeIndexMinus,
            child: Text("<"),
          ),
          RaisedButton(
            onPressed: _changeIndexPlus,
            child: Text(">"),
          ),*/
          Expanded(
            child: PageView(
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
          )
        ],
      ),
      bottomNavigationBar: NeosBottomNavigation(
        //setIndex: _setIndex,
        items: [
          NeosBottomNavigationItem(
            icon: Icon(Icons.map),
            title: "Map",
          ),
          NeosBottomNavigationItem(
            icon: Icon(Icons.near_me),
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
