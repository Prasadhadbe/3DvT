import 'package:finalyr/homescreen.dart';
import 'package:finalyr/open3d.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qr_code_tools/qr_code_tools.dart';
import 'package:rxdart/rxdart.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'options.dart';

class Qrcode extends StatefulWidget {
  const Qrcode({Key key}) : super(key: key);

  @override
  _QrcodeState createState() => _QrcodeState();
}

class _QrcodeState extends State<Qrcode> {
  String qrData = "No data found!";
  bool hasdata = false;
  String _qrcodeFile = '';
  String _data = 'unknown';
  String qrCode = 'Unknown';
  final snackBar = const SnackBar(content: Text('Scan a valid QR Code'));
  String _scanBarcode = 'Null/Null/Null';

  nero2() {
    if (_scanBarcode == '-1') {
      String nero = 'Null/Null/Null';
      var nero3 = nero.split(RegExp("/"));
      return nero3[2];
    } else {
      String nero = _scanBarcode;
      var nero3 = nero.split(RegExp("/"));
      if (nero3[2] == 'www.vupune.ac.in') {
        nero3[2] = 'Vishwakarma University';
      }
      return nero3[2];
    }
  }

  @override
  void initState() {
    super.initState();
  }

  Future<void> startBarcodeScanStream() async {
    FlutterBarcodeScanner.getBarcodeStreamReceiver(
            '#ff6666', 'Cancel', true, ScanMode.BARCODE)
        .listen((barcode) => print(barcode));
  }

  Future<void> scanQR() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      // ignore: avoid_print
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = null;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
      hasdata = true;
    });
  }

  CheckqrCode() {
    if (nero2() == 'Vishwakarma University') {
      modalbottomsheet();
    } else {
      return ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  modalbottomsheet() {
    showModalBottomSheet(
      barrierColor: const Color.fromRGBO(128, 128, 128, 0.5),
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      context: context,
      builder: (context) => Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (builder) => Options(nero2()),
                      ),
                    );
                  },
                  child: const Text(
                    'Proceed',
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  )),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              padding: const EdgeInsets.all(40),
              child: const Text(
                'Proceed to experience the world of \n3DvT',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 10),
              ),
              height: 200,
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              padding: const EdgeInsets.all(40),
              child: const Text(
                '3DvT',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 15),
              ),
              height: 200,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Scan Qr Code',
          style: TextStyle(fontSize: 15),
        ),
      ),
      body: ListView(
        children: [
          const Center(
            heightFactor: 3,
            child: Text(
              'Every Location associated with 3DvT is assigned \n a QR code to scan for the users, \n Ask for the QR code and scan it here \nor \n choose one from your gallery',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey, fontSize: 10),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                nero2(),
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 15, color: Colors.grey),
              ),
              IconButton(
                icon: const Icon(Icons.launch_outlined),
                onPressed: hasdata
                    ? () async {
                        if (await canLaunch(_scanBarcode)) {
                          await launch(_scanBarcode);
                        } else {
                          throw 'Could not launch ';
                        }
                      }
                    : null,
              ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.navigate_next_outlined),
            onPressed: CheckqrCode,
          ),
          Center(
            heightFactor: 4,
            child: Column(
              children: [
                Container(
                  width: 300,
                  height: 50,
                  child: FloatingActionButton(
                    backgroundColor: Colors.orange,
                    elevation: 0,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    onPressed: () {
                      scanQR();
                    },
                    child: const Text(
                      'Scan QR Code',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 300,
                  height: 50,
                  child: FloatingActionButton(
                    backgroundColor: Colors.orange,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    elevation: 0,
                    onPressed: () {
                      getPhotoByGallery();
                    },
                    child: const Text(
                      'Open Gallery',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void getPhotoByGallery() {
    final ImagePicker _picker = ImagePicker();

    Stream.fromFuture(_picker.pickImage(source: ImageSource.gallery))
        .flatMap((file) {
      setState(() {
        _qrcodeFile = file.path;
      });
      return Stream.fromFuture(QrCodeToolsPlugin.decodeFrom(file.path));
    }).listen((data) {
      setState(() {
        _data = data;
      });
    }).onError((error, stackTrace) {
      setState(() {
        _data = '';
      });
    });
  }
}
