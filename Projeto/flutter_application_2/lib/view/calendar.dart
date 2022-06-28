import 'package:flutter/material.dart';
import 'package:flutter_application_2/view/constants.dart';
import 'package:flutter_application_2/view/edit_profile.dart';
import 'package:flutter_application_2/view/new_alarm.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/act/monitor_bloc.dart';
import '../bloc/act/monitor_state.dart';
import '../model/appointments.dart';

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
          const NewAct(),
          Calendar(),
          const EditProfile(),
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
  Calendar({Key? key}) : super(key: key);

  final List icons = [Icons.ac_unit_outlined, Icons.access_alarm_rounded];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MonitorBloc, MonitorState>(
      builder: (context, state) => getActListView(state.appointCollection),
    );
  }

  Container getActListView(AppointCollection appointCollection) {
    
    return Container(
        padding: EdgeInsets.only(right: 15, left: 15),
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
                          leading: Icon(icons[position % icons.length]),
                          trailing: GestureDetector(
                              onTap: () {}, child: const Icon(Icons.delete)),
                          title: Text(
                              appointCollection.getNodeAtIndex(position).title, style: TextStyle(fontSize: 20),),
                          subtitle: Text(
                            appointCollection
                                    .getNodeAtIndex(position)
                                    .description +
                                '\n' +
                                appointCollection
                                    .getNodeAtIndex(position)
                                    .date.hour
                                    .toString()+':'+
                                appointCollection
                                    .getNodeAtIndex(position)
                                    .date.minute
                                    .toString(),
                            // trailing: Text(appointCollection.getNodeAtIndex(position).date),
                          ))
                    ],
                  ),
                )));
  }
}

divisoria(appointCollection, position, context) {
  if (position > 0) {
    var tileAtual = appointCollection.getNodeAtIndex(position).date;
    var tileAnterior = appointCollection.getNodeAtIndex(position - 1).date;
    print('ate aqui deu bom');
    if (!((tileAtual.day == tileAnterior.day) &&
        (tileAtual.month == tileAnterior.month) &&
        (tileAtual.year == tileAnterior.year))) {
      return Padding(
          child: SizedBox(
              child: Text(
                tileAtual.day.toString() +
                    ' / ' +
                    tileAtual.month.toString() +
                    ' / ' +
                    tileAtual.year.toString(),
                textAlign: TextAlign.left,
                style: TextStyle(color: kWhiteColor, fontSize: 20),
              ),
              width: MediaQuery.of(context).size.width * 0.90),
          padding: const EdgeInsets.only(top: 40.0, bottom: 10));
    } else {
      return const Text(" ");
    }
  } else {
    return Padding(
        child: SizedBox(
            child: const Text(
              'COMPROMISSOS: ',
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.normal,
                  color: kWhiteColor,
                  fontFamily: "Comfortaa"),
            ),
            width: MediaQuery.of(context).size.width * 0.90),
        padding: const EdgeInsets.only(top: 40.0, bottom: 20));
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
