import 'package:flutter/material.dart';
import 'package:unasp_ht/app/pages/events/event_bloc.dart';
import 'package:unasp_ht/app/pages/events/event_form.dart';
import 'package:unasp_ht/app/pages/events/event_form_bloc.dart';
import 'package:unasp_ht/app/pages/events/event_module.dart';
import 'package:unasp_ht/app/pages/events/new_event_bloc.dart';
import 'package:unasp_ht/app/shared/components/button.dart';
import 'package:unasp_ht/app/shared/components/loading_widget.dart';

class NewEventPage extends StatefulWidget {
  @override
  _NewEventPageState createState() => _NewEventPageState();
}

class _NewEventPageState extends State<NewEventPage> {
  final NewEventBloc _bloc = EventModule.to.getBloc<NewEventBloc>();
  final EventFormBloc _formBloc = EventModule.to.getBloc<EventFormBloc>();
  final EventBloc _eventosBloc = EventModule.to.getBloc<EventBloc>();

  DateTime today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Novo Evento'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh), 
            onPressed: (){
              FocusScope.of(context).unfocus();
              _formBloc.clearFields();
            } 
            ),
        ],
      ),
      
      body: StreamBuilder<bool>(
          stream: _bloc.isLoadingController,
          builder: (c, snapshot) {
            if (snapshot.hasData && snapshot.data) {
              return Container(
                child: Center(
                  child: LoadingWidget(),
                ),
              );
            }
            return SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    EventForm(),
                    const SizedBox(height: 20),
                    StreamBuilder<bool>(
                        stream: _formBloc.isValidFormController,
                        builder: (c, snapshot) {
                          return Button(
                            enabled: snapshot.hasData && snapshot.data,
                            onTap: () async {
                              bool res = await _bloc.sendEventos();
                              if (res) {
                                _formBloc.clearFields();
                                _eventosBloc.getEventos();
                                _bloc.isLoadingController.add(false);
                                Navigator.of(context).pop();
                              } else {
                                Scaffold.of(context).showSnackBar(
                                  SnackBar(content: Text('Erro ao enviar! :('), backgroundColor: Colors.red),
                                );
                                _bloc.isLoadingController.add(false);
                              }
                            },
                            color: theme.accentColor,
                            text: 'enviar',                            
                          );
                        })
                  ],
                ),
              ),
            );
          }),
    );
  }
}
