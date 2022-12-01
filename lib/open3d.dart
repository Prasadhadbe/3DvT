import 'package:finalyr/panorama.dart';
import 'package:flutter/material.dart';
import 'package:model_viewer/model_viewer.dart';
import 'package:panorama/panorama.dart';

// ignore: must_be_immutable
class Open3d extends StatefulWidget {
  // ignore: non_constant_identifier_names
  String Ltitle;
  // ignore: non_constant_identifier_names
  int Lindex;

  Open3d(this.Ltitle, this.Lindex);

  @override
  _Open3dState createState() => _Open3dState();
}

class _Open3dState extends State<Open3d> {
  List link = [
    'assets/3Dmodels/Building.glb',
    'assets/3Dmodels/Cafeteria.glb',
    'assets/3Dmodels/Classroom.glb',
    'assets/3Dmodels/Computer.glb',
    'assets/3Dmodels/Sports.glb',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey,
        child: const Text(
          '360\u00b0',
          style: TextStyle(fontSize: 12),
          textAlign: TextAlign.center,
        ),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => panorama(widget.Lindex),
            ),
          );
        },
      ),
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          widget.Ltitle,
          style: const TextStyle(fontSize: 15),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: ModelViewer(
        backgroundColor: Colors.grey[200],
        src: link[widget.Lindex],
        alt: '3d',
        //ar: true,
        autoRotate: true,
        cameraControls: true,
      ),
    );
  }
}
