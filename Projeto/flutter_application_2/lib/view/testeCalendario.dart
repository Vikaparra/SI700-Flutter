import 'package:flutter/material.dart';
import 'package:flutter_application_2/view/constants.dart';
import 'package:flutter_application_2/components/rounded_button.dart';
import 'package:flutter_application_2/view/login_screen.dart';
import 'package:flutter_application_2/view/signup_screen.dart';

import 'package:flutter/services.dart';
// class Welcome extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: kPrimaryColor,
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Image.asset(
//                 'assets/images/logo.png',
//                 width: 300,
//               ),
//               // ignore: prefer_const_constructors
//             ],
//           ),
//         ));
//   }
// }


Future mainCalend() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const TimePicker());
}


class TimePicker extends StatefulWidget {
  const TimePicker({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return TimePickerState();
  }
}

class TimePickerState extends State<TimePicker> {
  TimeOfDay? time;
  
  String getText() {
    if (time == null) {
      return 'Select Time';
    } else {
      final hours = time?.hour.toString().padLeft(2, '0');
      final minutes = time?.minute.toString().padLeft(2, '0');

      return '$hours:$minutes';
    }
  }

  @override
  Widget build(BuildContext context) => RoundedButton(
        text: getText(),
        press: () => pickTime(context),
      );

  Future pickTime(BuildContext context) async {
    const initialTime = TimeOfDay(hour: 9, minute: 0);
    final newTime = await showTimePicker(
      context: context,
      initialTime: time ?? initialTime,
    );

    if (newTime == null) return;

    setState(() => time = newTime);
  }
  
}
