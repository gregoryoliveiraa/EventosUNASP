import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:unasp_ht/app/app_bloc.dart';
import 'package:unasp_ht/app/app_module.dart';

class ProfileQrcode extends StatefulWidget {
  @override
  _ProfileQrcodeState createState() => _ProfileQrcodeState();
}

class _ProfileQrcodeState extends State<ProfileQrcode> {
  AppBloc bloc = AppModule.to.getBloc();

  @override
  Widget build(BuildContext context) {
    String path = bloc.currentUser.value.imagePath;
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('QR Code'.toUpperCase()),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    CircleAvatar(
                        radius: 120.0,
                        backgroundColor: Colors.grey[300],
                        backgroundImage: path != null ? NetworkImage(path) : null),
                         SizedBox(height: 20),
                    Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text('RA: ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18)),
                            Text(bloc.currentUser.value.ra,
                                style: TextStyle(fontSize: 18))
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: <Widget>[
                            Text('Nome: ', 
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                            Text(bloc.currentUser.value.name,
                                style: TextStyle(fontSize: 18)),
                            // Text(' - (' + bloc.currentUser.value.tipo.toUpperCase() + ')',
                            //     style: TextStyle(fontSize: 18)),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: <Widget>[
                            Text('E-mail: ',
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                            Text(bloc.currentUser.value.email,
                                style: TextStyle(fontSize: 18))
                          ],
                        ),
                      ],
                    ),
                    Divider(height: 50, color: Colors.red[600]),
                    QrImage(
                      data: bloc.currentUser.value.ra,
                      version: 3,
                      gapless: true,
                      size: 210,
                      errorCorrectionLevel: QrErrorCorrectLevel.H,
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
