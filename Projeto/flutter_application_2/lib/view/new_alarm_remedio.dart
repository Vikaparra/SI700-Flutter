// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_2/components/rounded_button.dart';
import 'package:flutter_application_2/view/constants.dart';
import 'package:flutter_application_2/view/date_time_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/act/act_bloc.dart';
import '../bloc/act/act_event.dart';
import '../model/appointment.dart';

class NewRemed extends StatelessWidget {
  const NewRemed({Key? key}) : super(key: key);

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
      child: Container( //Background com color da atividade:  Verde
        decoration: const BoxDecoration(
          color: kOrangeColor,
        ),
        child: Column(
          children: [
            title(),
            Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [FormularioCad()])
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
            'NOVO REMÉDIO',
            textAlign: TextAlign.start,
          ),
        )),
  );
}


class FormularioCad extends StatefulWidget {
  // formulario de cadastro
  const FormularioCad({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return FormAct();
  }
}

class FormAct extends State<FormularioCad> {
  final GlobalKey<FormState> formKey = GlobalKey();
  Appoint appointInfo = Appoint();
  DateTime dateTime = DateTime(0, 0, 0, 0, 0);

  @override
  //Form de cadastro
  Widget build(BuildContext context) {
    return Container(
        // key: formKey,
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
        child: Form(
            key: formKey,
            child: Column(
              // key: formKey,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 20.0),
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'Título'),
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Adicione algum título";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      appointInfo.title = value!;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: TextFormField(
                    // initialValue: appointInfo.description,
                    decoration: const InputDecoration(labelText: 'Descrição'),
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Adicione alguma descrição";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      appointInfo.description = value!;
                    },
                  ),
                ),
                const DatePicker(),
                const TimePicker(),
                RoundedButton(
                    text: "CADASTRAR",
                    textColor: kWhiteColor,
                    color: kOrangeColor,
                    press: () async {
                      if (alarmDate!.year != 0001) {
                        DateTime? finalAlarm = DateTime(
                            alarmDate!.year,
                            alarmDate!.month,
                            alarmDate!.day,
                            alarmTime!.hour,
                            alarmTime!.minute);
                        appointInfo.date = finalAlarm;
                        appointInfo.type = "remedio";
                        // print("teste: "+ (alarmDate!.day.toString()));
                        formKey.currentState!.save();
                        print("-------- Informacao inserida -------");
                        print(appointInfo);
                        print(appointInfo.title);
                        print(appointInfo.description);
                        print(appointInfo.date.toString());
                        print("------------------------------------");
                        BlocProvider.of<ManageBloc>(context)
                            .add(SubmitEvent(appoint: appointInfo));
                        formKey.currentState!.reset();
                        // }
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          //Adicionando snackbar ao cadastrar
                          backgroundColor: kOrangeColor,
                          duration: Duration(seconds: 1),
                          content: Text("ATIVIDADE SALVA",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ));
                      }
                    })
              ],
            )));
  }
}

