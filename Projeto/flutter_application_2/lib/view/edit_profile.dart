import 'package:flutter/material.dart';
import 'package:flutter_application_2/components/rounded_button.dart';
import 'package:flutter_application_2/view/constants.dart';
import 'package:flutter_application_2/view/welcome_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/auth/auth_bloc.dart';
import '../bloc/auth/auth_event.dart';
import '../main.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(appBar: null, body: Profile());
  }
}

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          //base com plano de fundo azul
          color: Color(0xff6a9cfd),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            profileImage(context), //imagem ou icone de perfil
            Container(
                // container branco com bordas arredondadas, com as infos do perfil dentro
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.height * 0.01,
                    top: MediaQuery.of(context).size.height * 0.01,
                    right: MediaQuery.of(context).size.height * 0.01,
                    bottom: 00),
                height: MediaQuery.of(context).size.height * 0.6,
                decoration: const BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                    )),
                child: Column(
                    // column contendo infos do perfil
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(top: 0.0),
                          child: SizedBox(
                            // sizedBox para conter a customScrollView
                            height: MediaQuery.of(context).size.height * 0.55,
                            child: const PerfilInfo(),
                          )),
                    ])),
          ],
        ));
  }
}

Widget profileImage(context) {
  return Container(
    margin: EdgeInsets.only(
        left: MediaQuery.of(context).size.height * 0.04,
        top: MediaQuery.of(context).size.height * 0.04,
        right: MediaQuery.of(context).size.height * 0.04,
        bottom: MediaQuery.of(context).size.height * 0.04),
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      color: Colors.black,
    ),
    child: SizedBox(
      width: MediaQuery.of(context).size.height * 0.17,
      height: MediaQuery.of(context).size.height * 0.17,
    ),
  );
}

class PerfilInfo extends StatelessWidget {
  const PerfilInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      //informações do perfil
      clipBehavior: Clip.hardEdge,
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Antonio Zambon',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 23, color: Colors.black, fontFamily: "Comfortaa"),
              ),
              const Text(
                'Familiar',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 21, color: Colors.black, fontFamily: "Comfortaa"),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.02),
                child: ListTile(
                    title: const Text(
                      'Nascimento',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontFamily: "Comfortaa"),
                    ),
                    subtitle: const Text(
                      '05/07/1800',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontFamily: "Comfortaa"),
                    ),
                    trailing: GestureDetector(
                      child: const Icon(Icons.edit),
                      onTap: () {},
                    )),
              ),
              ListTile(
                  title: const Text(
                    'CPF',
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontFamily: "Comfortaa"),
                  ),
                  subtitle: const Text(
                    '456.987.258.41',
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontFamily: "Comfortaa"),
                  ),
                  trailing: GestureDetector(
                    child: const Icon(Icons.edit),
                    onTap: () {},
                  )),
              ListTile(
                  title: const Text(
                    'Email',
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontFamily: "Comfortaa"),
                  ),
                  subtitle: const Text(
                    'zambas@gmail.com',
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontFamily: "Comfortaa"),
                  ),
                  trailing: GestureDetector(
                    child: const Icon(Icons.edit),
                    onTap: () {},
                  )),
              ListTile(
                  title: const Text(
                    'Telefone: ',
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontFamily: "Comfortaa"),
                  ),
                  subtitle: const Text(
                    '19 9 88754563',
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontFamily: "Comfortaa"),
                  ),
                  trailing: GestureDetector(
                    child: const Icon(Icons.edit),
                    onTap: () {},
                  )),
              ListTile(
                  title: const Text(
                    'Senha',
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontFamily: "Comfortaa"),
                  ),
                  subtitle: const Text(
                    'xxxxxxxxxx',
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontFamily: "Comfortaa"),
                  ),
                  trailing: GestureDetector(
                    child: const Icon(Icons.edit),
                    onTap: () {},
                  )),
            ],
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              RoundedButton(
                text: 'SAIR',
                textColor: kWhiteColor,
                color: kSecondColor,
                press: () {
                  BlocProvider.of<AuthBloc>(context).add(Logout());
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MyApp()),
                  );
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}
