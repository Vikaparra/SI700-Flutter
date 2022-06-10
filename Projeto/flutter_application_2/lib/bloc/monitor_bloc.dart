import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/userinfos.dart';
import '../provider/firebase_firestore.dart';
import 'monitor_event.dart';
import 'monitor_state.dart';

class MonitorBloc extends Bloc<MonitorEvent, MonitorState> {
  NoteCollection noteCollection = NoteCollection();

  MonitorBloc() : super(MonitorState(noteCollection: NoteCollection())) {
    // Leitura da Stream:
    FirestoreServer.helper.stream.listen((event) {
      noteCollection = event;
      add(UpdateList());
    });

    on<AskNewList>((event, emit) async {
      noteCollection = await FirestoreServer.helper.getNoteList();
      emit(MonitorState(noteCollection: noteCollection));
    });

    on<UpdateList>((event, emit) {
      emit(MonitorState(noteCollection: noteCollection));
    });

    add(AskNewList());
  }
}
