// import 'package:barcode_scan/barcode_scan.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'dart:async';

// import 'package:qrcode_reader/qrcode_reader.dart';

// class Chamada extends StatefulWidget {
//   @override
//   _ChamadaState createState() => _ChamadaState();
// }

// class _ChamadaState extends State<Chamada> {
//   String barcode = '';
//   final SnackBar = QRCodeReader;
//   //final snackBar = SnackBar(content: Text('Copiando'));
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     var container = Container(
//       padding: const EdgeInsets.all(30),
//       child: Column(
//         children: <Widget>[
//           IconButton(
//             icon: Icon(const IconData(0xe8fc, fontFamily: 'MaterialIcons')),
//             tooltip: 'Ler código',
//             iconSize: 50,
//             onPressed: () {
//               scan();
//               print(ScanResult);
//             },
//           ),
//           TextField(
//             controller: TextEditingController.fromValue(
//                 TextEditingValue(text: barcode)),
//             style: Theme.of(context).textTheme.subtitle1,
//             decoration: InputDecoration(
//               hintText: '',
//               labelText: 'QRcode',
//               labelStyle: Theme.of(context).textTheme.headline5,
//               contentPadding: EdgeInsets.all(8.0),
//             ),
//           ),
//           Divider(),
//           SizedBox(height: 30),

//           Container(
//             width: 330.0,
//             height: 40.0,
//             child: RaisedButton(
//               color: Colors.orangeAccent,
//               child: Text('Copiar'),
//               onPressed: () {
//                 Clipboard.setData(ClipboardData(text: barcode));
//                 // _scaffoldKey.currentState.showSnackBar(snackBar);
//                 print(ScanResult);
//               },
//             ),
//           ),
//           SizedBox(height: 20),

//           //  Padding(
//           //   padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//           //   child: Linkify(
//           //     onOpen: (link) async {
//           //       if (await canLaunch(link.url)) {
//           //         await launch(link.url);
//           //       } else {
//           //         throw 'Could not launch $link';
//           //       }
//           //     },
//           //     text: _barcode,
//           //     style: TextStyle(color: Colors.yellow),
//           //     linkStyle: TextStyle(color: Colors.blue),
//           //   ),
//           // ),
//           Container(
//             width: 330.0,
//             height: 40.0,
//             child: RaisedButton(
//               color: Colors.orangeAccent,
//               child: Text('Limpar'),
//               onPressed: () {
//                 setState(() => barcode = '');
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//     Container(
//       height: 40,
//       width: 300,
//     );
//     return Scaffold(
//       key: _scaffoldKey,
//       appBar: AppBar(title: Text('Leitor QRCODE'), centerTitle: true),
//       body: container,
//     );
//   }

//   // Future scan() async {
//   //   try {
//   //     String barcode = (await BarcodeScanner.scan()) as String;
//   //     setState(() => this.barcode = barcode);
//   //     print('scanned sucsessfully');

//   //     //plus one to points when scanned
//   //     String userId = (await FirebaseAuth.instance.currentUser()).uid;
//   //     final CollectionReference pointsCollection = Firestore.instance.collection('eventos');
//   //     await pointsCollection.document(userId)
//   //       .collection('eventos')
//   //       .document(userId)
//   //       .updateData({'chamada': FieldValue.increment(1)}
//   //       );

//   //       Firestore db = Firestore.instance;
//   //   final Map<String, dynamic> dadosAtualizar = <String, dynamic>{};
//   //   dadosAtualizar['imagePath'] = url;
//   //   db.collection('users').document(idUsuarioLogado).updateData(dadosAtualizar);

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

//   Future scan() async {
//     try {
//       String barcode;
//       await BarcodeScanner.scan().then((onValue) {
//         setState(() {
//           this.barcode = onValue.toString();
//         });
//       });
//       //     Future<void> addData(restaurantData) async {
//       //   if (isLoggedIn()) {
//       //     Firestore.instance
//       //         .collection('RestaurantData')
//       //         .add(restaurantData)
//       //         .catchError((e) {
//       //       print(e);
//       //     });
//       //   } else {
//       //     print('You need to logged in');
//       //   }
//       // }
//       setState(() => this.barcode = barcode);
//     } on PlatformException catch (e) {
//       if (e.code == BarcodeScanner.cameraAccessDenied) {
//         setState(() {
//           barcode = 'camera permission not granted!';
//         });
//       } else {
//         setState(() => barcode = 'Unknown error: $e');
//       }
//     } on FormatException {
//       setState(() => barcode = '(User returned)');
//     } catch (e) {
//       setState(() => barcode = 'Unknown error: $e');
//     }
//   }
// }

// import 'package:flutter/material.dart';
// import 'dart:async';
// import 'package:qrcode_reader/qrcode_reader.dart';

// class Chamada extends StatefulWidget {
//   @override
//   _ChamadaState createState() => _ChamadaState();
// }

// class _ChamadaState extends State<Chamada> {
//   // String scanResult = '';
//   Future<String> barcodeString;
//   //final snackBar =
//   //new SnackBar(content: new Text("Texto copiado com sucesso!"));

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           centerTitle: true, title: Text('Leitor Qr Code'.toUpperCase())),
//       body: Center(
//           child: FutureBuilder<String>(
//               future: barcodeString,
//               builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
//                 //return Text(snapshot.data != null ? snapshot.data : '');
//                 return Container(
//                     child: Text(snapshot.data ?? '',
//                         style: TextStyle(fontSize: 70)));
//               })),
//       floatingActionButton: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 125),
//         child: FloatingActionButton.extended(
//           tooltip: 'Acionar Câmera Leitor QRCode',
//           label: Text('Ler',
//               style: TextStyle(
//                 fontSize: 20,
//                 color: Colors.grey[100],
//                 height: 2,
//               )),
//           icon: Icon(Icons.add_a_photo, size: 30),
//           onPressed: () {
//             setState(() {
//               barcodeString = QRCodeReader()
//                   .setAutoFocusIntervalInMs(200)
//                   .setForceAutoFocus(true)
//                   .setTorchEnabled(true)
//                   .setHandlePermissions(true)
//                   .setExecuteAfterPermissionGranted(false)
//                   .scan;

