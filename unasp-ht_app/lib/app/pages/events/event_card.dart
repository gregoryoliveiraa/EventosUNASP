import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
          builder: (context) => EventDetailPage(
            eventos: eventos,
          ),
        ),
      ),
      child: Container(
        constraints: BoxConstraints(minHeight: 150),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 5, spreadRadius: 1),
          ],
        ),
        child: Row(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  color: getEventStatusColor(eventos.status),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20))),
              constraints: BoxConstraints(minHeight: 150),
              width: 15,
              height: 150,
            ),
            SizedBox(
              width: 15,
            ),
            Container(
              constraints: BoxConstraints(minHeight: 150),
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width - 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'inicio: '.toUpperCase(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            Text(DateFormat('dd/MM/yy')
                                .format(eventos.inicio ?? DateTime.now()))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'volta: '.toUpperCase(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            Text(DateFormat('dd/MM/yy')
                                .format(eventos.termino ?? DateTime.now()))
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                FontAwesomeIcons.mapMarkerAlt,
                                color: Theme.of(context).primaryColor,
                                size: 15,
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  eventos.local?.toUpperCase() ?? '',
                                  softWrap: false,
                                  overflow: TextOverflow.fade,
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(width: 30),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                FontAwesomeIcons.infoCircle,
                                color: Theme.of(context).primaryColor,
                                size: 15,
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  eventos.obs?.toUpperCase() ?? '',
                                  softWrap: false,
                                  overflow: TextOverflow.fade,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 100,
                    child: Divider(
                      thickness: 1,
                    ),
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width - 100,
                      child: Center(
                        child: Text(eventos.status
                                .toString()
                                .substring(
                                    eventos.status.toString().indexOf('.') +
                                        1)
                                .toUpperCase() ??
                            ''),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
