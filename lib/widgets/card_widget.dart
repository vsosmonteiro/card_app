import 'package:flutter/material.dart';

class CardWidget extends StatefulWidget {
  final String number;
  final String name;
  final String expiration;
  const CardWidget({super.key, required this.name,required this.number,required this.expiration});


  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 12, top: 12),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.purple.shade600, Colors.blue.shade900],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight),
                borderRadius: BorderRadius.circular(24)),
            width: 300,
            height: 240,
          ),
          const Positioned(
            top: 16,
            left: 16,
            child: Text(
              'Visa',
              style: TextStyle(color: Colors.white, fontSize: 28),
            ),
          ),
           Positioned(
            right: 20,
            top: 24,
            child: Text(
              widget.number,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
           Positioned(
            bottom: 60,
            left: 20,
            child: Text(
              widget.name,
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
           Positioned(
              left: 24,
              bottom: 24,
              child: Text(
                widget.expiration,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ))
        ],
      ),
    );
  }
}
