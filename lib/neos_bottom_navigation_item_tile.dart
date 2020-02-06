/*
Initial development sponsored by Zaynin Pty (Ltd)
*/

import 'package:neos_bottom_navigation/neos_bottom_navigation_item.dart';
import 'package:flutter/material.dart';

class NeosBottomNavigationItemTile extends StatefulWidget {
  NeosBottomNavigationItemTile(
      this.item,
      this.selectedItemColor,
      this.unselectedItemColor,
      this.itemOutlineColor,
      this.backgroundColor,
      this.itemBackgroudnColor,
      this.index,
      this.onChanged,
      this.currentIndex);

  final NeosBottomNavigationItem item;
  final Color selectedItemColor;
  final Color unselectedItemColor;
  final Color itemOutlineColor;
  final Color backgroundColor;
  final Color itemBackgroudnColor;

  final int index;
  final ValueChanged<int> onChanged;

  final int currentIndex;
  @override
  _NeosBottomNavigationItemTileState createState() =>
      _NeosBottomNavigationItemTileState();
}

class _NeosBottomNavigationItemTileState
    extends State<NeosBottomNavigationItemTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: selectItem,
      child: Container(
        height: 120.0,
        width: 70.0,
        child: _buildItem(),
      ),
    );
  }

  Widget _buildItem() {
    Widget icon;

    icon = Container(
      padding: EdgeInsets.all(15.0),
      child: Icon(widget.item.icon.icon,
          size: widget.item.icon.size,
          color: widget.currentIndex == widget.index
              ? widget.selectedItemColor
              : widget.unselectedItemColor),
    );

    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(bottom: 4.0),
          child: AnimatedAlign(
            curve: Curves.easeOutCirc,
            duration: Duration(milliseconds: 300),
            alignment: widget.currentIndex == widget.index
                ? Alignment.topCenter
                : Alignment.bottomCenter,
            child: AnimatedContainer(
                //padding: EdgeInsets.all(15.0),
                curve: Curves.easeOut,
                duration: Duration(milliseconds: 300),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(100.0),
                  ),
                  color: widget.currentIndex == widget.index
                      ? widget.itemBackgroudnColor
                      : widget.backgroundColor,
                  border: Border.all(
                      color: widget.currentIndex == widget.index
                          ? widget.itemOutlineColor
                          : widget.itemOutlineColor.withOpacity(0.0),
                      width: 3.5),
                ),
                child: icon),
          ),
        ),
        AnimatedOpacity(
          opacity: widget.currentIndex == widget.index ? 1.0 : 0.0,
          duration: Duration(milliseconds: 150),
          curve: Curves.easeInOut,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: 12.0),
              width: 70.0,
              child: Text(
                widget.item.title,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void selectItem() {
    if (widget.onChanged != null) widget.onChanged(widget.index);
  }
}
