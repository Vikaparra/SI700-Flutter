import 'package:flutter/material.dart';
import 'package:flutter_application_2/components/rounded_button.dart';
import 'package:flutter_application_2/view/constants.dart';
import 'package:flutter_application_2/view/new_alarm_consulta.dart';
import 'package:flutter_application_2/view/new_alarm_exercicio.dart';
import 'package:flutter_application_2/view/new_alarm_lazer.dart';
import 'package:flutter_application_2/view/new_alarm_remedio.dart';

class NewAct extends StatefulWidget {
  const NewAct({ Key? key }) : super(key: key);

  @override
  State<NewAct> createState() => _NewActState();
}

class _NewActState extends State<NewAct> {
  @override
  Widget build(BuildContext context) {
      return Container(
        
        width: MediaQuery.of(context).size.height * 1,
        decoration: const BoxDecoration(
          color: Color(0xff6a9cfd),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text(
                'NOVA ATIVIDADE',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 23, color: Colors.black, fontFamily: "Comfortaa"),
              ),
            Container(
                padding: const EdgeInsets.only(
                    left: 10.0, top: 0, right: 10.0, bottom: 00),
                height: MediaQuery.of(context).size.height * 0.8,
                width: MediaQuery.of(context).size.height * 1,
                decoration: const BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                    )),
              child: Column(children: [
                const Padding(padding: EdgeInsets.all(15),),
                RoundedButton(
                        text: 'LAZER',
                        textColor: kWhiteColor,
                        color: kGreenColor,
                        press: () {
                          Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const NewLazer();
                      },
                  ),
                );
                        },
                      ),
                RoundedButton(
                        text: 'CONSULTA',
                        textColor: kWhiteColor,
                        color: kPinkColor,
                        
                        press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const NewConsulta();
                      },
                  ),
                );
              },
            ),
                RoundedButton(
                        text: 'REMÉDIO',
                        textColor: kWhiteColor,
                        color: kOrangeColor,
                        press: () {
                          Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const NewRemed();
                      },
                  ),
                );
                        },
                      ),
                RoundedButton(
                        text: 'EXERCÍCIO',
                        textColor: kWhiteColor,
                        color: kSecondColor,
                        press: () {Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const NewAExec();
                      },
                  ),
                );},
                      ),
                Image.asset(            
            'assets/images/senhor.png',
            width: 230,
          ),]),
    )
    ])
    );
  }
}