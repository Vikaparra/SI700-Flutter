import 'package:flutter/material.dart';
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
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height * 1,
        decoration: const BoxDecoration(
          color: Color(0xff6a9cfd),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            tituloPaginaCadastro(),
            Container(
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
      ),
    );
  }
}

Widget tituloPaginaCadastro() {
  return const SizedBox(
      width: double.infinity,
      child: DefaultTextStyle(
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
  bool parente = false;
  bool profissional = false;
  @override
  Widget build(BuildContext context) {
    return Container(
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
            const Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: TextField(
                decoration: InputDecoration(labelText: 'Nome Completo'),
                keyboardType: TextInputType.name,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: TextField(
                decoration: InputDecoration(labelText: 'Telefone'),
                keyboardType: TextInputType.number,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: TextField(
                decoration: InputDecoration(labelText: 'CPF'),
                keyboardType: TextInputType.number,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: TextField(
                decoration: InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: TextField(
                decoration: InputDecoration(labelText: 'Senha'),
                keyboardType: TextInputType.none,
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 25.0),
              child: TextField(
                decoration: InputDecoration(labelText: 'Confirmar Senha'),
                keyboardType: TextInputType.none,
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 25.0),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Text(
                  "Profissional",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      fontFamily: "Comfortaa"),
                ),
                Checkbox(
                    value: profissional,
                    onChanged: (bool? inValue) {
                      if (inValue != null) {
                        setState(() {
                          profissional = inValue;
                        });
                      }
                    }),
                const Text(
                  "Parente",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      fontFamily: "Comfortaa"),
                ),
                Checkbox(value: parente, onChanged: (bool? inValue) {
                      if (inValue != null) {
                        setState(() {
                          parente = inValue;
                        });
                      }
                    })
              ]),
            ),
            ElevatedButton(
              child: const Text(
                'CADASTRAR',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    fontFamily: "Comfortaa"),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Login()),
                );
              },
            )
          ],
        ));
  }
}
