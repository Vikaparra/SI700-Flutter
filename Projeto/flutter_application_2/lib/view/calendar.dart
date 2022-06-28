import 'package:flutter/material.dart';
import 'package:flutter_application_2/view/constants.dart';
import 'package:flutter_application_2/view/edit_profile.dart';
import 'package:flutter_application_2/view/new_alarm.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/act/monitor_bloc.dart';
import '../bloc/act/monitor_state.dart';
import '../model/appointments.dart';
import '../provider/firebase_firestore.dart';

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
      body: IndexedStack(
        index: _currentScreen,
        children: [
          NewAct(),
          Calendar(),
          EditProfile(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        //Barra de navegação inferior
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.more_time_outlined),
            label: "Nova Atividade",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month_outlined), label: "Atividades"),
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
    return BlocBuilder<MonitorBloc, MonitorState>(
      builder: (context, state) => getActListView(state.appointCollection),
    );
  }

  Container getActListView(AppointCollection appointCollection) {
    return Container(
        padding:
            const EdgeInsets.only(right: 10.0, left: 10, top: 10, bottom: 10),
        color: kSecondColor,
        child: ListView.builder(
            itemCount: appointCollection.length(),
            itemBuilder: (context, position) => Material(
                  color: kSecondColor,
                  child: Column(
                    children: [
                      divisoria(appointCollection, position, context),
                      ListTile(
                          isThreeLine: true,
                          textColor: Colors.black,
                          tileColor: tileColor(
                              appointCollection.getNodeAtIndex(position)),
                          leading: Icon(useIcon(
                              appointCollection.getNodeAtIndex(position))),
                          trailing: GestureDetector(
                              onTap: () {
                                var noteId = appointCollection.idList[position];
                                FirestoreServer.helper.deleteNote(noteId);
                              },
                              child: const Icon(Icons.delete)),
                          title: Text(
                            appointCollection.getNodeAtIndex(position).title,
                            style: const TextStyle(fontSize: 20),
                          ),
                          subtitle: Text(
                            appointCollection
                                    .getNodeAtIndex(position)
                                    .description +
                                '\n' +
                                appointCollection
                                    .getNodeAtIndex(position)
                                    .date
                                    .hour
                                    .toString() +
                                ':' +
                                appointCollection
                                    .getNodeAtIndex(position)
                                    .date
                                    .minute
                                    .toString(),
                          ))
                    ],
                  ),
                )));
  }
}

divisoria(appointCollection, position, context) {
  var mes = "";
  var tileAtual = appointCollection.getNodeAtIndex(position).date;

  switch (tileAtual.month.toString()) {
    case "6":
      {
        (mes = "JUNHO");
      }
      break;
    case "7":
      {
        (mes = "JULHO");
      }
      break;
    case "8":
      {
        (mes = "AGOSTO");
      }
      break;
    case "9":
      {
        (mes = "SETEMBRO");
      }
      break;
    case "10":
      {
        (mes = "OUTUBRO");
      }
      break;
    case "11":
      {
        (mes = "NOVEMBRO");
      }
      break;
    case "12":
      {
        (mes = "DEZEMBRO");
      }
      break;
    case "1":
      {
        (mes = "JANEIRO");
      }
      break;
    case "2":
      {
        (mes = "FEVEREIRO");
      }
      break;
    case "3":
      {
        (mes = "MARÇO");
      }
      break;
    case "4":
      {
        (mes = "ABRIL");
      }
      break;
    case "5":
      {
        (mes = "MAIO");
      }
      break;
  }

  if (position > 0) {
    var tileAnterior = appointCollection.getNodeAtIndex(position - 1).date;

    if (!((tileAtual.day == tileAnterior.day) &&
        (tileAtual.month == tileAnterior.month) &&
        (tileAtual.year == tileAnterior.year))) {
      return Padding(
          child: SizedBox(
              child: Text(
                tileAtual.day.toString() +
                    ' DE ' +
                    mes +
                    ' DE ' +
                    tileAtual.year.toString(),
                textAlign: TextAlign.left,
                style: const TextStyle(color: kWhiteColor, fontSize: 20),
              ),
              width: MediaQuery.of(context).size.width * 0.90),
          padding: const EdgeInsets.only(top: 10.0, bottom: 10));
    } else {
      return const Text(" ");
    }
  } else {
    return Column(
      children: [
        Padding(
            child: SizedBox(
                child: const Text(
                  'ATIVIDADES',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.normal,
                      color: kWhiteColor,
                      fontFamily: "Comfortaa"),
                ),
                width: MediaQuery.of(context).size.width * 0.90),
            padding: const EdgeInsets.only(top: 40.0, bottom: 20)),
        Padding(
            child: SizedBox(
                child: Text(
                  tileAtual.day.toString() +
                      ' DE ' +
                      mes +
                      ' DE ' +
                      tileAtual.year.toString(),
                  textAlign: TextAlign.left,
                  style: const TextStyle(color: kWhiteColor, fontSize: 20),
                ),
                width: MediaQuery.of(context).size.width * 0.90),
            padding: const EdgeInsets.only(top: 10.0, bottom: 10))
      ],
    );
  }
}

tileColor(tile) {
  switch (tile.type) {
    case 'consulta':
      return kPinkColor;
    case 'exercicio':
      return const Color.fromARGB(255, 197, 237, 255);
    case 'lazer':
      return kGreenColor;
    case 'remedio':
      return kOrangeColor;
    default:
  }
}

useIcon(tile) {
  switch (tile.type) {
    case 'consulta':
      return Icons.medical_services_outlined;

    case 'exercicio':
      return Icons.beach_access;

    case 'lazer':
      return Icons.beach_access;

    case 'remedio':
      return Icons.medication_liquid_rounded;
  }
}

Widget title() {
  //Formatação visual do titulo da tela
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
            'ATIVIDADES DIÁRIAS',
            textAlign: TextAlign.start,
          ),
        )),
  );
}
