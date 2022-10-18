import 'package:flutter/material.dart';
class MyBottomBar extends StatefulWidget {
  Color color;
  Widget child;
  MyBottomBar({this.color=Colors.black12,this.child})
  @override
  State<MyBottomBar> createState() => _MyBottomBarState();
}

class _MyBottomBarState extends State<MyBottomBar> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
