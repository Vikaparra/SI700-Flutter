import 'package:flutter/material.dart';
import 'package:flutter_application_2/components/rounded_button.dart';
import 'package:flutter_application_2/view/login_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/auth/auth_event.dart';
import 'constants.dart';

import '../bloc/manage_bloc.dart';
import '../bloc/auth/auth_bloc.dart';
import '../bloc/manage_event.dart';
import '../bloc/manage_state.dart';
import '/model/profile.dart';

class Signup extends StatelessWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (_) => ManageBloc()),
    ], child: const Scaffold(appBar: null, body: TelaCadastroCuidador()));
  }
}

class TelaCadastroCuidador extends StatelessWidget {
  const TelaCadastroCuidador({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // base com o plano de fundo azul
      height: MediaQuery.of(context).size.height * 1,
      decoration: const BoxDecoration(
        color: Color(0xff6a9cfd),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment
            .end, // para o container branco ficar na parte de baixo
        children: [
          tituloPaginaCadastro(context), // titulo fica fora do container branco
          Container(
            // container branco com bordas arredondadas e formulario
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
            height: MediaQuery.of(context).size.height * 0.82,
            decoration: const BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                )),
            child: const FormularioCad(),
          )
        ],
      ),
    );
  }
}

Widget tituloPaginaCadastro(context) {
  return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.1,
      child: const DefaultTextStyle(
        style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.normal,
            color: Colors.black,
            fontFamily: "Comfortaa"),
        child: Text(
          """CADASTRE-SE
Cuidador""",
          textAlign: TextAlign.start,
        ),
      ));
}

class FormularioCad extends StatefulWidget {
  // formulario de cadastro
  const FormularioCad({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return FormularioState();
  }
}

class FormularioState extends State<FormularioCad> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final Profile profile = Profile();
  int parenteCuidador =
      0; // variavel radioButton, profissional = 1, parente = 2

  @override
  Widget build(BuildContext context) {
    Profile profile = Profile();
    return BlocBuilder<ManageBloc, ManageState>(builder: (context, state) {
      return Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
            color: Color(0xffffffff),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(0),
            )),
        child: Form(
            key: formKey,
            child: CustomScrollView(clipBehavior: Clip.hardEdge, slivers: [
              // tela scrollavel para passar pelo formulario
              SliverToBoxAdapter(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      TextFormField(
                        decoration:
                            const InputDecoration(labelText: 'Nome Completo'),
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Adicione algum nome";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          profile.name = value!;
                        },
                      ),
                      TextFormField(
                        decoration:
                            const InputDecoration(labelText: 'Telefone'),
                        keyboardType: TextInputType.number,
                        onSaved: (value) {
                          profile.tel = value!;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(labelText: 'CPF'),
                        keyboardType: TextInputType.number,
                        onSaved: (value) {
                          profile.cpf = value!;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Data de Nascimento'),
                        keyboardType: TextInputType.datetime,
                        onSaved: (value) {
                          profile.birthDate = value!;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(labelText: 'Email'),
                        keyboardType: TextInputType.emailAddress,
                        onSaved: (value) {
                          profile.email = value!;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(labelText: 'Senha'),
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        enableSuggestions: false,
                        autocorrect: false,
                      ),
                      TextFormField(
                        decoration:
                            const InputDecoration(labelText: 'Confirmar Senha'),
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        enableSuggestions: false,
                        autocorrect: false,
                        onSaved: (value) {
                          profile.password = value!;
                        },
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              "Profissional",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: "Comfortaa"),
                            ),
                            Radio(
                                value: 1,
                                groupValue: parenteCuidador,
                                onChanged: (int? inValue) {
                                  if (inValue != null) {
                                    setState(() {
                                      parenteCuidador = inValue;
                                      profile.cuidador = inValue;
                                    });
                                  }
                                }),
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              "Parente",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: "Comfortaa"),
                            ),
                            Radio(
                                value: 2,
                                groupValue: parenteCuidador,
                                onChanged: (int? inValue) {
                                  if (inValue != null) {
                                    setState(() {
                                      parenteCuidador = inValue;
                                      profile.cuidador = inValue;
                                    });
                                  }
                                })
                          ]),
                    ]),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    RoundedButton(
                      text: 'CADASTRAR',
                      textColor: kWhiteColor,
                      color: kSecondColor,
                      press: () {
                        formKey.currentState!.save();
                        BlocProvider.of<ManageBloc>(
                                context) //Utilizando o BLOC para adicionar na base de dados
                            .add(SubmitEvent(profile: profile));
                        BlocProvider.of<AuthBloc>(context).add(RegisterUser(
                            username: profile.email,
                            password: profile.password));

                        formKey.currentState!.reset();
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          backgroundColor: kSecondColor,
                          duration: Duration(seconds: 2),
                          content: Text("NOVO CADASTRO ADICIONADO!",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ));
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Login()),
                        );
                      },
                    ),
                  ],
                ),
              )
            ])),
      );
    });
  }
}
