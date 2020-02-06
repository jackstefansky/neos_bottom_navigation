/*
Initial development sponsored by Zaynin Pty (Ltd)
*/

import 'package:neos_bottom_navigation/neos_bottom_navigation_item_tile.dart';
import 'package:neos_bottom_navigation/neos_bottom_navigation_item.dart';
import 'package:flutter/material.dart';

class NeosBottomNavigation extends StatefulWidget {
  NeosBottomNavigation({
    @required this.items,
    this.backgroundColor = const Color(0XFF003051),
    this.itemBackgroudnColor = const Color(0XFF003051),
    this.itemOutlineColor = const Color(0XFFFFFFFF),
    this.selectedItemColor = const Color(0XFFFFFFFF),
    this.unselectedItemColor = const Color(0XFFFFFFFF),
    this.onTap,
    this.setIndex,
  })  : assert(items != null),
        assert(items.length > 1 && items.length < 5);

  final List<NeosBottomNavigationItem> items;
  final Color backgroundColor;
  final Color itemBackgroudnColor;
  final Color itemOutlineColor;
  final Color selectedItemColor;
  final Color unselectedItemColor;
  final ValueChanged<int> onTap;
  final int setIndex;
  @override
  _NeosBottomNavigationState createState() => _NeosBottomNavigationState();
}

class _NeosBottomNavigationState extends State<NeosBottomNavigation> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
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
      color: widget.backgroundColor,
      child: Container(
        width: double.infinity,
        height: 70.0 + MediaQuery.of(context).padding.bottom,
        color: widget.backgroundColor,
      ),
    );
  }

  Widget _buildItems() {
    return SafeArea(
      top: false,
      child: Container(
        height: 102.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: widget.items.map((item) {
            int index = widget.items.indexOf(item);
            return NeosBottomNavigationItemTile(
              item,
              widget.selectedItemColor,
              widget.unselectedItemColor,
              widget.itemOutlineColor,
              widget.backgroundColor,
              widget.itemBackgroudnColor,
              index,
              widget.setIndex != null ? null : _changeCurrentIndex,
              widget.setIndex != null ? widget.setIndex : _currentIndex,
            );
          }).toList(),
        ),
      ),
    );
  }

  void _changeCurrentIndex(int index) {
    setState(() {
      _currentIndex = index;
    });

    widget.onTap(_currentIndex);
  }
}
