import '../model/profile.dart';

abstract class ManageEvent {}

class SubmitEvent extends ManageEvent {
  Profile profile;
  SubmitEvent({required this.profile});
}
