import 'package:finalyr/pages/viewimages.dart';
import 'package:finalyr/pages/viewin3d.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'open3d.dart';

// ignore: must_be_immutable
class Options extends StatelessWidget {
  String nero2;
  // ignore: use_key_in_widget_constructors
  Options(this.nero2);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          '3DvT',
          style: TextStyle(fontSize: 15),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 40.0, left: 20),
        child: ListView(
          children: [
            RichText(
              text: TextSpan(
                text: 'How would you like to view \n',
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 25,
                ),
                children: [
                  TextSpan(
                      text: nero2,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (builder) => Viewin3d(),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.only(top: 80),
                alignment: Alignment.topLeft,
                child: const Text(
                  'View in 3D',
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                ),
              ),
            ),
            TextButton(
              onPressed: () async {
                if (await canLaunch(
                    "https://www.google.com/search?q=vishwakarma+university&tbm=isch&ved=2ahUKEwiDyNXCuu_0AhU1_zgGHZQlDpIQ2-cCegQIABAA&oq=vishwakarma+uni&gs_lcp=CgNpbWcQARgAMgUIABCABDIFCAAQgAQyBQgAEIAEMgUIABCABDIFCAAQgAQyBQgAEIAEMgUIABCABDIFCAAQgAQyBQgAEIAEMgUIABCABDoHCCMQ7wMQJzoHCAAQsQMQQzoECAAQQzoICAAQgAQQsQM6CwgAEIAEELEDEIMBOgoIABCxAxCDARBDUO4BWPMWYIweaABwAHgAgAGAAYgBxw-SAQQwLjE3mAEAoAEBqgELZ3dzLXdpei1pbWfAAQE&sclient=img&ei=3u6-YYPhCbX-4-EPlMu4kAk&bih=775&biw=1600&client=firefox-b-d")) {
                  await launch(
                      "https://www.google.com/search?q=vishwakarma+university&tbm=isch&ved=2ahUKEwiDyNXCuu_0AhU1_zgGHZQlDpIQ2-cCegQIABAA&oq=vishwakarma+uni&gs_lcp=CgNpbWcQARgAMgUIABCABDIFCAAQgAQyBQgAEIAEMgUIABCABDIFCAAQgAQyBQgAEIAEMgUIABCABDIFCAAQgAQyBQgAEIAEMgUIABCABDoHCCMQ7wMQJzoHCAAQsQMQQzoECAAQQzoICAAQgAQQsQM6CwgAEIAEELEDEIMBOgoIABCxAxCDARBDUO4BWPMWYIweaABwAHgAgAGAAYgBxw-SAQQwLjE3mAEAoAEBqgELZ3dzLXdpei1pbWfAAQE&sclient=img&ei=3u6-YYPhCbX-4-EPlMu4kAk&bih=775&biw=1600&client=firefox-b-d");
                } else {
                  throw 'Could not launch ';
                }
              },
              child: Container(
                padding: const EdgeInsets.only(top: 80),
                alignment: Alignment.topLeft,
                child: const Text(
                  'View Images',
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                ),
              ),
            ),
            TextButton(
              onPressed: () async {
                if (await canLaunch(
                    "https://www.google.com/maps/place/Vishwakarma+University/@18.4603081,73.8813942,17z/data=!3m1!4b1!4m5!3m4!1s0x3bc2eaf42e26fa71:0x2a9a1928beae9eec!8m2!3d18.460303!4d73.8835829")) {
                  await launch(
                      "https://www.google.com/maps/place/Vishwakarma+University/@18.4603081,73.8813942,17z/data=!3m1!4b1!4m5!3m4!1s0x3bc2eaf42e26fa71:0x2a9a1928beae9eec!8m2!3d18.460303!4d73.8835829");
                } else {
                  throw 'Could not launch ';
                }
              },
              child: Container(
                padding: const EdgeInsets.only(top: 80),
                alignment: Alignment.topLeft,
                child: const Text(
                  'View on Maps',
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
