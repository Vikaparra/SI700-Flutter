import 'package:flutter/material.dart';

class MySecondScreen extends StatelessWidget {
  const MySecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container( //container tela inteira
      decoration: const BoxDecoration(
      color: Color.fromARGB(158, 147, 190, 255),
    ),
      width: double.infinity,  

        child: Column( //colunas 
          children: [
            contrainedFitted(), 
            containerComFirula(),            
            informationMy()
          ],
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
      child: Text("Myrelle Lopes",
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
    // child: const SizedBox(
    //   width: double.infinity,
    //   height: 70,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.asset(
          'assets/images/my.jpg',
      // ),
    ),
    ),
    padding: const EdgeInsets.all(15),
    margin: const EdgeInsets.all(10),
  );
}

Widget informationMy() {
  return Container(
    decoration: BoxDecoration(
      color: Colors.blueAccent,
      borderRadius: BorderRadius.circular(15),
    ),
    child: const SizedBox(
      width: 300,
      child: Text(
        "Aluna do 5º semestre de Sistema de Informação, moro em Paulínia - ocasionalmente em Limeira na casa das minhas amigas. Tenha uma gatinha <3 e estou cursando a disciplina de Mobile com o professor Ulisses Martins",
        textAlign: TextAlign.justify,
          style: TextStyle(
              fontSize: 18, 
              color: Colors.black, 
              fontFamily: 'Roboto'),
      ),
    ),
    padding: const EdgeInsets.all(10),
    margin: const EdgeInsets.all(15),
  );
}

