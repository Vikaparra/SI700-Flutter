import 'package:flutter/material.dart';
import 'package:flutter_application_2/components/rounded_button.dart';

// As seguintes funções foram retiradas e adaptadas da seguinte fonte:
// https://github.com/JohannesMilke/date_picker_example/
//---------------------- TIMEPICKER ------------------------
//----------------------------------------------------------

class TimePicker extends StatefulWidget {
  const TimePicker({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return TimePickerState();
  }
}

class TimePickerState extends State<TimePicker> {
  TimeOfDay? alarmTime;

  String getText() {
    if (alarmTime == null) {
      //caso ainda não tenha nenhum horario definido o texto vai ser:
      return 'Selecione o horário';
    } else {
      //caso ja tenha, ele converte para string para mostrar na tela
      final hours = alarmTime?.hour.toString().padLeft(2, '0');
      final minutes = alarmTime?.minute.toString().padLeft(2, '0');

      return '$hours:$minutes';
    }
  }

  @override
  Widget build(BuildContext context) => RoundedButton(
        text: getText(), //função para pegar o texto que aparece no botao
        press: () => selectTime(context),
      );

  Future selectTime(BuildContext context) async {
    const defaultTime = TimeOfDay(
        hour: 12, minute: 0); //horario padrão que irá aparecer no botão
    final selectedTime = await showTimePicker(
      //showTimePicker é uma função ja existente de TimePicker
      context: context,
      initialTime: alarmTime ?? defaultTime,
      //caso ja exista um horario definido, o time picker abre nele
    );

    if (selectedTime == null) {
      return;
    } //caso a pessoa abra o timepicker e aperte pra cancelar

    setState(() {
      alarmTime = selectedTime;
    });
  }
}

//--------------------------------------------------------------
//------------------------- DATEPICKER -------------------------

class DatePicker extends StatefulWidget {
  const DatePicker({Key? key}) : super(key: key);

  @override
  DatePickerState createState() {
    return DatePickerState();
  }
}

class DatePickerState extends State<DatePicker> {
  DateTime? alarmDate; //horario do alarme

  String getText() {
    if (alarmDate == null) {
      //caso ainda não tenha horario definido o texto do botao vai ser:
      return 'Selecione a data do evento';
    } else {
      //caso tenha ele retorna no formato dd/mm/aaaa
      return '${alarmDate?.day}/${alarmDate?.month}/${alarmDate?.year}';
    }
  }

  @override
  Widget build(BuildContext context) => RoundedButton(
        text: getText(), //função para pegar texto que aparece no botao
        press: () => pickDate(context),
      );

  Future pickDate(BuildContext context) async {
    final defaultDate =
        DateTime.now(); //data padrão que aparece quando abre o DatePicker
    final selectedDate = await showDatePicker(
      //showDatePicker é uma função ja existente, a partir dela o usuario seleciona a data
      context: context,
      initialDate: alarmDate ?? defaultDate,
      firstDate: DateTime(
          DateTime.now().year - 5), //desde onde até onde vai o calendario
      lastDate: DateTime(DateTime.now().year + 5),
    );

    if (selectedDate == null) {
      //caso o usuario aperte cancel antes de selecionar uma data
      return;
    }

    setState(() {
      alarmDate = selectedDate;
    });
  }
}
