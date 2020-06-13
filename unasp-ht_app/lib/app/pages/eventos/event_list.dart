import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:unasp_ht/app/app_bloc.dart';
import 'package:unasp_ht/app/app_module.dart';

class Eventlist extends StatefulWidget {
  @override
  _EventlistState createState() => _EventlistState();
}

class _EventlistState extends State<Eventlist> {
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
      body: Center(
        child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(30, 5, 30, 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                CircleAvatar(
                    radius: 110.0,
                    backgroundColor: Colors.grey[300],
                    backgroundImage: path != null ? NetworkImage(path) : null),
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
                    const SizedBox(height: 8),
                    Row(
                      children: <Widget>[
                        Text('Nome: ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            )),
                        Text(bloc.currentUser.value.name + ' - ',
                            style: TextStyle(fontSize: 18)),
                        Text(
                            '(' +
                                bloc.currentUser.value.tipo.toUpperCase() +
                                ')',
                            style: TextStyle(fontSize: 18)),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: <Widget>[
                        Text('E-mail: ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                        Text(bloc.currentUser.value.email,
                            style: TextStyle(fontSize: 18))
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(height: 5, color: Colors.red[600]),
                QrImage(
                  data: bloc.currentUser.value.ra,
                  //____propriedade que melhora a renderização do QrCode
                  gapless: true,
                  size: 230,
                  errorCorrectionLevel: QrErrorCorrectLevel.H,
                )
              ],
            )),
      ),
    );
  }
}
