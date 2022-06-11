import '../model/userinfo.dart';

abstract class ManageEvent {}

// class SubmitEvent extends ManageEvent {
//   UserInfo userInfo;
//   SubmitEvent({required this.userInfo});
// }

class DeleteEvent extends ManageEvent {
  String userInfoId;
  DeleteEvent({required this.userInfoId});
}

class UpdateRequest extends ManageEvent {
  String userInfoId;
  UserInfo previousUserInfo;
  UpdateRequest({required this.userInfoId, required this.previousUserInfo});
}

class UpdateCancel extends ManageEvent {}
