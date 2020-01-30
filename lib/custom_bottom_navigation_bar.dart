library custom_bottom_navigation_bar;

import 'package:custom_bottom_navigation_bar/custom_bottom_navigation_bar_item.dart';
import 'package:custom_bottom_navigation_bar/custom_bottom_navigation_bar_item_tile.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  CustomBottomNavigationBar({
    @required this.items,
    this.backgroundColor = const Color(0XFF003051),
    this.itemBackgroudnColor = const Color(0XFF003051),
    this.itemOutlineColor = const Color(0XFFFFFFFF),
    this.selectedItemColor = const Color(0XFFFFFFFF),
    this.unselectedItemColor = const Color(0XFFFFFFFF),
    this.onTap,
  })  : assert(items != null),
        assert(items.length > 1 && items.length < 5);

  final List<CustomBottomNavigationBarItem> items;
  final Color backgroundColor;
  final Color itemBackgroudnColor;
  final Color itemOutlineColor;
  final Color selectedItemColor;
  final Color unselectedItemColor;
  final ValueChanged<int> onTap;

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          _buildBackground(),
          _buildItems(),
        ],
      ),
    );
  }

  Widget _buildBackground() {
    return Container(
      width: double.infinity,
      height: 70.0,
      color: widget.backgroundColor,
    );
  }

  Widget _buildItems() {
    return Container(
      height: 102.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: widget.items.map((item) {
          int index = widget.items.indexOf(item);
          return CustomBottomNavigationBarItemTile(
            item,
            widget.selectedItemColor,
            widget.unselectedItemColor,
            widget.itemOutlineColor,
            widget.backgroundColor,
            widget.itemBackgroudnColor,
            index,
            _changeCurrentIndex,
            _currentIndex,
          );
        }).toList(),
      ),
    );
  }

  void _changeCurrentIndex(int index) {
    widget.onTap(index);
    setState(() {
      _currentIndex = index;
    });
  }
}
