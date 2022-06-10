// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_2/components/rounded_button.dart';
import 'package:flutter_application_2/view/constants.dart';
import 'package:flutter_application_2/view/date_time_picker.dart';

import '../provider/firebase_firestore.dart';

class NewConsulta extends StatelessWidget {
  const NewConsulta({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(appBar: null, body: ScreenAlarm());
  }
}

class ScreenAlarm extends StatelessWidget {
  const ScreenAlarm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        //Background com color da atividade:  Rosa
        decoration: const BoxDecoration(
          color: kPinkColor,
        ),

        child: Column(
          children: [
            title(),
            Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [formAct(context)])
          ],
        ),
      ),
    );
  }
}

Widget title() {
  return Container(
    margin: const EdgeInsets.only(left: 60.0, top: 50, bottom: 10),
    child: const SizedBox(
        width: double.infinity,
        child: DefaultTextStyle(
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.normal,
              color: Colors.black,
              fontFamily: "Comfortaa"),
          child: Text(
            'NOVA ATIVIDADE',
            textAlign: TextAlign.start,
          ),
        )),
  );
}

Widget formAct(BuildContext context) {
  //Form de cadastro
  return Container(
      height: MediaQuery.of(context).size.height * 1,
      padding: const EdgeInsets.all(40),
      decoration: const BoxDecoration(
          color: Color(0xffffffff),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(0),
          )),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 20.0),
            child: TextField(
              decoration: InputDecoration(labelText: 'Título'),
              keyboardType: TextInputType.name,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 20.0),
            child: TextField(
              decoration: InputDecoration(labelText: 'Descrição'),
              keyboardType: TextInputType.number,
            ),
          ),
          DatePicker(),
          TimePicker(),
          RoundedButton(
              text: "CADASTRAR",
              textColor: kWhiteColor,
              color: kPinkColor,
              press: () {
                var teste = FirestoreServer.helper.uid;
                print("uid");
                var uid = FirestoreServer.helper.getNote('1');
                print(uid);
                print('--------------');
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  //Adicionando snackbar ao cadastrar
                  backgroundColor: kPinkColor,
                  duration: const Duration(seconds: 1),
                  content: const Text("ATIVIDADE SALVA",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ));
              })
        ],
      ));
}
