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
        title: Text(widget.eventos.obs),
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
              ),
              Container(
                  margin: EdgeInsets.all(10),
                  // child: CircleAvatar(
                  //   backgroundImage: AssetImage('test.png'),
                  // ),
                  width: MediaQuery.of(context).size.width,
                  height: 250,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        alignment: Alignment(-.2, 0),
                        image: NetworkImage(bloc.currentUser.value?.imagePath ??
                            'https://www.syncfusion.com/blogs/wp-content/uploads/2020/03/How-to-Create-a-Scheduling-Application-Using-Flutter-Event-Calendar.png'),
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
