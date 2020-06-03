import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:unasp_ht/app/app_bloc.dart';
import 'package:unasp_ht/app/app_module.dart';

class Eventlist extends StatefulWidget {
  @override
  _EventlistState createState() => _EventlistState();
}

class _EventlistState extends State<Eventlist> {
  AppBloc bloc = AppModule.to.getBloc();
  String urlImage =
      'https://firebasestorage.googleapis.com/v0/b/eventounasp.appspot.com/o/fotos%2F1591037679788.jpg?alt=media&token=c484fed7-a40a-4668-a446-51b0cb251d02';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('QR Code'.toUpperCase()),
      ),
      body: Center(
        child: Container(
            padding: EdgeInsets.all(30),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 16,
                ),

                ListTile(
                  leading: CircleAvatar(
                    maxRadius: 30,
                    backgroundImage: NetworkImage(
                      urlImage,
                    ),
                  ),
                  title: Row(
                    children: <Widget>[
                      Text(
                        'RA: ',
                        style: TextStyle(
                          fontSize: 20,
                          decorationColor: Colors.yellow[900],
                        ),
                      ),
                      Text(bloc.currentUser.value.ra),
                    ],
                  ),
                  subtitle: Row(
                    children: <Widget>[
                      Text('Nome: ',
                          style: TextStyle(
                            fontSize: 18,                            
                          )),
                      Text(bloc.currentUser.value.name,
                          style: TextStyle(
                            fontSize: 16,
                            decorationColor: Colors.red[900],
                          )),
                    ],
                  ),
                ),

                Divider(
                  height: 82.0,
                  color: Colors.red[600],
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
      ),
    );
  }
}
