import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/subjects.dart';
import 'package:unasp_ht/app/app_bloc.dart';
import 'package:unasp_ht/app/app_module.dart';
import 'package:unasp_ht/app/pages/events/event_form_bloc.dart';
import 'package:unasp_ht/app/pages/events/event_model.dart';
import 'package:unasp_ht/app/pages/events/event_module.dart';
import 'package:unasp_ht/app/pages/events/event_repository.dart';

class NewEventBloc extends BlocBase {
  final EventRepository _repository;
  final EventFormBloc formBloc = EventModule.to.getBloc<EventFormBloc>();
  final BehaviorSubject<bool> isLoadingController = BehaviorSubject<bool>.seeded(false);

  NewEventBloc(this._repository);

  Future<bool> sendEventos() async {isLoadingController.add(true);
    return await _repository.post(Eventos(
        formBloc.tituloController.text,
        formBloc.inicioDateC.value,
        formBloc.terminoDateC.value,
        formBloc.localController.text,
        formBloc.obsController.text,
        EventStatus.pendente,
        AppModule.to.getBloc<AppBloc>().currentUser.value.uid,
        formBloc.zraController.text,   
      ),
    );
  }

  @override
  void dispose() {
    isLoadingController.close();
    super.dispose();
  }
}
