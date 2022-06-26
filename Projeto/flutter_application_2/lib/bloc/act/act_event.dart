import 'package:flutter_application_2/model/appointment.dart';

abstract class ManageEvent {}

class SubmitEvent extends ManageEvent {
  Appoint appoint;
  SubmitEvent({required this.appoint});
}