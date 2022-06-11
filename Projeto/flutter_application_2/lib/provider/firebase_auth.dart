import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_2/model/userinfo.dart';

import '../model/user_model.dart';

class FirebaseAuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Stream<UserModel?> get user {
    return _firebaseAuth.authStateChanges().map((event) {
      print(event?.email);
      return _userFromFirebaseUser(event);
    });
  }

  UserModel? _userFromFirebaseUser(User? user) {
    return user != null ? UserModel(user.uid) : null;
  }

  Future<UserModel?> signInWithEmailAndPassword(
      String email, String password) async {
    UserCredential userCredential = await _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password);
    User? user = userCredential.user;

    return _userFromFirebaseUser(user);
  }

  Future<UserModel?> createUserWithEmailAndPassword(
      String email, String password, userInfo) async {
    print("--------------create 1----------------");
    UserCredential userCredential = await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);
    User? user = userCredential.user;

    return _userFromFirebaseUser(user);
  }

  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }
}
