import 'package:flutter_bloc/flutter_bloc.dart';

import '../../provider/firebase_firestore.dart';
import 'medicine_event.dart';
import 'medicine_state.dart';

class MedManageBloc extends Bloc<MedManageEvent, MedManageState> {
  MedManageBloc() : super(InsertState()) {
   on<MedSubmitEvent>((event, emit) {
    if (state is InsertState) {
      //ToDo: Inserir uma chamada de insert
      FirestoreServer.helper.insertMedic(event.medic);
    }
  });

  }
}
