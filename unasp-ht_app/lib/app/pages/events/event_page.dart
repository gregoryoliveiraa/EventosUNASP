import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:unasp_ht/app/pages/events/event_bloc.dart';
import 'package:unasp_ht/app/pages/events/event_card.dart';
import 'package:unasp_ht/app/pages/events/event_model.dart';
import 'package:unasp_ht/app/pages/events/event_module.dart';
import 'package:unasp_ht/app/pages/events/new_event_page.dart';
import 'package:unasp_ht/app/pages/login/signup/components/loading_widget.dart';

class EventPage extends StatefulWidget {
  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  final DeparturesBloc _bloc = EventModule.to.getBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Eventos'.toUpperCase()),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: <Widget>[
            StreamBuilder<List<Departure>>(
              stream: _bloc.departures,
              builder: (c, s) {
                if (!s.hasData) {
                  return Center(
                    child: LoadingWidget(),
                  );
                }

                return ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (c, i) => DepartureCard(departure: s.data[i]),
                  itemCount: s.data.length,
                );
              },
            )
          ],
        ),
      ),
      
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).accentColor,
        child: Icon(FontAwesomeIcons.plus),
        onPressed: () => Navigator.of(context).push<CupertinoPageRoute>(
          CupertinoPageRoute(
            builder: (context) => NewDeparturePage(),
          ),
        ),
      ),
    );
  }
}
