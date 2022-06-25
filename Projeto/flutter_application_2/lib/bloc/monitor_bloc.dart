import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/userinfo.dart';
import '../provider/firebase_firestore.dart';
import 'monitor_event.dart';
import 'monitor_state.dart';

class MonitorBloc extends Bloc<MonitorEvent, MonitorState> {
  UserInfo userInfo = UserInfo();

  MonitorBloc() : super(MonitorState(userInfo: UserInfo())) {
    // Leitura da Stream:
    FirestoreServer.helper.stream.listen((event) {
      print('-----------------------------');
      print('ADICIONANDO USER:');
      print('-----------------------------');
      userInfo = event;
      add(UpdateList());
    });

    on<AskNewList>((event, emit) async {
      userInfo = await FirestoreServer.helper.getNote();
      emit(MonitorState(userInfo: userInfo));
    });

    on<UpdateList>((event, emit) {
      print('-----------------------------');
      print('nome:');
      emit(MonitorState(userInfo: userInfo));
    });

    add(AskNewList());
  }
}
