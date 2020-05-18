import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:unasp_ht/app/pages/events/event_form_bloc.dart';
import 'package:unasp_ht/app/pages/events/event_module.dart';
import 'package:unasp_ht/app/pages/events/event_date_picker.dart';
import 'package:unasp_ht/app/pages/events/event_time_picker.dart';
import 'package:unasp_ht/app/shared/components/text-field.dart';

class EventForm extends StatefulWidget {
  @override
  _EventFormState createState() => _EventFormState();
}

class _EventFormState extends State<EventForm> {
  final EventFormBloc _bloc = EventModule.to.getBloc<EventFormBloc>();
  final DateTime today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Início / Término'.toUpperCase(),
        style: TextStyle(
            fontSize: 16,
            color: theme.primaryColor,
            fontWeight: FontWeight.bold,
            
          ),
        ),
        const SizedBox(height: 20),
        Row(
          children: <Widget>[
            Expanded(
              child: Column(
                children: <Widget>[
                  DatePicker(
                    controller: _bloc.inicioDateController,
                    hintText: 'Data Inicio',
                    icon: FontAwesomeIcons.calendarAlt,
                    onTap: () async => _bloc.inicioDateC.add(
                      await showDatePicker(
                        context: context,
                        locale: Locale('pt'),
                        initialDate: today,
                        firstDate: today.add(Duration(days: -1)),
                        lastDate: today.add(Duration(days: 120)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TimePicker(
                    dateController: _bloc.inicioDateC,
                    textController: _bloc.inicioTimeController,
                    hintText: 'Hora Início',
                    icon: FontAwesomeIcons.clock,
                    onTap: () async => await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay(
                          hour: _bloc.inicioDateC.value?.hour ?? 0,
                          minute: _bloc.inicioDateC.value?.minute ?? 0),
                    ).then(
                      (onValue) {
                        if (onValue != null) {
                          _bloc.inicioDateC.add(
                            DateTime(
                              _bloc.inicioDateC.value?.year,
                              _bloc.inicioDateC.value?.month,
                              _bloc.inicioDateC.value?.day,
                              onValue?.hour,
                              onValue?.minute,
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                children: <Widget>[
                  DatePicker(
                    controller: _bloc.terminoDateController,
                    hintText: 'Data Término',
                    icon: FontAwesomeIcons.calendarAlt,
                    onTap: () async => _bloc.terminoDateC.add(
                      await showDatePicker(
                        context: context,
                        locale: Locale('pt'),
                        initialDate: today,
                        firstDate: today.add(Duration(days: -1)),
                        lastDate: today.add(Duration(days: 365)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TimePicker(
                    dateController: _bloc.terminoDateC,
                    textController: _bloc.terminoTimeController,
                    hintText: 'Hora Fim',
                    icon: FontAwesomeIcons.clock,
                    onTap: () async => await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay(
                          hour: _bloc.terminoDateC.value?.hour ?? 0,
                          minute: _bloc.terminoDateC.value?.minute ?? 0),
                    ).then(
                      (onValue) => _bloc.terminoDateC.add(
                        DateTime(
                          _bloc.terminoDateC.value?.year,
                          _bloc.terminoDateC.value?.month,
                          _bloc.terminoDateC.value?.day,
                          onValue?.hour,
                          onValue?.minute,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Text('detalhes:'.toUpperCase(),
          style: TextStyle(
            fontSize: 16,
            color: theme.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        CustomTextField(
          hintText: 'Local do evento',
          
          icon: FontAwesomeIcons.mapMarkerAlt,
          controller: _bloc.localController,
        ),
        const SizedBox(height: 10),
        CustomTextField(
          hintText: 'Observações',
          icon: FontAwesomeIcons.infoCircle,
          controller: _bloc.obsController,
        ),
      ],
    );
  }
}
