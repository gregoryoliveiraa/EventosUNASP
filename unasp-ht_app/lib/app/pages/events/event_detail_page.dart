import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[600],
      appBar: AppBar(
/*__________________________TÍTULO DA APPBAR___________________________*/
        title: Text(widget.eventos.obs.toUpperCase()),
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
              Labeled(
                label: 'Inicio: ',
                text: DateFormat('dd/MM/yy').format(widget.eventos.inicio ?? DateTime.now(),
                ),
              ),
              
              const SizedBox(height: 8),
              Labeled(
                label: 'hora: ',
                text: DateFormat('HH:mm').format(widget.eventos.inicio?? DateTime.now(),
                ) +'h',
              ),
              const SizedBox(height: 8),
              Labeled(
                label: 'Término: ',
                text: DateFormat('dd/MM/yy').format(widget.eventos.termino ?? DateTime.now(),
                ),
              ),
              const SizedBox(height: 8),
              Labeled(
                label: 'hora: ',
                text: DateFormat('HH:mm').format(widget.eventos.termino ?? DateTime.now(),
                ) +'h',
              ),
              const SizedBox(height: 8),
              Labeled(
                label: 'Local: ',
                text: widget.eventos.local,
              ),
              const SizedBox(height: 8),
              Labeled(
                label: 'título: ',
                text: widget.eventos.obs,
              ),
              const SizedBox(height: 8),
              Labeled(
                label: 'Status: ',
                text: widget.eventos.status
                    .toString()
                    .substring(widget.eventos.status.toString().indexOf('.') + 1)
                    .toUpperCase(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
