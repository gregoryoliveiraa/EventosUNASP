import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Eventlist extends StatelessWidget {
  final String data = '57246';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code'.toUpperCase()),
      ),
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'QrCode gerado com RA:\n $data',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          //____________Distancia entre o texto e o QRCode________________
          SizedBox(
            height: 16,
          ),
          QrImage(
            data: data,
            //____propriedade que melhora a renderização do QrCode
            gapless: true,
            size: 300,
            errorCorrectionLevel: QrErrorCorrectLevel.H,
          )
        ],
      )),
    );
  }
}
