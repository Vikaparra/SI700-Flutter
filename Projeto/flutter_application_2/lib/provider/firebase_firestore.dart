import '../model/userinfo.dart';
import '../model/userinfos.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreServer {
  // Atributo que irá afunilar todas as consultas
  static FirestoreServer helper = FirestoreServer._createInstance();
  // Construtor privado
  FirestoreServer._createInstance();

  // uid do usuário logado
  String? uid;

  // Ponto de acesso com o servidor
  final CollectionReference userInfo =
      FirebaseFirestore.instance.collection("information");

  Future<void> getNote() async {
    //print("UID DENTRO FUNC");
    //print(uid);
    // DocumentSnapshot doc = await userInfo.doc(uid).collection("user_information").doc(userId).get();
    //------------------------------------------
    print("------___________________-------");
    print(uid);
    var query = userInfo.doc(uid).collection("user_information");
    print(query);
    query.get().then((QuerySnapshot querySnapshot) => {
          querySnapshot.docs.map((DocumentSnapshot documentSnapshot) => {
                //print(documentSnapshot.id);
                print("------------------oi-----------")
              })
        });
    //------------------------------------------
    // UserInfo note = UserInfo.fromMap(doc.data());
    // return note;
  }

  Future<int> insertNote(UserInfo note) async {
    print(uid);
    await userInfo.doc(uid).collection("user_information").add({
      "Nome": note.name,
      "Telefone": note.tel,
      "Nascimento": note.birthDate,
      "CPF": note.cpf,
      "email": note.email,
      "password": note.password,
      "cuidador": note.cuidador
    });
    return 42;
  }

  Future<int> updateNote(noteId, UserInfo note) async {
    await userInfo.doc(uid).collection("user_information").doc(noteId).update({
      "Nome": note.name,
      "Telefone": note.tel,
      "Nascimento": note.birthDate,
      "CPF": note.cpf,
      "email": note.email,
      "password": note.password,
      "cuidador": note.cuidador
    });
    return 42;
  }

  Future<int> deleteNote(noteId) async {
    await userInfo.doc(uid).collection("user_information").doc(noteId).delete();
    return 42;
  }

  UserInfos _noteListFromSnapshot(QuerySnapshot snapshot) {
    UserInfos userInfos = UserInfos();
    for (var doc in snapshot.docs) {
      UserInfo userInfo = UserInfo.fromMap(doc.data());
      userInfos.insertUserInfoOfId(doc.id, userInfo);
    }
    return userInfos;
  }

  Future<UserInfos> getNoteList() async {
    QuerySnapshot snapshot =
        await userInfo.doc(uid).collection("user_information").get();

    return _noteListFromSnapshot(snapshot);
  }

  Stream get stream {
    return userInfo
        .doc(uid)
        .collection("user_information")
        .snapshots()
        .map(_noteListFromSnapshot);
  }
}
