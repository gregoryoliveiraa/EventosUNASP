import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:qrcode_reader/qrcode_reader.dart';
import 'package:unasp_ht/app/app_bloc.dart';
import 'package:unasp_ht/app/app_module.dart';
import 'package:unasp_ht/app/pages/events/event_chamada.dart';
import 'package:unasp_ht/app/pages/events/event_model.dart';
import 'package:unasp_ht/app/pages/events/event_test.dart';
import 'package:unasp_ht/app/pages/login/signup/enums/category_enum.dart';
import 'package:unasp_ht/app/shared/constants.dart';

class EventDetailPage extends StatefulWidget {
  final Eventos eventos;
  const EventDetailPage({Key key, @required this.eventos}) : super(key: key);

  @override
  _EventDetailPageState createState() => _EventDetailPageState();
}

class _EventDetailPageState extends State<EventDetailPage> {
  AppBloc bloc = AppModule.to.getBloc();
  String barcode = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String evento = widget.eventos.titulo;
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/img/isolado_branco.png', width: 80),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(FontAwesomeIcons.pencilAlt, size: 18),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(FontAwesomeIcons.trashAlt, size: 18),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: <Widget>[
              Align(
                  alignment: Alignment.center,
                  child: Text('"' + widget.eventos.titulo.toUpperCase() + '"',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                          fontSize: 20))),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  width: MediaQuery.of(context).size.width,
                  height: 280,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: ExactAssetImage('assets/img/test.png'),
                          fit: BoxFit.cover))),
              Row(children: <Widget>[
                Text('início: '.toUpperCase(),
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor)),
                Text(DateFormat('dd/MM/yy')
                    .format(widget.eventos.inicio ?? DateTime.now())),
                Text(' às ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor)),
                Text(DateFormat('HH:mm')
                        .format(widget.eventos.inicio ?? DateTime.now()) +
                    'h'),
              ]),
              const SizedBox(height: 8),
              Row(children: <Widget>[
                Text('Término: '.toUpperCase(),
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor)),
                Text(DateFormat('dd/MM/yy')
                    .format(widget.eventos.termino ?? DateTime.now())),
                Text(' às ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor)),
                Text(DateFormat('HH:mm')
                        .format(widget.eventos.termino ?? DateTime.now()) +
                    'h'),
              ]),
              const SizedBox(height: 8),
              Row(children: <Widget>[
                Text('Local: '.toUpperCase(),
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor)),
                Text(widget.eventos.local),
              ]),
              const SizedBox(height: 8),
              Row(children: <Widget>[
                Text('Obs: '.toUpperCase(),
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor)),
                Text(widget.eventos.obs),
              ]),
              const SizedBox(height: 8),
              Row(children: <Widget>[
                Text('Status: '.toUpperCase(),
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor)),
                Text(widget.eventos.status
                    .toString()
                    .substring(
                        widget.eventos.status.toString().indexOf('.') + 1)
                    .toUpperCase()),
              ]),
              Divider(height: 60, color: Colors.red[600]),
              const SizedBox(height: 10),
              AppModule.to.getBloc<AppBloc>().currentUser.value.mainCategory !=
                      CategoryEnum.Admin
                  ? Text('Olá ' + bloc.currentUser.value.name.toUpperCase() + ', '
        '\nVocê está cordialmente convidado \n a participar deste grande evento. \n Não perca esta oportunidae!!!',
                      style: TextStyle(fontSize: 18, color: BLUE))
                  : Container(
                      child: Column(
                        children: <Widget>[
                          Text('Registrar chamada:'.toUpperCase(),
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: BLUE)),
                          const SizedBox(height: 10),
                          Text('   Pressione o botão para leitura do QrCode',
                              style: TextStyle(fontSize: 16, color: BLUE)),
                          const SizedBox(height: 30),

                          // RaisedButton(
                          //   elevation: 4,
                          //     color: Colors.deepOrangeAccent,
                          //     splashColor: Colors.green,
                          //     shape: RoundedRectangleBorder(
                          //       borderRadius: BorderRadius.circular(8),
                          //       side: BorderSide(color: Colors.red)),
                          //     onPressed: () async {
                          //       await showDialog<ConfirmAction>(
                          //         context: context,
                          //         barrierDismissible: false,
                          //         builder: (BuildContext context) {
                          //           return AlertDialog(
                          //             title: Text('Evento: ' + evento),
                          //             //content:const Text('Descriçao do evento'),
                          //             actions: <Widget>[
                          //               FlatButton(
                          //                 child: const Text('CANCELAR'),
                          //                 onPressed: () {
                          //                   Navigator.of(context)
                          //                       .pop(ConfirmAction.CANCEL);
                          //                 },
                          //               ),
                          //               FlatButton(
                          //                   child: const Text('ESCANEAR'),
                          //                   onPressed: () => scan()),
                          //               FlatButton(
                          //                   child: const Text('SALVAR'),
                          //                   onPressed: () {
                          //                     Navigator.of(context)
                          //                       .pop(ConfirmAction.CANCEL);
                          //                   }
                          //               )
                          //             ],
                          //           );
                          //         },
                          //       );
                          //     },
                          //     child: Text('leitor qr code'.toUpperCase(),
                          //     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Theme.of(context).secondaryHeaderColor))
                          // ),

                          FloatingActionButton.extended(
                            elevation: 4.0,
                            icon: const Icon(Icons.person_add, size: 30),
                            label: const Text('Registrar presença',
                            style: TextStyle(fontSize: 18)),
                            onPressed: () => Navigator.of(context)
                            .push<CupertinoPageRoute>(
                              CupertinoPageRoute(builder: (context) => Chamada())),
                          ),

                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
  

  Future scan() async {
    try {
      String barcode = await QRCodeReader().scan;
      setState(() {
        this.barcode = barcode;
      });
    } catch (e) {
      setState(() {
        barcode = 'erro';
      });
    }
  }

 
}
