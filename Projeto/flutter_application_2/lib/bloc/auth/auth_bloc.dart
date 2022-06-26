import 'package:flutter_bloc/flutter_bloc.dart';
import '../../provider/firebase_auth.dart';
import '../../provider/firebase_firestore.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuthenticationService _authenticationService =
      FirebaseAuthenticationService();

  AuthBloc() : super(Unauthenticated()) {
    _authenticationService.user.listen((event) {
      add(AuthServerEvent(event));
    });

    on<AuthServerEvent>((event, emit) async {
      if (event.userModel == null) {
        emit(Unauthenticated());
      } else {
        print("-----------auth------------");

        FirestoreServer.helper.uid = event.userModel!.uid;

        print(event.userModel!.uid);
        print(FirestoreServer.helper.uid);

        emit(Authenticated(userModel: event.userModel!));
      }
    });

    on<RegisterUser>((event, emit) async {
      try {
        print("-----------register1------------");
        await _authenticationService.createUserWithEmailAndPassword(
            event.username, event.password, event.userInfo);
        FirestoreServer.helper.insertNote(event.userInfo);
        FirestoreServer.helper.getNote();
        //salvar a nota aqui, que é certeza que a autenticação ja acabou
        print("--------------create 2----------------");
      } catch (e) {
        emit(AuthError(message: "Impossível Registrar: ${e.toString()}"));
      }
    });
    on<LoginUser>((event, emit) async {
      try {
        await _authenticationService.signInWithEmailAndPassword(
            event.username, event.password);
      } catch (e) {
        emit(AuthError(
            message:
                "Impossível Logar com ${event.username}: ${e.toString()}"));
      }
      FirestoreServer.helper.getNote();
    }
    );
    on<Logout>((event, emit) async {
      try {
        await _authenticationService.signOut();
      } catch (e) {
        emit(AuthError(message: "Impossível Efeturar Logout: ${e.toString()}"));
      }
    });
  }
}
