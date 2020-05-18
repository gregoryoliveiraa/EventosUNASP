import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';
import 'package:unasp_ht/app/pages/events/event_model.dart';
import 'package:unasp_ht/app/pages/events/event_repository.dart';

class EventBloc extends BlocBase {
  final EventRepository _repository;

  EventBloc(this._repository) {
    getEventos();
  }

  final BehaviorSubject<List<Eventos>> 
    eventos = BehaviorSubject<List<Eventos>>();

  void getEventos() => _repository.getEventos().then((onValue) {
        eventos.add(onValue);
      });

  @override
  void dispose() {
    eventos.close();
    super.dispose();
  }
}
