import 'package:flutter/material.dart';
import 'package:flutter_application_2/view/constants.dart';

class CalendarAct extends StatelessWidget {
  const CalendarAct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      height: MediaQuery.of(context).size.height * 1,
      decoration: const BoxDecoration(
        color: Color(0xff6a9cfd),
      ),
      child: Column(mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const SizedBox(
              width: double.infinity,
              height: 120.0,
              child: Card(
                  color: kGreenColor,
                  margin: EdgeInsets.all(10),
                  child: Text(
                    'LAZER: CAMINHADA',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            ),
            const SizedBox(
              width: double.infinity,
              height: 120.0,
              child: Card(
                  color: kPinkColor,
                  margin: EdgeInsets.all(10),
                  child: Text(
                    'CONSULTA: CLÍNICO GERAL',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            ),
            const SizedBox(
              width: double.infinity,
              height: 120.0,
              child: Card(
                color: kOrangeColor,
                margin: EdgeInsets.all(10),
                child: Text(
                  'MEDICAMENTO: CENTRUM',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: double.infinity,
              height: 120.0,
              child: Card(
                  color: kOrangeColor,
                  margin: EdgeInsets.all(10),
                  child: Text(
                    'MEDICAMENTO: ROSUVASTATINA',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        shadows: <Shadow>[
                          Shadow(
                            offset: Offset(0.3, 0.3),
                            blurRadius: 1.3,
                            color: Color.fromARGB(255, 0, 0, 0),
                          )
                        ]),
                  )),
            )
          ]),
    ));
  }
}
