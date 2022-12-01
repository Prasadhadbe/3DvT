import 'package:panorama/panorama.dart';
import 'package:flutter/material.dart';

class panorama extends StatelessWidget {
  int index;
  panorama(this.index);

  List images = [
    'assets/images/Building.jpg',
    'assets/images/Cafeteria.jpg',
    'assets/images/Classroom.jpg',
    'assets/images/Computer.jpg',
    'assets/images/Sports.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Panorama(
          sensitivity: 2,
          child: Image.asset(images[index]),
        ),
      ),
    );
  }
}
