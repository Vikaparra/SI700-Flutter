import 'package:flutter_bloc/flutter_bloc.dart';
import '../../model/medicines.dart';
import '../../provider/firebase_firestore.dart';
import 'medmonitor_event.dart';
import 'medmonitor_state.dart';

class MedMonitorBloc extends Bloc<MedMonitorEvent, MedMonitorState> {
  MedicineCollection medicineCollection = MedicineCollection();

  MedMonitorBloc() : super(MedMonitorState(medicineCollection: MedicineCollection())) {
    // Leitura da Stream:
    FirestoreServer.helper.stream_medic.listen((event) {
      medicineCollection = event;
      // add(UpdateList());
    });

    on<AskNewList>((event, emit) async {
      medicineCollection = await FirestoreServer.helper.getMedicList();
      emit(MedMonitorState(medicineCollection: medicineCollection));
    });

    add(AskNewList());
  }
}