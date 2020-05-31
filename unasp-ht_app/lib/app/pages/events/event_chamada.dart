import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'dart:async';
//import 'package:majascan/majascan.dart';

class Chamada extends StatefulWidget {
  @override
  _ChamadaState createState() => _ChamadaState();
}

class _ChamadaState extends State<Chamada> {
  String scanResult = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Leitor Qr Code'.toUpperCase())),
      body: Column(
        //crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          scanResult == ''
              ? Text('Result will be displayed here')
              : Text(scanResult),
          RaisedButton(
            color: Colors.deepOrange,
            child: Text('Scanner'),
            onPressed: () => scanQRCode,
          ),
          Text(
            scanResult,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  // Future scanQRCode() async {
  //   try {
  //     String qrResult = await MajaScan.startScan(
  //         title: 'QRcode scanner',
  //         titleColor: Colors.amberAccent[700],
  //         qRCornerColor: Colors.orange,
  //         qRScannerColor: Colors.orange);
  //     setState(() {
  //       scanResult = qrResult;
  //     });
  //   } on PlatformException catch (ex) {
  //     if (ex.code == MajaScan.CameraAccessDenied) {
  //       setState(() {
  //         scanResult = 'Camera permission was denied';
  //       });
  //     } else {
  //       setState(() {
  //         scanResult = 'Unknown Error $ex';
  //       });
  //     }
  //   } on FormatException {
  //     setState(() {
  //       scanResult = 'You pressed the back button before scanning anything';
  //     });
  //   } catch (ex) {
  //     setState(() {
  //       scanResult = 'Unknown Error $ex';
  //     });
  //   }
  // }

  Future get scanQRCode async {
    final cameraScanResult = await scanner.scan();
    setState(() {
      scanResult = cameraScanResult;
    });
  }

  // Future scanQrCode() async {
  //   try {
  //     final result = await BarcodeScanner.scan();

  //     setState(() {
  //       code = result as String;
  //     });
  //   } catch (e) {
  //     print(e);
  //   }
  // }

}
