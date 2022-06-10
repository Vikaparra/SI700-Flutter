import '../model/userinfo.dart';

abstract class ManageState {}

class InsertState extends ManageState {}

class UpdateState extends ManageState {
  String noteId;
  UserInfo previousUserInfo;
  UpdateState({required this.noteId, required this.previousUserInfo});
}
