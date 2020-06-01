// //import 'package:barcode_scan/barcode_scan.dart';
// import 'package:flutter/material.dart';



// class ScanScreen extends StatefulWidget {
//   @override
//   _ScanState createState() => _ScanState();
// }

// class _ScanState extends State<ScanScreen> {
//   String barcode = '';

//   @override
 
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('QR Code Scanner'),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: <Widget>[
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//                 child: RaisedButton(
//                     color: Colors.blue,
//                     textColor: Colors.white,
//                     splashColor: Colors.blueGrey,
//                     onPressed: (){},
//                     child: const Text('START CAMERA SCAN')
//                 ),
//               )
//               ,
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//                 child: Text(barcode, textAlign: TextAlign.center,),
//               )
//               ,
//             ],
//           ),
//         ));
//   }

//   // Future scan() async {
//   //   try {
//   //     ScanResult barcode = await BarcodeScanner.scan();
//   //     setState(() => this.barcode = barcode as String);
//   //   } on PlatformException catch (e) {
//   //     if (e.code == BarcodeScanner.cameraAccessDenied) {
//   //       setState(() {
//   //         barcode = 'The user did not grant the camera permission!';
//   //       });
//   //     } else {
//   //       setState(() => barcode = 'Unknown error: $e');
//   //     }
//   //   } on FormatException{
//   //     setState(() => barcode = 'null (User returned using the "back"-button before scanning anything. Result)');
//   //   } catch (e) {
//   //     setState(() => barcode = 'Unknown error: $e');
//   //   }
//   // }
// }