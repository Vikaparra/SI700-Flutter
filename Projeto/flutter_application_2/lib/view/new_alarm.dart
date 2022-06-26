import 'package:flutter/material.dart';
import 'package:flutter_application_2/bloc/act/act_bloc.dart';
import 'package:flutter_application_2/components/rounded_button.dart';
import 'package:flutter_application_2/view/constants.dart';
import 'package:flutter_application_2/view/new_alarm_consulta.dart';
import 'package:flutter_application_2/view/new_alarm_exercicio.dart';
import 'package:flutter_application_2/view/new_alarm_lazer.dart';
import 'package:flutter_application_2/view/new_alarm_remedio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewAct extends StatelessWidget {
  const NewAct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: null,
      body: NewActState(),
      //resizeToAvoidBottomInset: false,
    );
  }
}

class NewActState extends StatelessWidget {
  const NewActState({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        // base com background azul

        width: MediaQuery.of(context).size.height * 1,
        decoration: const BoxDecoration(
          color: Color(0xff6a9cfd),
        ),
        child: Column(
            // estarão alinhadas verticalmente
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              title(), // titulo fora do container branco
              Container(
                // container branco com bordas arredondadas, dentro dele estarão as categorias de alarmes
                padding: const EdgeInsets.only(
                    left: 10.0, top: 0, right: 10.0, bottom: 00),
                width: MediaQuery.of(context).size.height * 1,
                height: MediaQuery.of(context).size.height * 0.75,
                decoration: const BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                    )),
                child: Column(children: [
                  const Padding(
                    padding: EdgeInsets.only(
                        left: 15.0, top: 20, right: 15.0, bottom: 00),
                  ),
                  RoundedButton(
                    // botão para adicionar alarme de lazer
                    text: 'LAZER',
                    textColor: kWhiteColor,
                    color: kGreenColor,
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const NewLazer();
                          },
                        ),
                      );
                    },
                  ),
                  RoundedButton(
                    // botão para adicionar alarme de consulta
                    text: 'CONSULTA',
                    textColor: kWhiteColor,
                    color: kPinkColor,
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => MultiBlocProvider(providers: [
                                  BlocProvider<ManageBloc>.value(
                                      value:
                                          BlocProvider.of<ManageBloc>(context),
                                      child: const NewConsulta()),
                                ], child: const NewConsulta())
                            // builder: (context) {
                            //   return NewConsulta();
                            // },
                            ),
                      );
                    },
                  ),
                  RoundedButton(
                    // botão para adicionar alarme de remedio
                    text: 'REMÉDIO',
                    textColor: kWhiteColor,
                    color: kOrangeColor,
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const NewRemed();
                          },
                        ),
                      );
                    },
                  ),
                  RoundedButton(
                    // botão para adicionar alarme de exercicio
                    text: 'EXERCÍCIO',
                    textColor: kWhiteColor,
                    color: kSecondColor,
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const NewAExec();
                          },
                        ),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 0, top: 30, right: 0, bottom: 00),
                    child: Image.asset(
                      // imagem decorativa
                      'assets/images/senhor.png',
                      width: 230,
                    ),
                  )
                ]),
              )
            ]));
  }
}

Widget title() {
  return Container(
    margin: const EdgeInsets.only(left: 60.0, top: 30, bottom: 15),
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
