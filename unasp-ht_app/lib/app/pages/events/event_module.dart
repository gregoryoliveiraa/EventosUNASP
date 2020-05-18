import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:unasp_ht/app/app_module.dart';
import 'package:unasp_ht/app/pages/events/event_bloc.dart';
import 'package:unasp_ht/app/pages/events/event_form_bloc.dart';
import 'package:unasp_ht/app/pages/events/event_page.dart';
import 'package:unasp_ht/app/pages/events/event_repository.dart';
import 'package:unasp_ht/app/pages/events/new_event_bloc.dart';


class EventModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc<EventBloc>(
            (i) => EventBloc(i.getDependency<EventRepository>())),
        Bloc<NewEventBloc>(
            (i) => NewEventBloc(i.getDependency<EventRepository>())),
        Bloc<EventFormBloc>((i) => EventFormBloc())
      ];

  @override
  List<Dependency> get dependencies => [
        Dependency<EventRepository>((i) =>
            EventRepository(AppModule.to.getDependency<Firestore>()))
      ];

  @override
  Widget get view => EventPage();

  static Inject get to => Inject<EventModule>.of();
}
