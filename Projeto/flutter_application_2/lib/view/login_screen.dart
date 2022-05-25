import 'package:flutter/material.dart';
import 'package:flutter_application_2/components/rounded_button.dart';
import 'package:flutter_application_2/view/calendar.dart';
import 'package:flutter_application_2/view/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/auth/auth_bloc.dart';
import '../bloc/auth/auth_event.dart';

class Login extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Visual da tela de login
    GlobalKey<FormState> formkey = GlobalKey();
    String username = "";
    String password = "";
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: Form(
        key: formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("ENTRAR", style: TextStyle(fontSize: 40)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: usernameFormField(username),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: passwordFormField(password),
            ),
            RoundedButton(
              text: "ENTRAR",
              textColor: kWhiteColor,
              color: kSecondColor,
              press: () {
                if (formkey.currentState!.validate()) {
                  formkey.currentState!.save();
                  // Lançando evento
                  BlocProvider.of<AuthBloc>(context)
                      .add(LoginUser(username: username, password: password));
                }
                Navigator.push(
                  //Resposta ao clicar em botão de entrar
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const Principal();
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  Widget usernameFormField(username) {
    //Form para adicionar usuário
    return TextFormField(
      onSaved: (String? inValue) {
        username = inValue!;
      },
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: "USUÁRIO",
      ),
    );
  }

  Widget passwordFormField(password) {
    //Form para adicionar senha
    return TextFormField(
      onSaved: (String? inValue) {
        password = inValue!;
      },
      obscureText: true,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: "SENHA",
      ),
    );
  }
}
