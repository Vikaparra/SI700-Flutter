import 'package:flutter/material.dart';
import 'package:flutter_application_2/view/calendar.dart';

class Signup extends StatelessWidget {
  const Signup({ Key? key }) : super(key: key);

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
        decoration: const BoxDecoration(
          color: Color(0xff6a9cfd),
        ),
        child: Column(
          children: [
            tituloPaginaCadastro(),
            Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [formularioCadastro(context)])
          ],
        ),
      ),
    );
  }
}

Widget tituloPaginaCadastro() {
  return Container(
      margin: const EdgeInsets.only(left: 60.0, top: 20, bottom: 10),
      child: const SizedBox(
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
          )));
}

Widget formularioCadastro(BuildContext context) {
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
                MaterialPageRoute(builder: (context) => const Principal()),
              );
            },
          )
        ],
      ));
}
