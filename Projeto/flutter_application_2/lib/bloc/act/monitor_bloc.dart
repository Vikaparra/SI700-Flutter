import 'package:flutter_bloc/flutter_bloc.dart';
import '../../model/appointments.dart';
import '../../provider/firebase_firestore.dart';
import 'monitor_event.dart';
import 'monitor_state.dart';

class MonitorBloc extends Bloc<MonitorEvent, MonitorState> {
  AppointCollection noteCollection = AppointCollection();

  MonitorBloc() : super(MonitorState(appointCollection: AppointCollection())) {
    // Leitura da Stream:
    FirestoreServer.helper.stream_appoint.listen((event) {
      noteCollection = event;
      // add(UpdateList());
    });

    on<AskNewList>((event, emit) async {
      noteCollection = await FirestoreServer.helper.getAppointList();
      emit(MonitorState(appointCollection: noteCollection));
    });

    add(AskNewList());
  }
}