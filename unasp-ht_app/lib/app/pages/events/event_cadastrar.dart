import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:unasp_ht/app/pages/events/event_model.dart';
import 'package:unasp_ht/app/shared/components/labeled.dart';

class EventCadastrar extends StatefulWidget {
  final Event event;

  const EventCadastrar({Key key, @required this.event})
      : super(key: key);

  @override
  _EventCadastrarState createState() => _EventCadastrarState();
}

class _EventCadastrarState extends State<EventCadastrar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.event.location),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              FontAwesomeIcons.pencilAlt,
              size: 18,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              FontAwesomeIcons.trashAlt,
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
                label: 'Ida: ',
                text: DateFormat('dd/MM/yy - HH:mm').format(
                      widget.event.going ?? DateTime.now(),
                    ) +
                    'h',
              ),
              const SizedBox(height: 8),
              Labeled(
                label: 'Volta: ',
                text: DateFormat('dd/MM/yy - HH:mm').format(
                      widget.event.turning ?? DateTime.now(),
                    ) +
                    'h',
              ),
              const SizedBox(height: 8),
              Labeled(
                label: 'Motivo: ',
                text: widget.event.reason,
              ),
              const SizedBox(height: 8),
              Labeled(
                label: 'Status: ',
                text: widget.event.status
                    .toString()
                    .substring(
                        widget.event.status.toString().indexOf('.') + 1)
                    .toUpperCase(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
