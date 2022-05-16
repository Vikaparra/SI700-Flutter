import '/bloc/manage_event.dart';
import '/provider/rest_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'manage_state.dart';

class ManageBloc extends Bloc<ManageEvent, ManageState> {
  ManageBloc() : super(InsertState()) {
    on<SubmitEvent>((event, emit) {
      if (state is InsertState) {
        //ToDo: Inserir uma chamada de insert
        RestServer.helper.insertProfile(event.profile);
      }
    });
  }
}
