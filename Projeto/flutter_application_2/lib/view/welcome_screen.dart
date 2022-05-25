import 'package:flutter/material.dart';
import 'package:flutter_application_2/view/constants.dart';
import 'package:flutter_application_2/components/rounded_button.dart';
import 'package:flutter_application_2/view/login_screen.dart';
import 'package:flutter_application_2/view/signup_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/auth/auth_bloc.dart';

import '../bloc/auth/auth_event.dart';
import '../bloc/auth/auth_state.dart';
import 'calendar.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kPrimaryColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png', //Imagem de plano de fundo com logo
                width: 300,
              ),
              // ignore: prefer_const_constructors
              RoundedButton(
                text: "ENTRAR",
                press: () {
                  Navigator.push(
                    //Navegação do buttom, seguir para página de Login
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Login();
                      },
                    ),
                  );
                },
              ),
              RoundedButton(
                text: "cadastre-se",
                textColor: kWhiteColor,
                color: kPrimaryColor,
                press: () {
                  Navigator.push(
                    //Navegação do buttom, seguir para página de Entrada
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const Signup();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ));
  }
}

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return WrapperState();
  }
}

class WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
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
      },
      builder: (context, state) {
        if (state is Authenticated) {
          return const Principal();
        } else {
          return Welcome(); //LoginScreen()
        }
      },
    );
  }
}
