import 'package:flutter/material.dart';
import 'package:flutter_application_2/components/rounded_button.dart';
import 'package:flutter/services.dart';

//------------- TIMEPICKER -----------

// Future mainCalend() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await SystemChrome.setPreferredOrientations([
//     DeviceOrientation.portraitUp,
//     DeviceOrientation.portraitDown,
//   ]);

//   runApp(const TimePicker());
// }

// class TimePicker extends StatefulWidget {
//   const TimePicker({Key? key}) : super(key: key);

//   @override
//   State<StatefulWidget> createState() {
//     return TimePickerState();
//   }
// }

// class TimePickerState extends State<TimePicker> {
//   TimeOfDay? time;

//   String getText() {
//     if (time == null) {
//       return 'Selecione o horário';
//     } else {
//       final hours = time?.hour.toString().padLeft(2, '0');
//       final minutes = time?.minute.toString().padLeft(2, '0');

//       return '$hours:$minutes';
//     }
//   }

//   @override
//   Widget build(BuildContext context) => RoundedButton(
//         text: getText(),
//         press: () => pickTime(context),
//       );

//   Future pickTime(BuildContext context) async {
//     const initialTime = TimeOfDay(hour: 9, minute: 0);
//     final newTime = await showTimePicker(
//       context: context,
//       initialTime: time ?? initialTime,
//     );

//     if (newTime == null) return;

//     setState(() => time = newTime);
//   }
// }

//--------------------------------------------------------------
//------------------------- TIMEPICKER -------------------------

class DatePickerWidget extends StatefulWidget {
  const DatePickerWidget({Key? key}) : super(key: key);

  @override
  _DatePickerWidgetState createState() {
    return _DatePickerWidgetState();
  }
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  DateTime? date;

  String getText() {
    if (date == null) {
      return 'Selecione a data do evento';
    } else {
      return '${date?.day}/${date?.month}/${date?.year}';
    }
  }

  @override
  Widget build(BuildContext context) => RoundedButton(
        text: getText(),
        press: () => pickDate(context),
      );

  Future pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: date ?? initialDate,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );

    if (newDate == null) return;

    setState(() {
      date = newDate;
    });
  }
}
