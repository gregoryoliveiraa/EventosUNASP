import 'package:flutter/material.dart';
//import 'package:barcode_scan/barcode_scan.dart';

class Chamada extends StatefulWidget {
  @override
  _ChamadaState createState() => _ChamadaState();
}

class _ChamadaState extends State<Chamada> {
  String code = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        //crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          RaisedButton(
              child: Text(
                'Scanner QR Code',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              color: Colors.deepOrange,
              onPressed: () => //scanQrCode(),
                  //),
                  Text(
                    code,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ))
        ],
      ),
    );
  }

  // scanQrCode() async {
  //   try {
  //     final result = await BarcodeScanner.scan();
  //     setState(() {
  //       code = result;
  //     });
  //   } catch (e) {
  //     print(e);
  //   }
  // }
}
