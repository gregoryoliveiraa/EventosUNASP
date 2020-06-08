import 'package:flutter/material.dart';
import 'dart:async';
import 'package:qrcode_reader/qrcode_reader.dart';

class Chamada extends StatefulWidget {
  @override
  _ChamadaState createState() => _ChamadaState();
}

class _ChamadaState extends State<Chamada> {
  // String scanResult = '';
  Future<String> barcodeString;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true, 
          title: Text('Leitor Qr Code'.toUpperCase())),
      body: Center(
        child: FutureBuilder<String>(
          future: barcodeString,
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            //return Text(snapshot.data != null ? snapshot.data : '');
            return Container(
              child: Text(snapshot.data ?? '', style: TextStyle(fontSize: 26))
            );
          }
        )
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 125),
        child: FloatingActionButton.extended(          
          tooltip: 'Acionar Câmera Leitor QRCode',
          label: Text('Scan', style: TextStyle(fontSize: 20, color: Colors.grey[100], height: 2,)),
            icon: Icon(Icons.add_a_photo, size: 30),
          onPressed: () {
            setState(() {
              barcodeString = QRCodeReader()
                  .setAutoFocusIntervalInMs(200)
                  .setForceAutoFocus(true)
                  .setTorchEnabled(true)
                  .setHandlePermissions(true)
                  .setExecuteAfterPermissionGranted(true)
                  .scan;                  
            });
          },
        ),
      ),
    );
  }
  
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

// Future get scanQRCode async {
//   final cameraScanResult = await scanner.scan();
//   setState(() {
//     scanResult = cameraScanResult;
//   });
// }

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
