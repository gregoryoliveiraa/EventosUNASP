import 'package:flutter/material.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:unasp_ht/app/app_bloc.dart';
import 'package:unasp_ht/app/app_module.dart';
import 'package:unasp_ht/app/shared/components/labeled.dart';

class Eventlist extends StatefulWidget {
  @override
  _EventlistState createState() => _EventlistState();
}

class _EventlistState extends State<Eventlist> {
  AppBloc bloc = AppModule.to.getBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code'.toUpperCase()),
      ),
      body: Center(
          child: Column(
        //crossAxisAlignment: CrossAxisAlignment.center,
        //mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          SizedBox(
            height: 24,
          ),
          Labeled(
            label: 'RA : ',
            text: bloc.currentUser.value.ra,
            //icon: FontAwesomeIcons.userAlt,
            inline: true,
          ),
          Center(
            child: Labeled(
              label: 'NOME : ',
              text: bloc.currentUser.value.name,
              //icon: FontAwesomeIcons.userAlt,
              inline: true,
            ),
          ),
          //____________Distancia entre o texto e o QRCode________________
          SizedBox(
            height: 16,
          ),
          QrImage(
            data: bloc.currentUser.value.ra,
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
