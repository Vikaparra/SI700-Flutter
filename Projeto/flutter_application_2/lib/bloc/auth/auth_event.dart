import '../../model/user_model.dart';
import '../../model/userinfo.dart';

abstract class AuthEvent {}

class RegisterUser extends AuthEvent {
  String username;
  String password;
  UserInfo userInfo;
  RegisterUser({required this.username, required this.password, required this.userInfo});  
}

class LoginUser extends AuthEvent {
  String username;
  String password;

  LoginUser({required this.username, required this.password});
}

// class LoginAnonymousUser extends AuthEvent {}

class Logout extends AuthEvent {}

class AuthServerEvent extends AuthEvent {
  final UserModel? userModel;
  AuthServerEvent(this.userModel);
}
