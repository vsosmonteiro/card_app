import 'dart:ffi';

import 'package:flutter/material.dart';

class CardLoadingWidget extends StatefulWidget {
  const CardLoadingWidget({Key? key}) : super(key: key);

  @override
  State<CardLoadingWidget> createState() => _CardLoadingWidgetState();
}

class _CardLoadingWidgetState extends State<CardLoadingWidget> {
  double _gradientPlace = 0.1;

  @override
  void initState() {
    _recursion();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 12, top: 12),
      child: Stack(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 30),
            decoration: BoxDecoration(
                gradient: LinearGradient(stops: [
                  _gradientPlace - 0.2,
                  _gradientPlace,
                  _gradientPlace + 0.05
                ], colors: const [
                  Colors.grey,
                  Colors.white,
                  Colors.grey
                ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                borderRadius: BorderRadius.circular(24)),
            width: 300,
            height: 240,
          ),
        ],
      ),
    );
  }

  void _recursion() {
    Future.delayed(const Duration(milliseconds: 30), () {
      if (this.mounted) {
        setState(
          () {
            if (_gradientPlace <= 0.9) {
              _gradientPlace += 0.02;
            } else {
              _gradientPlace = 0.2;
            }
            _recursion();
          },
        );
      }
    });
  }
}
