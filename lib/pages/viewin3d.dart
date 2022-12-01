import 'package:flutter/material.dart';
import 'package:model_viewer/model_viewer.dart';

import '../open3d.dart';

class Viewin3d extends StatefulWidget {
  @override
  _Viewin3dState createState() => _Viewin3dState();
}

class _Viewin3dState extends State<Viewin3d> {
  List names = [
    'BUILDING',
    'CAFETERIA',
    'CLASSROOM',
    'COMPUTER SETUP',
    'SPORTS-AREA',
  ];
  List imges = [
    'https://picsum.photos/id/1076/500/300',
    'https://picsum.photos/id/1080/900/300',
    'https://picsum.photos/id/1073/500/300',
    'https://picsum.photos/id/1/900/300',
    'https://picsum.photos/id/1058/900/300',
    'https://picsum.photos/id/1076/500/300',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text(
          'View in 3D',
          style: TextStyle(fontSize: 15),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (builder) => Open3d(names[index], index),
                ),
              );
            },
            child: Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              color: Colors.white,
              child: SizedBox(
                height: 150,
                child: Stack(
                  children: [
                    Stack(children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(imges[index]),
                          ),
                        ),
                        height: 350.0,
                      ),
                      Container(
                        height: 350.0,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            gradient: LinearGradient(
                                begin: FractionalOffset.bottomRight,
                                end: FractionalOffset.centerLeft,
                                colors: [
                                  Colors.grey.withOpacity(0.0),
                                  Colors.white,
                                ],
                                stops: const [
                                  0.0,
                                  1.0
                                ])),
                      )
                    ]),
                    Text(
                      names[index],
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[500],
                          letterSpacing: 2),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
