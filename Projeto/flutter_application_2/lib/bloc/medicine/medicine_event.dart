import 'package:flutter_application_2/model/medicine.dart';

abstract class MedManageEvent {}

class MedSubmitEvent extends MedManageEvent {
  Medic medic;
  MedSubmitEvent({required this.medic});
}