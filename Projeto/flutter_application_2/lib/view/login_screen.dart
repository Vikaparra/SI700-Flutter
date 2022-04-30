import 'package:flutter/material.dart';
import 'package:flutter_application_2/components/rounded_button.dart';
import 'package:flutter_application_2/view/calendar.dart';
import 'package:flutter_application_2/view/constants.dart';
import 'package:flutter_application_2/model/login.dart';

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

  Widget usernameFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: "USUÁRIO",
      ),
    );
  }

  Widget passwordFormField() {
    return TextFormField(
      obscureText: true,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: "SENHA",
      ),
    );
  }
}
