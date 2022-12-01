import 'package:flutter/material.dart';

class ViewonMaps extends StatefulWidget {
  @override
  _Viewin3dState createState() => _Viewin3dState();
}

class _Viewin3dState extends State<ViewonMaps> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text(
          'View on Maps',
          style: TextStyle(fontSize: 15),
        ),
        centerTitle: true,
      ),
      body: Container(),
    );
  }
}
