import 'package:flutter/material.dart';
import 'package:flutter_application_2/view/constants.dart';
import 'package:flutter_application_2/components/rounded_button.dart';
import 'package:flutter_application_2/view/login_screen.dart';
import 'package:flutter_application_2/view/signup_screen.dart';

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
