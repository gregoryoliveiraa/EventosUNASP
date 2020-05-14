import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/subjects.dart';
import 'package:unasp_ht/app/app_bloc.dart';
import 'package:unasp_ht/app/app_module.dart';
import 'package:unasp_ht/app/pages/events/event_form_bloc.dart';
import 'package:unasp_ht/app/pages/events/event_model.dart';
import 'package:unasp_ht/app/pages/events/event_module.dart';
import 'package:unasp_ht/app/pages/events/event_repository.dart';

class NewDepartureBloc extends BlocBase {
  final DeparturesRepository _repository;
  final DepartureFormBloc formBloc = EventModule.to.getBloc<DepartureFormBloc>();

  final BehaviorSubject<bool> isLoadingController =
      BehaviorSubject<bool>.seeded(false);

  NewDepartureBloc(this._repository);

  Future<bool> sendDeparture() async {
    isLoadingController.add(true);
    return await _repository.post(
      Departure(
        formBloc.inicioDateC.value,
        formBloc.terminoDateC.value,
        formBloc.localController.text,
        formBloc.obsController.text,
        DepartureStatus.solicitado,
        AppModule.to.getBloc<AppBloc>().currentUser.value.uid,
      ),
    );
  }

  @override
  void dispose() {
    isLoadingController.close();
    super.dispose();
  }
}
