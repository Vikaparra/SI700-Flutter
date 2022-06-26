import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/view/constants.dart';
import 'package:flutter_application_2/view/welcome_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/act/act_bloc.dart';
import 'bloc/auth/auth_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            primaryColor: const Color.fromRGBO(18, 53, 143, 1),
            backgroundColor: kPrimaryColor),
        home: MultiBlocProvider(
          providers: [
          BlocProvider(create: (_) => AuthBloc()),
          BlocProvider(create: (_)=>ManageBloc()),
        ], 
        child: const Wrapper()));
  }
}
