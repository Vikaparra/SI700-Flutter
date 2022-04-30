// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_2/view/constants.dart';
import 'package:flutter_application_2/view/edit_profile.dart';
import 'package:flutter_application_2/view/login_screen.dart';
import 'package:flutter_application_2/view/new_alarm.dart';

class Principal extends StatefulWidget {
  const Principal({Key? key}) : super(key: key);

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  var _currentScreen = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: IndexedStack(
        index: _currentScreen,
        children: const [
          NewAct(),
          Calendar(),
          EditProfile(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.more_time_outlined ), label: "Nova Atividade", ),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month_outlined ), label: "Atividades"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box_outlined), label: "Perfil"),
        ],
        currentIndex: _currentScreen,
        onTap: (int novoItem) {
          setState(() {
            _currentScreen = novoItem;
          });
        },
        
        fixedColor: Colors.black,
      ),
    );
  }
}

class Calendar extends StatelessWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 1,
        decoration: const BoxDecoration(
          color: kSecondColor,
        ),
        child: Column(children: [
          // ignore: prefer_const_constructors
          DefaultTextStyle(
            style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.normal,
                color: Colors.black,
                fontFamily: "Comfortaa"),
            child: const Text(
              'ATIVIDADES DIÁRIAS',
              textAlign: TextAlign.right,
            ),
          ),
          const DefaultTextStyle(
            style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.normal,
                color: Colors.black,
                fontFamily: "Comfortaa"),
            child: Text(
              '21 de maio, 2022',
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(
            height: 400,
            child: (ListView(
              children: [
                Card(
                  color: kGreenColor,
                  elevation: 5,
                  child: ListTile(
                    title: const Text('LAZER: CAMINHADA'),
                    subtitle: const Text("Caminhada no parque Ibirapuera."),
                    trailing: const Text("08:30"),
                    onTap: () {},
                  ),
                ),
                Card(
                  color: kPinkColor,
                  elevation: 5,
                  child: ListTile(
                    title: const Text('CONSULTA: CARDIOLOGISTA'),
                    subtitle: const Text(
                        "Cardiologista Dr. Marcio Hospital Sirio Libanês."),
                    trailing: const Text("10:30"),
                    onTap: () {},
                  ),
                ),
                Card(
                  color: kOrangeColor,
                  elevation: 5,
                  child: ListTile(
                    title: const Text('REMÉDIO: CENTRUM'),
                    subtitle: const Text("Vitaminas."),
                    trailing: const Text("15:00"),
                    onTap: () {},
                  ),
                ),
                Card(
                  color: kOrangeColor,
                  elevation: 5,
                  child: ListTile(
                    title: const Text('REMÉDIO: ROSUVASTATINA'),
                    subtitle: const Text("Tomar em jejum."),
                    trailing: const Text("15:30"),
                    onTap: () {},
                  ),
                ),
              ],
            )),
          )
        ]));
    // const Text('AGENDA DIÁRIA'),
  }
}
