import 'package:flutter/material.dart';
import 'package:flutter_application_2/components/rounded_button.dart';
import 'package:flutter_application_2/view/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/auth/auth_bloc.dart';
import '../bloc/auth/auth_event.dart';
import '../provider/firebase_firestore.dart';
import 'package:flutter_application_2/model/userinfo.dart' as prefix;

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: null,
        body: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: MediaQuery.of(context).size.width,
                  minHeight: MediaQuery.of(context).size.height * 0.95,
                ),
                child: FutureBuilder<prefix.UserInfo>(
                  future: FirestoreServer.helper.getNote(),
                  builder: ((context, snapshot) {
                    if (snapshot.hasData) {
                      final userInfo = snapshot.data;
                      return Profile.withData(userInfo!);
                    } else {
                      return const Text('Algo deu errado!');
                    }
                  }),
                ))));
  }
}

class Profile extends StatelessWidget {
  prefix.UserInfo userInfo;

  Profile.withData(this.userInfo, {Key? key}) : super(key: key);

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
                height: MediaQuery.of(context).size.height * 0.65,
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
                            height: MediaQuery.of(context).size.height * 0.60,
                            child: PerfilInfo(userInfo),
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
  PerfilInfo(this.userInfo, {Key? key}) : super(key: key);
  prefix.UserInfo userInfo;

  // Future<prefix.UserInfo> buildNome() async {

  //     await FirestoreServer.helper
  //         .getNote()
  //         .then((value) => userInfo.toMap(value));

  //     return userInfo;
  // }

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
              Text(
                userInfo.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 23, color: Colors.black, fontFamily: "Comfortaa"),
              ),
              Text(
                getCuidador(userInfo),
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 21, color: Colors.black, fontFamily: "Comfortaa"),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.02),
                child: ListTile(
                    title: const Text(
                      'Nome',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontFamily: "Comfortaa"),
                    ),
                    subtitle: Text(
                      userInfo.name,
                      style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontFamily: "Comfortaa"),
                    ),
                    trailing: GestureDetector(
                      child: const Icon(Icons.edit),
                      onTap: () {
                        editDialog('Nome', context);
                      },
                    )),
              ),
              ListTile(
                  title: const Text(
                    'Nascimento',
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontFamily: "Comfortaa"),
                  ),
                  subtitle: Text(
                    userInfo.birthDate,
                    style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontFamily: "Comfortaa"),
                  ),
                  trailing: GestureDetector(
                    child: const Icon(Icons.edit),
                    onTap: () {
                      editDialog('Nascimento', context);
                    },
                  )),
              ListTile(
                  title: const Text(
                    'Telefone: ',
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontFamily: "Comfortaa"),
                  ),
                  subtitle: Text(
                    userInfo.tel,
                    style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontFamily: "Comfortaa"),
                  ),
                  trailing: GestureDetector(
                    child: const Icon(Icons.edit),
                    onTap: () {
                      editDialog('Telefone', context);
                    },
                  )),
              ListTile(
                title: const Text(
                  'CPF',
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontFamily: "Comfortaa"),
                ),
                subtitle: Text(
                  userInfo.cpf,
                  style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontFamily: "Comfortaa"),
                ),
              ),
              ListTile(
                title: const Text(
                  'Email',
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontFamily: "Comfortaa"),
                ),
                subtitle: Text(
                  userInfo.email,
                  style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontFamily: "Comfortaa"),
                ),
              ),

              // const ListTile(
              //   title: Text(
              //     'Senha',
              //     style: TextStyle(
              //         fontSize: 14,
              //         color: Colors.black,
              //         fontFamily: "Comfortaa"),
              //   ),
              //   subtitle: Text(
              //     'xxxxxxxxxx',
              //     style: TextStyle(
              //         fontSize: 14,
              //         color: Colors.black,
              //         fontFamily: "Comfortaa"),
              //   ),
              // trailing: GestureDetector(
              //   child: const Icon(Icons.edit),
              //   onTap: () {
              //     editDialog('Senha', context);
              //   },
              // )
              // ),
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
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}

String getCuidador(userInfo) {
  if (userInfo.cuidador == 0) {
    return "Familiar";
  } else {
    return "Profissional";
  }
}

editDialog(attribute, context) {
  final GlobalKey<FormState> formKey = GlobalKey();
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          actionsAlignment: MainAxisAlignment.center,
          scrollable: true,
          title: Text('Editar $attribute'),
          content: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: InputDecoration(
                      labelText: 'Digitar $attribute aqui',
                    ),
                    validator: (inValue) {
                      if (inValue!.isEmpty) {
                        return "Não é possivel deixar esse campo em branco";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      FirestoreServer.helper.updateUserInfo(value, attribute);
                    },
                  ),
                ],
              ),
            ),
          ),
          actions: [
            RoundedButton(
                color: kPrimaryColor,
                text: "Confirmar",
                textColor: kWhiteColor,
                press: () {
                  formKey.currentState!.save();
                })
          ],
        );
      });
}
