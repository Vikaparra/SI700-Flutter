import 'package:flutter/material.dart';

class MyThirdScreen extends StatelessWidget {
  const MyThirdScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return presentationScreen();
  }
}

Widget presentationScreen() {
  return Container(
    decoration: BoxDecoration(
      color: Colors.indigo[200],
      borderRadius: BorderRadius.circular(15),
    ),
    child: Column(
      children: [
        image(),
        const SizedBox(height: 15),
        const Text("CUIDADOR ONLINE",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            )),
        content(),
      ],
    ),
    margin: const EdgeInsets.all(10),
  );
}

Widget image() {
  return SizedBox(
    width: double.infinity,
    height: 100,
    child: ClipRRect(
        borderRadius: const BorderRadius.vertical(
            top: Radius.circular(10), bottom: Radius.circular(0)),
        child: FittedBox(
            fit: BoxFit.fitWidth,
            child: Image.asset(
              'assets/images/cuidador.gif',
            ))),
  );
}

Widget content() {
  return Container(
    width: 350,
    height: 300,
    decoration: BoxDecoration(
      color: Colors.white24,
      borderRadius: BorderRadius.circular(15),
    ),
    child: const SizedBox(
      width: double.infinity,
      // height: double.infinity,
      child: Text(
        "O aplicativo visa o acompanhamento de idosos por parte de seus cuidadores (familiar ou contratado). Haverá a supervisão de remédios, calendário de consultas, informações de alergias, doenças e outras condições médicas.",
        textAlign: TextAlign.justify,
          style: TextStyle(
              fontSize: 20, 
              color: Colors.black, 
              fontFamily: 'Roboto'),
      ),
    ),
    padding: const EdgeInsets.all(10),
    margin: const EdgeInsets.all(15),
  );
}
