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
        color: kSecondColor,
        child: ListView.builder(
            itemCount: appointCollection.length(),
            itemBuilder: (context, position) => Material(
                child: ListTile(
                    isThreeLine: true,
                    textColor: Colors.black,
                    tileColor:
                        tileColor(appointCollection.getNodeAtIndex(position)),
                    leading: Icon(icons[position % icons.length]),
                    trailing: GestureDetector(
                        onTap: () {}, child: const Icon(Icons.delete)),
                    title:
                        Text(appointCollection.getNodeAtIndex(position).title),
                    subtitle: Text(
                      appointCollection.getNodeAtIndex(position).description +
                          '\n' +
                          appointCollection
                              .getNodeAtIndex(position)
                              .date
                              .toString(),
                    )))));
  }
}

tileColor(tile) {
  switch (tile.type) {
    case 'consulta':
      return kPinkColor;

    case 'exercicio':
      return kSecondColor;

    case 'lazer':
      return kGreenColor;

    case 'remedio':
      return kOrangeColor;

    default:
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
