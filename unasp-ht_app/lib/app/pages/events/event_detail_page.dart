import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:qrcode_reader/qrcode_reader.dart';
import 'package:unasp_ht/app/app_bloc.dart';
import 'package:unasp_ht/app/app_module.dart';
import 'package:unasp_ht/app/pages/events/event_model.dart';
import 'package:unasp_ht/app/shared/components/labeled.dart';
import 'package:unasp_ht/app/shared/constants.dart';

class EventDetailPage extends StatefulWidget {
  final Eventos eventos;

  const EventDetailPage({Key key, @required this.eventos}) : super(key: key);

  @override
  _EventDetailPageState createState() => _EventDetailPageState();
}

class _EventDetailPageState extends State<EventDetailPage> {
  AppBloc bloc = AppModule.to.getBloc();
  Future<String> barcodeString;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text('Evento'.toUpperCase()),
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
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Text('Título: "' + widget.eventos.titulo.toUpperCase() + '"',
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[700],fontSize: 18)),
              const SizedBox(height: 15),
              Labeled(
                label: 'Inicio: ', text: DateFormat('dd/MM/yy').format(widget.eventos.inicio ?? DateTime.now())),
              const SizedBox(height: 8),
              Labeled(
                label: 'hora: ', text: DateFormat('HH:mm').format(widget.eventos.inicio ?? DateTime.now()) +'h'),
              const SizedBox(height: 8),
              Labeled(
                label: 'Término: ', text: DateFormat('dd/MM/yy').format(widget.eventos.termino ?? DateTime.now())),
              const SizedBox(height: 8),
              Labeled(
                label: 'hora: ', text: DateFormat('HH:mm').format(widget.eventos.termino ?? DateTime.now()) +'h'),
              const SizedBox(height: 8),
              Labeled(
                label: 'Local: ', text: widget.eventos.local),
              const SizedBox(height: 8),
              Labeled(
                label: 'Observações: ', text: widget.eventos.obs),
              const SizedBox(height: 8),
              Labeled(
                label: 'Status: ', text: widget.eventos.status.toString()
                .substring(widget.eventos.status.toString().indexOf('.') + 1).toUpperCase()),
              const SizedBox(height: 18),
              Container(
                margin: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
                height: 280,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      alignment: Alignment(-.2, 0),
                      image: NetworkImage(bloc.currentUser.value.imagePath),
                      fit: BoxFit.contain),
                ),
              ),
              Divider(height: 60, color: Colors.red[600]),
              const SizedBox(height: 20),
              Text('Registrar chamada:'.toUpperCase(), style: TextStyle(fontSize: 18, color: BLUE,)),
              Text('Pressione o botão abaixo para leitura do QrCode', style: TextStyle(fontSize: 16, color: BLUE,)),
            ],
          ),
        ),
      ),
      floatingActionButton: AppModule.to.getBloc<AppBloc>().currentUser.value.tipo == 'aluno'
              ? null
              : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FloatingActionButton.extended(
                      elevation: 4.0,
                      icon: const Icon(Icons.person_add, size: 30,),
                      label: const Text('Leitor QrCOde', style: TextStyle(fontSize: 18)),
                      onPressed: () {
                        setState(() {
                          barcodeString = QRCodeReader()
                            .setAutoFocusIntervalInMs(200)
                            .setForceAutoFocus(true)
                            .setTorchEnabled(true)
                            .setHandlePermissions(true)
                            .setExecuteAfterPermissionGranted(true)
                          .scan;
                        });
                      },
                    ),
                  ],
              ),
    );
  }
}
