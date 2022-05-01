import 'package:flutter/material.dart';
import 'package:flutter_application_2/components/rounded_button.dart';
import 'package:flutter_application_2/view/date_time_picker.dart';
import 'package:flutter_application_2/view/login_screen.dart';

import 'constants.dart';

class Signup extends StatelessWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(appBar: null, body: TelaCadastroCuidador());
  }
}

class TelaCadastroCuidador extends StatelessWidget {
  const TelaCadastroCuidador({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 1,
      decoration: const BoxDecoration(
        color: Color(0xff6a9cfd),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          tituloPaginaCadastro(context),
          Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
              height: MediaQuery.of(context).size.height * 0.82,
              decoration: const BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                  )),
              child: const FormularioCad())
        ],
      ),
    );
  }
}

Widget tituloPaginaCadastro(context) {
  return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.1,
      child: const DefaultTextStyle(
        style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.normal,
            color: Colors.black,
            fontFamily: "Comfortaa"),
        child: Text(
          """CADASTRE-SE
Cuidador""",
          textAlign: TextAlign.start,
        ),
      ));
}

class FormularioCad extends StatefulWidget {
  const FormularioCad({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return FormularioState();
  }
}

class FormularioState extends State<FormularioCad> {
  int parenteCuidador = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
            color: Color(0xffffffff),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(0),
            )),
        child: CustomScrollView(clipBehavior: Clip.hardEdge, slivers: [
          SliverToBoxAdapter(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const TextField(
                    decoration: InputDecoration(labelText: 'Nome Completo'),
                    keyboardType: TextInputType.name,
                  ),
                  const TextField(
                    decoration: InputDecoration(labelText: 'Telefone'),
                    keyboardType: TextInputType.number,
                  ),
                  const TextField(
                    decoration: InputDecoration(labelText: 'CPF'),
                    keyboardType: TextInputType.number,
                  ),
                  const TextField(
                    decoration: InputDecoration(labelText: 'Email'),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const TextField(
                    decoration: InputDecoration(labelText: 'Senha'),
                    keyboardType: TextInputType.none,
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                  ),
                  const TextField(
                    decoration: InputDecoration(labelText: 'Confirmar Senha'),
                    keyboardType: TextInputType.none,
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    const Text(
                      "Profissional",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          fontFamily: "Comfortaa"),
                    ),
                    Radio(
                        value: 1,
                        groupValue: parenteCuidador,
                        onChanged: (int? inValue) {
                          if (inValue != null) {
                            setState(() {
                              parenteCuidador = inValue;
                            });
                          }
                        }),
                  ]),
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    const Text(
                      "Parente",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          fontFamily: "Comfortaa"),
                    ),
                    Radio(
                        value: 2,
                        groupValue: parenteCuidador,
                        onChanged: (int? inValue) {
                          if (inValue != null) {
                            setState(() {
                              parenteCuidador = inValue;
                            });
                          }
                        })
                  ]),
                ]),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                RoundedButton(
                  text: 'CADASTRAR',
                  textColor: kWhiteColor,
                  color: kSecondColor,
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  },
                ),
              ],
            ),
          )
        ]));
  }
}
