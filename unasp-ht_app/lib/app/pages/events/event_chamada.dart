import 'package:barcode_scan/barcode_scan.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

class Chamada extends StatefulWidget {
  @override
  _ChamadaState createState() => _ChamadaState();
}

class _ChamadaState extends State<Chamada> {
  String barcode = '';
  final snackBar = SnackBar(content: Text('Texto copiado com sucesso!'));
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Leitor QRCODE'),
        centerTitle: true
      ),
          body: Container(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: <Widget>[
                IconButton(
                  icon: Icon(const IconData(0xe8fc, fontFamily: 'MaterialIcons')),
                  tooltip: 'Ler código',
                  iconSize: 50,
                  onPressed: () {
                    scan();
                  },
                ),
                TextField(
                  controller: TextEditingController.fromValue(TextEditingValue(text: barcode)),
                  style: Theme.of(context).textTheme.subtitle1,
                  decoration: InputDecoration(
                    hintText: 'Aqui ficará o código encontrado.',
                    //labelText: 'QRcode',
                    labelStyle: Theme.of(context).textTheme.headline5,
                    contentPadding: EdgeInsets.all(8.0),
                  ),
                ),
                Divider(),
                SizedBox(height: 30),
                Container(
                  width: 330.0,
                  height: 40.0,
                  child: RaisedButton(
                    color: Colors.amberAccent,
                    child: Text('Copiar'),
                    onPressed: () {
                      Clipboard.setData(ClipboardData(text: barcode));
                      _scaffoldKey.currentState.showSnackBar(snackBar);
                    },
                  ),
                ),
                SizedBox(height: 20),
            //  Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            //   child: Linkify(
            //     onOpen: (link) async {
            //       if (await canLaunch(link.url)) {
            //         await launch(link.url);
            //       } else {
            //         throw 'Could not launch $link';
            //       }
            //     },
            //     text: _barcode,
            //     style: TextStyle(color: Colors.yellow),
            //     linkStyle: TextStyle(color: Colors.blue),
            //   ),
            // ),
                Container(
                  width: 330.0,
                  height: 40.0,
                  child: RaisedButton(
                    color: Colors.amberAccent,
                    child: Text('Limpar'),
                    onPressed: () {
                      setState(() => barcode = '');
                    },
                  ),
                ),
              ],
            ),
          ),
    );
  }

  // Future scan() async {
  //   try {
  //     String barcode = (await BarcodeScanner.scan()) as String;
  //     setState(() => this.barcode = barcode);
  //     print('scanned sucsessfully');

  //     //plus one to points when scanned
  //     String userId = (await FirebaseAuth.instance.currentUser()).uid;
  //     final CollectionReference pointsCollection = Firestore.instance.collection('eventos');
  //     await pointsCollection.document(userId)
  //       .collection('eventos')
  //       .document(userId)
  //       .updateData({'chamada': FieldValue.increment(1)}
  //       );


  //       Firestore db = Firestore.instance;
  //   final Map<String, dynamic> dadosAtualizar = <String, dynamic>{};
  //   dadosAtualizar['imagePath'] = url;
  //   db.collection('users').document(idUsuarioLogado).updateData(dadosAtualizar);

  //   } on PlatformException catch (e) {
  //     if (e.code == BarcodeScanner.cameraAccessDenied) {
  //       setState(() {
  //         barcode = 'The user did not grant the camera permission!';
  //       });
  //     } else {
  //       setState(() => barcode = 'Unknown error: $e');
  //     }
  //   } on FormatException{
  //     setState(() => barcode = 'null (User returned using the "back"-button before scanning anything. Result)');
  //   } catch (e) {
  //     setState(() => barcode = 'Unknown error: $e');
  //   }
  // }





  Future scan() async {
    try {
      String barcode;
      await BarcodeScanner.scan().then((onValue) {
        setState(() {
          this.barcode = onValue.toString();
        });
      });
    //     Future<void> addData(restaurantData) async {
    //   if (isLoggedIn()) {
    //     Firestore.instance
    //         .collection('RestaurantData')
    //         .add(restaurantData)
    //         .catchError((e) {
    //       print(e);
    //     });
    //   } else {
    //     print('You need to logged in');
    //   }
    // }
      setState(() => this.barcode = barcode);
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.cameraAccessDenied) {
        setState(() {
          barcode = 'camera permission not granted!';
        });
      } else {
        setState(() => barcode = 'Unknown error: $e');
      }
    } on FormatException {
      setState(() => barcode = '(User returned)');
    } catch (e) {
      setState(() => barcode = 'Unknown error: $e');
    }
  }
  
}

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
//   final snackBar = new SnackBar(content: new Text("Texto copiado com sucesso!"));

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           centerTitle: true, 
//           title: Text('Leitor Qr Code'.toUpperCase())),
//       body: Center(
//         child: FutureBuilder<String>(
//           future: barcodeString,
//           builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
//             //return Text(snapshot.data != null ? snapshot.data : '');
//             return Container(
//               child: Text(snapshot.data ?? '', style: TextStyle(fontSize: 26))
//             );
//           }
//         )
//       ),
//       floatingActionButton: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 125),
//         child: FloatingActionButton.extended(          
//           tooltip: 'Acionar Câmera Leitor QRCode',
//           label: Text('Escanear', style: TextStyle(fontSize: 20, color: Colors.grey[100], height: 2,)),
//             icon: Icon(Icons.add_a_photo, size: 30),
//           onPressed: () {
//             setState(() {
//               barcodeString = QRCodeReader()
//                   .setAutoFocusIntervalInMs(200)
//                   .setForceAutoFocus(true)
//                   .setTorchEnabled(true)
//                   .setHandlePermissions(true)
//                   .setExecuteAfterPermissionGranted(true)
//                   .scan;                  
//             });
//           },
//         ),
//       ),
//     );
//   }
  
// }

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
