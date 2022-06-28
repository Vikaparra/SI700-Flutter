import 'package:flutter/material.dart';
import 'package:flutter_application_2/model/medicines.dart';
import 'package:flutter_application_2/view/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/medicine/medmonitor_bloc.dart';
import '../bloc/medicine/medmonitor_state.dart';

class CalendarMedic extends StatelessWidget {
  CalendarMedic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MedMonitorBloc, MedMonitorState>(
      builder: (context, state) => getActListView(state.medicineCollection),
    );
  }

  ListView getActListView(MedicineCollection medicineCollection) {
    // return Container(
    //     padding:
    //         const EdgeInsets.only(right: 10.0, left: 10, top: 10, bottom: 10),
    //     color: kSecondColor,
    return ListView.builder(
            itemCount: medicineCollection.length(),
            itemBuilder: (context, position) => Material(
                  color: kSecondColor,
                  child: Column(
                    children: [
                      // divisoria(medicineCollection, position, context),
                      ListTile(
                          isThreeLine: true,
                          textColor: Colors.black,
                          // tileColor: tileColor(
                          //     medicineCollection.getNodeAtIndex(position)),
                          // leading: Icon(useIcon(medicineCollection.getNodeAtIndex(position))),
                          trailing: GestureDetector(
                              onTap: () {}, child: const Icon(Icons.delete)
                              ),
                          title: Text(
                              medicineCollection.getNodeAtIndex(position).title, style: TextStyle(fontSize: 20),),
                          subtitle: Text(
                            medicineCollection
                                    .getNodeAtIndex(position)
                                    .description +
                                '\n' +
                                medicineCollection
                                    .getNodeAtIndex(position)
                                    .time.hour
                                    .toString()+':'+
                                medicineCollection
                                    .getNodeAtIndex(position)
                                    .time.minute
                                    .toString(),
                          ))
                    ],
                  ),
                // )
            )
            );
  }
}