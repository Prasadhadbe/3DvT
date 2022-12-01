import 'package:finalyr/FIREBASE.dart';
import 'package:finalyr/model/firebase_file.dart';
import 'package:flutter/material.dart';
import 'package:model_viewer/model_viewer.dart';

class Modelview extends StatelessWidget {
  String file;

  Modelview(this.file);

  @override
  Widget build(BuildContext context) {
    print('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@' + file);
    return ModelViewer(
      backgroundColor: Color.fromARGB(0xFF, 0xEE, 0xEE, 0xEE),
      src: file,
      alt: "A 3D model of an astronaut",
      ar: true,
      autoRotate: true,
      cameraControls: true,
    );
  }
}
