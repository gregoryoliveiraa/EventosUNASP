import 'package:flutter/material.dart';

class Eventlist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code'.toUpperCase()),
      ),
      body: Column(children: <Widget>[
        Image.asset('assets/img/qrCode.png', fit: BoxFit.contain),
        // ] RaisedButton(
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        //   child: Text('retorna'),
        // ),
      ]),
    );
  }
}
