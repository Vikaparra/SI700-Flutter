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
                              appointCollection.getNodeAtIndex(position).title),
                          subtitle: Text(
                            appointCollection
                                    .getNodeAtIndex(position)
                                    .description +
                                '\n' +
                                appointCollection
                                    .getNodeAtIndex(position)
                                    .date
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
        (tileAtual.month == tileAnterior.month) && (tileAtual.year == tileAnterior.year)
    )) {
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
    return const Text("--");
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

// class CustomListItem extends StatelessWidget {
//   const CustomListItem({
//     Key? key,
//     required this.title,
//     required this.user,
//     required this.viewCount,
//   }) : super(key: key);

//   final String title;
//   final String user;
//   final int viewCount;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 5.0),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Expanded(
//             flex: 3,
//             child: _VideoDescription(
//               title: title,
//               user: user,
//               viewCount: viewCount,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _VideoDescription extends StatelessWidget {
//   const _VideoDescription({
//     Key? key,
//     required this.title,
//     required this.user,
//     required this.viewCount,
//   }) : super(key: key);

//   final String title;
//   final String user;
//   final int viewCount;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Text(
//             title,
//             style: const TextStyle(
//               fontWeight: FontWeight.w500,
//               fontSize: 14.0,
//             ),
//           ),
//           const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
//           Text(
//             user,
//             style: const TextStyle(fontSize: 10.0),
//           ),
//           const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
//           Text(
//             '$viewCount views',
//             style: const TextStyle(fontSize: 10.0),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class MyStatelessWidget extends StatelessWidget {
//   const MyStatelessWidget({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       padding: const EdgeInsets.all(8.0),
//       itemExtent: 106.0,
//       children: const <CustomListItem>[
//         CustomListItem(
//           user: 'Flutter',
//           viewCount: 999000,
//           title: 'The Flutter YouTube Channel',
//         ),
//         CustomListItem(
//           user: 'Dash',
//           viewCount: 884000,
//           title: 'Announcing Flutter 1.0',
//         ),
//       ],
//     );
//   }
// }
