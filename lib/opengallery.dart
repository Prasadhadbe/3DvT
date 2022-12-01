import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_code_tools/qr_code_tools.dart';
import 'package:rxdart/rxdart.dart';

class Opengallery extends StatefulWidget {
  const Opengallery({Key key}) : super(key: key);

  @override
  _OpengalleryState createState() => _OpengalleryState();
}

class _OpengalleryState extends State<Opengallery> {
  String _qrcodeFile = '';
  String _data = '';
  @override
  void initState() {
    super.initState();
    String filename = '1559788943.png';
    Stream.fromFuture(getTemporaryDirectory())
        .flatMap((tempDir) {
          File qrCodeFile = File('${tempDir.path}/$filename');
          bool exists = qrCodeFile.existsSync();
          if (exists) {
            return Stream.value(qrCodeFile);
          } else {
            return Stream.fromFuture(rootBundle.load("images/$filename"))
                .flatMap((bytes) => Stream.fromFuture(qrCodeFile.writeAsBytes(
                    bytes.buffer.asUint8List(
                        bytes.offsetInBytes, bytes.lengthInBytes))));
          }
        })
        .flatMap((file) =>
            Stream.fromFuture(QrCodeToolsPlugin.decodeFrom(file.path)))
        .listen((data) {
          setState(() {
            _data = data;
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Code Read Gallery'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            _qrcodeFile.isEmpty
                ? Image.asset(
                    'images/1559788943.png',
                  )
                : Image.file(File(_qrcodeFile)),
            RaisedButton(
              child: Text("Select file"),
              onPressed: _getPhotoByGallery,
            ),
            Text('Qr Code data: $_data\n'),
          ],
        ),
      ),
    );
  }

  void _getPhotoByGallery() {
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
      print('${error.toString()}');
    });
  }
}
