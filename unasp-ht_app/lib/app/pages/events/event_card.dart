import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:unasp_ht/app/pages/events/event_detail_page.dart';
import 'package:unasp_ht/app/pages/events/event_model.dart';

class EventCard extends StatelessWidget {
  final Eventos eventos;
  const EventCard({Key key, @required this.eventos}) : super(key: key);

  Color getEventStatusColor(EventStatus status) {
    Color color;
    switch (status) {
      case EventStatus.pendente:
        color = Colors.orange;
        break;
      case EventStatus.encerrado:
        color = Colors.redAccent;
        break;
      case EventStatus.decorrendo:
        color = Colors.green;
        break;
    }
    return color;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push<CupertinoPageRoute>(
        CupertinoPageRoute(
          builder: (context) => EventDetailPage(eventos: eventos),
        ),
      ),
      child: Container(
        constraints: BoxConstraints(minHeight: 150), //ALTURA DO CARD
        decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5, spreadRadius: 2),
          ],
        ),
        child: Row(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: getEventStatusColor(eventos.status),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20))),
              constraints: BoxConstraints(minHeight: 180),
              width: 15,
              height: 150,
            ),
            SizedBox(width: 15),
            Container(
              constraints: BoxConstraints(minHeight: 150),
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width - 100,
                    child: Row(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,                          
                          children: <Widget>[

/*___________TÍTULO_____________ */
                            Row(
                              children: <Widget>[
                                Text('título: '.toUpperCase(), textAlign: TextAlign.left,
                                  style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor)),
                                Text(eventos.titulo.toUpperCase())
                              ],
                            ),
                            const SizedBox(height: 5),

/*___________INICIO___________ */
                            Row(
                              children: <Widget>[
                                Text('início: '.toUpperCase(),
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor)),
                                Text(DateFormat('dd/MM/yy      ').format(eventos.inicio ?? DateTime.now())),
                                Text('término: '.toUpperCase(),
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor)),
                                Text(DateFormat('dd/MM/yy').format(eventos.termino ?? DateTime.now())),
                              ],
                            ),
                            const SizedBox(height: 5),
                            
/*___________TERMINO___________ */
                            Row(
                              children: <Widget>[
                                Text('das: ',
                                  style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor)),
                                  Text(DateFormat('HH:mm ').format(eventos.inicio ?? DateTime.now())),
                                Text(' as: ', style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor)),
                                  Text(DateFormat('HH:mm').format(eventos.termino ?? DateTime.now())),
                              ],
                            ),
                            const SizedBox(height: 5),

/*___________LOCAL___________ */
                            Row(
                              children: <Widget>[
                                Text('local: '.toUpperCase(),
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor)),
                                Text(eventos.local.toUpperCase()),
                              ],
                            ),
                            const SizedBox(height: 5),

/*___________OBSERVAÇÕES___________ */
                            Row(
                              children: <Widget>[
                                Text('obs: '.toUpperCase(),
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor)),
                                Text(eventos.obs),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 100,
                    child: Divider(thickness: 2),
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width - 100,
                      child: Center(
                        child: Text(eventos.status.toString().substring(
                          eventos.status.toString().indexOf('.') + 1).toUpperCase() ?? ''))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}