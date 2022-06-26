import 'package:flutter_bloc/flutter_bloc.dart';

import '../../provider/firebase_firestore.dart';
import 'act_event.dart';
import 'act_state.dart';

class ManageBloc extends Bloc<ManageEvent, ManageState> {
  ManageBloc() : super(InsertState()) {
   on<SubmitEvent>((event, emit) {
    if (state is InsertState) {
      //ToDo: Inserir uma chamada de insert
      FirestoreServer.helper.insertAppoint(event.appoint);
    }
  });

  }
}
