import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/userinfos.dart';
import '../provider/firebase_firestore.dart';
import 'monitor_event.dart';
import 'monitor_state.dart';

class MonitorBloc extends Bloc<MonitorEvent, MonitorState> {
  UserInfos userInfos = UserInfos();

  MonitorBloc() : super(MonitorState(userInfos: UserInfos())) {
    // Leitura da Stream:
    FirestoreServer.helper.stream.listen((event) {
      userInfos = event;
      add(UpdateList());
    });

    on<AskNewList>((event, emit) async {
      userInfos = await FirestoreServer.helper.getNoteList();
      emit(MonitorState(userInfos: userInfos));
    });

    on<UpdateList>((event, emit) {
      emit(MonitorState(userInfos: userInfos));
    });

    add(AskNewList());
  }
}
