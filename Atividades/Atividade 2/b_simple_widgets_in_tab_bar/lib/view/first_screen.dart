import 'package:flutter/material.dart';

class MyFirstScreen extends StatefulWidget {
  const MyFirstScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyFirstScreenState createState() => _MyFirstScreenState();
}

class _MyFirstScreenState extends State<MyFirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        //container tela inteira
        decoration: const BoxDecoration(
          color: Color.fromARGB(158, 147, 190, 255),
        ),
        width: double.infinity,

        child: Column(
          //colunas
          children: [contrainedFitted(), containerComFirula(), informationVi()],
        ),
        padding: const EdgeInsets.all(15),
      ),
    );
  }
}

Widget contrainedFitted() {
  return ConstrainedBox(
    constraints: const BoxConstraints(
      minWidth: 35,
      minHeight: 35,
    ),
    child: const FittedBox(
      fit: BoxFit.fill,
      child: Text("Vitória Parra",
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          )),
    ),
  );
}

Widget containerComFirula() {
  return Container(
    width: 200,
    height: 200,
    decoration: BoxDecoration(
      color: Colors.red,
      borderRadius: BorderRadius.circular(30),
      boxShadow: const [BoxShadow(color: Colors.grey, blurRadius: 20)],
      gradient: const LinearGradient(
          colors: [Colors.blue, Colors.red, Colors.yellow, Colors.green]),
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.asset(
        'assets/images/vika.jpg',
      ),
    ),
    padding: const EdgeInsets.all(15),
    margin: const EdgeInsets.all(10),
  );
}

Widget informationVi() {
  return Container(
    decoration: BoxDecoration(
      color: Colors.blueAccent,
      borderRadius: BorderRadius.circular(15),
    ),
    child: const SizedBox(
      width: 300,
      child: Text(
        "Aluna do 5º semestre de Sistema de Informação, moro em Limeira e ocasionalmente em Indaiatuba, Barão Geraldo, São Paulo e Rio Claro (posso ser considerada nomade?). Tenho um cachorro em Indaiatuba e ele é um baita de um babão.",
        textAlign: TextAlign.justify,
        style:
            TextStyle(fontSize: 18, color: Colors.black, fontFamily: 'Roboto'),
      ),
    ),
    padding: const EdgeInsets.all(10),
    margin: const EdgeInsets.all(15),
  );
}
