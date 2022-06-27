import 'package:flutter_application_2/model/appointment.dart';

import '../model/appointments.dart';
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

  Future<UserInfo> getNote() async {
    DocumentSnapshot doc = await userInfo
        .doc(uid)
        .collection("user_information")
        .doc('user')
        .get();
    if (doc.exists) {
      UserInfo note = UserInfo.fromMap(doc.data());
      print("--- Pegando informacoes de: " + note.name + " ---");
      // print(query);
      return note;
    } else {
      print("----------- Usuario nao existe ------------");
      UserInfo user = UserInfo();
      return user;
    }
  }

  Future<int> insertNote(UserInfo note) async {
    print(uid);
    await userInfo.doc(uid).collection("user_information").doc('user').set({
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

  Future<int> updateUserInfo(note, String attribute) async {
    switch (attribute) {
      case 'Nome':
        await userInfo
            .doc(uid)
            .collection("user_information")
            .doc('user')
            .update({
          "Nome": note,
        });
        break;
      case 'Telefone':
        await userInfo
            .doc(uid)
            .collection("user_information")
            .doc('user')
            .update({
          "Telefone": note,
        });
        break;
      case 'Nascimento':
        await userInfo
            .doc(uid)
            .collection("user_information")
            .doc('user')
            .update({"Nascimento": note});
        break;
      default:
    }

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

  //coletando appoints
  final CollectionReference appointCollection = FirebaseFirestore.instance.collection("appoints");
  
  Future<Appoint> getAppoint(appointId) async {
    DocumentSnapshot doc = await appointCollection
        .doc(uid)
        .collection("appoints")
        .doc(appointId)
        .get();
    Appoint appoint = Appoint.fromMap(doc.data());
    return appoint;
  }

  Future<int> insertAppoint(Appoint appoint) async {
    await appointCollection.doc(uid).collection("appoints").add({
      "title": appoint.title,
      "description": appoint.description,
      "date": appoint.date,
      "type": appoint.type,
      //"time":appoint.time
    });
    return 42;
  }

  AppointCollection _appointListFromSnapshot(QuerySnapshot snapshot) {
    AppointCollection appointCollection = AppointCollection();
    for (var doc in snapshot.docs) {
      Appoint appoint = Appoint.fromMap(doc.data());
      appointCollection.insertAppointOfId(doc.id, appoint);
    }
    return appointCollection;
  }

  Future<AppointCollection> getAppointList() async {
    QuerySnapshot snapshot = await appointCollection.doc(uid).collection("appoints").get();

    return _appointListFromSnapshot(snapshot);
  }

  Stream get stream {
    return userInfo
        .doc(uid)
        .collection("user_information")
        .snapshots()
        .map(_noteListFromSnapshot);
  }

  Stream get stream_appoint {
    return appointCollection
        .doc(uid)
        .collection("appoints")
        .snapshots()
        .map(_appointListFromSnapshot);
  }
}

// Stream<List<Users>> readUsers()=> FirebaseFirestore.instance.collection('appoints'.snapshots().map((snapahot)=>snapshot.docs.map))
