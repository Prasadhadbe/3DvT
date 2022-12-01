//import 'package:finalyr/FIREBASE.dart';
import 'package:flutter/material.dart';
import 'arc.dart';
import 'scanqrcode.dart';
import 'package:url_launcher/url_launcher.dart';

String testForTerminal = '@@@@@@@@@@@@@@@@@@@@@@@@@';

class Homescreen extends StatefulWidget {
  const Homescreen({Key key}) : super(key: key);

  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  bool hasdata = true;
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      const MyArc(),
      Container(
        padding: const EdgeInsets.only(top: 80),
        child: const Text(
          '3DvT a Virtual touring Technology \n that provides a visual representaion of a \nlocation.',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey, fontSize: 10),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 150.0, bottom: 8.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2.5,
                  color: Colors.grey,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              width: 300,
              height: 50,
              child: FloatingActionButton(
                backgroundColor: Colors.transparent,
                elevation: 0,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const Qrcode(),
                    ),
                  );
                },
                child: const Text(
                  'Scan QR Code',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2.5,
                    color: Colors.grey,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                width: 300,
                height: 50,
                child: FloatingActionButton(
                  backgroundColor: Colors.transparent,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  elevation: 0,
                  onPressed: hasdata
                      ? () async {
                          if (await canLaunch("https://www.google.com/maps")) {
                            await launch("https://www.google.com/maps");
                          } else {
                            throw 'Could not launch ';
                          }
                        }
                      : null,
                  child: const Text(
                    'Open Maps',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(top: 10.0),
            //   child: Container(
            //     decoration: BoxDecoration(
            //       border: Border.all(
            //         width: 2.5,
            //         color: Colors.yellow,
            //       ),
            //       borderRadius: const BorderRadius.all(
            //         Radius.circular(10.0),
            //       ),
            //     ),
            //     width: 300,
            //     height: 50,
            //     child: FloatingActionButton(
            //       backgroundColor: Colors.blue,
            //       shape: const RoundedRectangleBorder(
            //         borderRadius: BorderRadius.all(
            //           Radius.circular(10.0),
            //         ),
            //       ),
            //       elevation: 0,
            //       onPressed: () {
            //         Navigator.of(context).push(
            //           MaterialPageRoute(
            //             builder: (context) => const Firebase(),
            //           ),
            //         );
            //       },
            //       child: const Text(
            //         'FIREBASE STORAGE (FOR ADMIN)',
            //         style: TextStyle(color: Colors.yellow, fontSize: 12),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      )
    ]);
  }
}
