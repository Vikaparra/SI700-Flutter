import 'package:flutter/material.dart';
import 'package:flutter_application_2/components/rounded_button.dart';
import 'package:flutter_application_2/view/constants.dart';
import 'package:flutter_application_2/model/login.dart';
import 'package:flutter_application_2/view/home.dart';
import 'package:flutter_application_2/view/welcome_screen.dart';

class Login extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final LoginData loginData = LoginData(username: "", password: "");

  Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("ENTRAR", style: TextStyle(fontSize: 40)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: usernameFormField(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: passwordFormField(),
            ),
            RoundedButton(
              text: "ENTRAR",
              textColor: kWhiteColor,
              color: kSecondColor,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const TelaInicialCuidador();
                    },
                  ),
                );
                // if (formKey.currentState!.validate()) {
                //   formKey.currentState!.save();
                //   loginData.doSomething();

                // }
              },
            )
          ],
        ),
      ),
    );
  }

  Widget usernameFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      // validator: (String? inValue) {
      //   if (inValue != null) {
      //     if (inValue.isEmpty) {
      //       return "Insira um nome de usuário";
      //     }
      //   }
      //   return null;
      // },
      // onSaved: (String? inValue) {
      //   loginData.username = inValue ?? "";
      // },
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: "USUÁRIO",
      ),
    );
  }

  Widget passwordFormField() {
    return TextFormField(
      obscureText: true,
      // validator: (String? inValue) {
      //   if (inValue != null) {
      //     if (inValue.length < 6) {
      //       return "Senha muito pequena! Insira 6 caractéres";
      //     }
      //   }
      //   return null;
      // },
      // onSaved: (String? inValue) {
      //   loginData.password = inValue ?? "";
      // },
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: "SENHA",
      ),
    );
  }
}