//               //print(barcodeString);
//             });
//           },
//         ),
//       ),
//     );
//   }
// }

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

import 'package:barcode_scan/barcode_scan.dart' show BarcodeScanner;
import 'package:flutter/material.dart';
import 'dart:async';

class Chamada extends StatefulWidget {
  @override
  _ChamadaState createState() => _ChamadaState();
}

class _ChamadaState extends State<Chamada> {
  Future<String> code;
  String barcode = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true, title: Text('Leitor Qr Code'.toUpperCase())),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: MaterialButton(
                child: Text(
                  'Scanner',
                  style: TextStyle(fontSize: 26),
                ),
                onPressed: () => scanQrCode(),
              ),
            ),
            Text(
              barcode,
              // code,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            )
          ],
        ));
  }

  Future scanQrCode() async {
    try {
      final result = await BarcodeScanner.scan();

      setState(() {
        barcode = result as String;
      });
    } catch (e) {
      print(e);
    }
  }
}

// import 'dart:async';
// import 'dart:io' show Platform;

// import 'package:barcode_scan/barcode_scan.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class Chamada extends StatefulWidget {
//   @override
//   _ChamadaState createState() => _ChamadaState();
// }

// class _ChamadaState extends State<Chamada> {
//   ScanResult scanResult;

//   final _flashOnController = TextEditingController(text: 'Flash on');
//   final _flashOffController = TextEditingController(text: 'Flash off');
//   final _cancelController = TextEditingController(text: 'Cancel');

//   var _aspectTolerance = 0.00;
//   var _numberOfCameras = 0;
//   var _selectedCamera = -1;
//   var _useAutoFocus = true;
//   var _autoEnableFlash = false;

//   static final _possibleFormats = BarcodeFormat.values.toList()
//     ..removeWhere((e) => e == BarcodeFormat.unknown);

//   List<BarcodeFormat> selectedFormats = [..._possibleFormats];

//   @override
//   // ignore: type_annotate_public_apis
//   initState() {
//     super.initState();

