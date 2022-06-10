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
  final CollectionReference noteCollection =
      FirebaseFirestore.instance.collection("information");

  Future<UserInfo> getNote(noteId) async {
    DocumentSnapshot doc = await noteCollection
        .doc(uid)
        .collection("user_information")
        .doc(noteId)
        .get();
    UserInfo note = UserInfo.fromMap(doc.data());
    return note;
  }

  Future<int> insertNote(UserInfo note) async {
    await noteCollection.doc(uid).collection("user_information").add({
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
    await noteCollection
        .doc(uid)
        .collection("user_information")
        .doc(noteId)
        .update({
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
    await noteCollection
        .doc(uid)
        .collection("user_information")
        .doc(noteId)
        .delete();
    return 42;
  }

  NoteCollection _noteListFromSnapshot(QuerySnapshot snapshot) {
    NoteCollection noteCollection = NoteCollection();
    for (var doc in snapshot.docs) {
      UserInfo note = UserInfo.fromMap(doc.data());
      noteCollection.insertUserInfoOfId(doc.id, note);
    }
    return noteCollection;
  }

  Future<NoteCollection> getNoteList() async {
    QuerySnapshot snapshot =
        await noteCollection.doc(uid).collection("user_information").get();

    return _noteListFromSnapshot(snapshot);
  }

  Stream get stream {
    return noteCollection
        .doc(uid)
        .collection("user_information")
        .snapshots()
        .map(_noteListFromSnapshot);
  }
}
