import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:unasp_ht/app/app_bloc.dart';
import 'package:unasp_ht/app/app_module.dart';
import 'package:unasp_ht/app/pages/events/event_model.dart';
import 'package:unasp_ht/app/shared/components/labeled.dart';

class EventDetailPage extends StatefulWidget {
  final Eventos eventos;

  const EventDetailPage({Key key, @required this.eventos})
      : super(key: key);

  @override
  _EventDetailPageState createState() => _EventDetailPageState();
}

class _EventDetailPageState extends State<EventDetailPage> {
  AppBloc bloc = AppModule.to.getBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
/*__________________________TÍTULO DA APPBAR___________________________*/
        title: Text('Evento'.toUpperCase()),
        actions: <Widget>[
          IconButton(
            icon: Icon(FontAwesomeIcons.pencilAlt,
              size: 18,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(FontAwesomeIcons.trashAlt,
              size: 18,
            ),
            onPressed: () {},
          )
        ],
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Text('Título: "' + widget.eventos.titulo.toUpperCase() + '"',
                style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700],
                        fontSize: 18)
              ),
              const SizedBox(height: 15),

              Labeled(label: 'Inicio: ',
                text: DateFormat('dd/MM/yy').format(widget.eventos.inicio ?? DateTime.now(),),
              ),
              const SizedBox(height: 8),
              Labeled(label: 'hora: ',
                text: DateFormat('HH:mm').format(widget.eventos.inicio?? DateTime.now(),) +'h',
              ),
              const SizedBox(height: 8),
              Labeled(label: 'Término: ',
                text: DateFormat('dd/MM/yy').format(widget.eventos.termino ?? DateTime.now(),),
              ),
              const SizedBox(height: 8),
              Labeled(label: 'hora: ',
                text: DateFormat('HH:mm').format(widget.eventos.termino ?? DateTime.now(),) +'h',
              ),
              const SizedBox(height: 8),
              Labeled(label: 'Local: ',
                text: widget.eventos.local,
              ),
              const SizedBox(height: 8),
              Labeled(label: 'Observações: ',
                text: widget.eventos.obs,
              ),
              const SizedBox(height: 8),
              Labeled(label: 'Status: ',
                text: widget.eventos.status.toString()
                    .substring(widget.eventos.status.toString().indexOf('.') + 1)
                    .toUpperCase(),
              ),
              const SizedBox(height: 18),
              Container(
                  margin: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width,
                  height: 280,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        alignment: Alignment(-.2, 0),
                        image: NetworkImage(bloc.currentUser.value?.imagePath ?? 'https://firebasestorage.googleapis.com/v0/b/eventounasp.appspot.com/o/fotos%2F1591052408722.jpg?alt=media&token=9412029d-f08c-4296-8327-0f2a335ae974'
                        ),
                        fit: BoxFit.cover),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