//     Future.delayed(Duration.zero, () async {
//       _numberOfCameras = await BarcodeScanner.numberOfCameras;
//       setState(() {});
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     var contentList = <Widget>[
//       if (scanResult != null)
//         Card(
//           child: Column(
//             children: <Widget>[
//               ListTile(
//                 title: Text('Result Type'),
//                 subtitle: Text(scanResult.type?.toString() ?? ''),
//               ),
//               ListTile(
//                 title: Text('Raw Content'),
//                 subtitle: Text(scanResult.rawContent ?? ''),
//               ),
//               ListTile(
//                 title: Text('Format'),
//                 subtitle: Text(scanResult.format?.toString() ?? ''),
//               ),
//               ListTile(
//                 title: Text('Format note'),
//                 subtitle: Text(scanResult.formatNote ?? ''),
//               ),
//             ],
//           ),
//         ),
//       ListTile(
//         title: Text('Camera selection'),
//         dense: true,
//         enabled: false,
//       ),
//       RadioListTile(
//         //onChanged: (v) => setState(() => _selectedCamera = -1),
//         value: -1,
//         title: Text('Default camera'),
//         groupValue: _selectedCamera, onChanged: (int value) {},
//       ),
//     ];

//     for (var i = 0; i < _numberOfCameras; i++) {
//       contentList.add(RadioListTile(
//         //onChanged: (v) => setState(() => _selectedCamera = i),
//         value: i,
//         title: Text('Camera ${i + 1}'),
//         groupValue: _selectedCamera, onChanged: (int value) {},
//       ));
//     }

//     contentList.addAll([
//       ListTile(
//         title: Text('Button Texts'),
//         dense: true,
//         enabled: false,
//       ),
//       ListTile(
//         title: TextField(
//           decoration: InputDecoration(
//             hasFloatingPlaceholder: true,
//             labelText: 'Flash On',
//           ),
//           controller: _flashOnController,
//         ),
//       ),
//       ListTile(
//         title: TextField(
//           decoration: InputDecoration(
//             hasFloatingPlaceholder: true,
//             labelText: 'Flash Off',
//           ),
//           controller: _flashOffController,
//         ),
//       ),
//       ListTile(
//         title: TextField(
//           decoration: InputDecoration(
//             hasFloatingPlaceholder: true,
//             labelText: 'Cancel',
//           ),
//           controller: _cancelController,
//         ),
//       ),
//     ]);

//     if (Platform.isAndroid) {
//       contentList.addAll([
//         ListTile(
//           title: Text('Android specific options'),
//           dense: true,
//           enabled: false,
//         ),
//         ListTile(
//           title:
//               Text('Aspect tolerance (${_aspectTolerance.toStringAsFixed(2)})'),
//           subtitle: Slider(
//             min: -1.0,
//             max: 1.0,
//             value: _aspectTolerance,
//             onChanged: (value) {
//               setState(() {
//                 _aspectTolerance = value;
//               });
//             },
//           ),
//         ),
//         CheckboxListTile(
//           title: Text('Use autofocus'),
//           value: _useAutoFocus,
//           onChanged: (checked) {
//             setState(() {
//               _useAutoFocus = checked;
//             });
//           },
//         )
//       ]);
//     }

//     contentList.addAll([
//       ListTile(
//         title: Text('Other options'),
//         dense: true,
//         enabled: false,
//       ),
//       CheckboxListTile(
//         title: Text('Start with flash'),
//         value: _autoEnableFlash,
//         onChanged: (checked) {
//           setState(() {
//             _autoEnableFlash = checked;
//           });
//         },
//       )
//     ]);

//     contentList.addAll([
//       ListTile(
//         title: Text('Barcode formats'),
//         dense: true,
//         enabled: false,
//       ),
//       ListTile(
//         trailing: Checkbox(
//           tristate: true,
//           materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//           value: selectedFormats.length == _possibleFormats.length
//               ? true
//               : selectedFormats.length == 0 ? false : null,
//           onChanged: (checked) {
//             setState(() {
//               selectedFormats = [
//                 if (checked ?? false) ..._possibleFormats,
//               ];
//             });
//           },
//         ),
//         dense: true,
//         enabled: false,
//         title: Text('Detect barcode formats'),
//         subtitle: Text(
//           'If all are unselected, all possible platform formats will be used',
//         ),
//       ),
//     ]);

//     contentList.addAll(_possibleFormats.map(
//       (format) => CheckboxListTile(
//         value: selectedFormats.contains(format),
//         onChanged: (i) {
//           setState(() => selectedFormats.contains(format)
//               ? selectedFormats.remove(format)
//               : selectedFormats.add(format));
//         },
//         title: Text(format.toString()),
//       ),
//     ));

//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Barcode Scanner Example'),
//           actions: <Widget>[
//             IconButton(
//               icon: Icon(Icons.camera),
//               tooltip: 'Scan',
//               onPressed: scan,
//             )
//           ],
//         ),
//         body: ListView(
//           scrollDirection: Axis.vertical,
//           shrinkWrap: true,
//           children: contentList,
//         ),
//       ),
//     );
//   }

//   Future scan() async {
//     try {
//       var options = ScanOptions(
//         strings: {
//           'cancel': _cancelController.text,
//           'flash_on': _flashOnController.text,
//           'flash_off': _flashOffController.text,
//         },
//         restrictFormat: selectedFormats,
//         useCamera: _selectedCamera,
//         autoEnableFlash: _autoEnableFlash,
//         android: AndroidOptions(
//           aspectTolerance: _aspectTolerance,
//           useAutoFocus: _useAutoFocus,
//         ),
//       );

//       var result = await BarcodeScanner.scan(options: options);

//       setState(() => scanResult = result);
//     } on PlatformException catch (e) {
//       var result = ScanResult(
//         type: ResultType.Error,
//         format: BarcodeFormat.unknown,
//       );

//       if (e.code == BarcodeScanner.cameraAccessDenied) {
//         setState(() {
//           result.rawContent = 'The user did not grant the camera permission!';
//         });
//       } else {
//         result.rawContent = 'Unknown error: $e';
//       }
//       setState(() {
//         scanResult = result;
//       });
//     }
//   }
// }
