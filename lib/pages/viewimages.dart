import 'package:flutter/material.dart';

class ViewImages extends StatefulWidget {
  @override
  _Viewin3dState createState() => _Viewin3dState();
}

class _Viewin3dState extends State<ViewImages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text(
          'View Images',
          style: TextStyle(fontSize: 15),
        ),
        centerTitle: true,
      ),
      body: Container(),
    );
  }
}
