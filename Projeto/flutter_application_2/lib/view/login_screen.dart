import 'package:flutter/material.dart';
import 'package:flutter_application_2/components/rounded_button.dart';
import 'package:flutter_application_2/view/calendar.dart';
import 'package:flutter_application_2/view/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/act/act_bloc.dart';
import '../bloc/auth/auth_bloc.dart';
import '../bloc/auth/auth_event.dart';
import '../bloc/auth/auth_state.dart';

class Login extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Visual da tela de login
    GlobalKey<FormState> formkey = GlobalKey();
    String username = "";
    String password = "";
    return BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
      if (state is AuthError) {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text("Erro do Firebase"),
                content: Text(state.message),
              );
            });
      }
    }, builder: (context, state) {
      if (state is Authenticated) {
        return const Principal();
      } else {
        return Scaffold(
          appBar: null,
          backgroundColor: kWhiteColor,
          body: Form(
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("ENTRAR", style: TextStyle(fontSize: 40)),
                Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextFormField(
                      validator: (String? inValue) {
                        if (inValue!.isEmpty) {
                          return "Insira algo como username";
                        }
                        return null;
                      },
                      onSaved: (String? inValue) {
                        username = inValue!;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "USUÁRIO",
                      ),
                    )),
                Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextFormField(
                      validator: (String? inValue) {
                        if (inValue!.length < 4) {
                          return "Tem que ter ao menos 4 caracters";
                        }
                        return null;
                      },
                      onSaved: (String? inValue) {
                        password = inValue!;
                      },
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "SENHA",
                      ),
                    )),
                RoundedButton(
                  text: "ENTRAR",
                  textColor: kWhiteColor,
                  color: kSecondColor,
                  press: () {
                    if (formkey.currentState!.validate()) {
                      formkey.currentState!.save();
                      // Lançando evento
                      BlocProvider.of<AuthBloc>(context).add(
                          LoginUser(username: username, password: password));
                    }
                  },
                )
              ],
            ),
          ),
        );
      }
    });
  }
}