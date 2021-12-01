import 'package:bellma/constants/colors_constant.dart';
import 'package:flutter/material.dart';

class NotificationPicker {
  final TimeOfDay? timeOfDay;

  NotificationPicker(
    this.timeOfDay,
  );
}

Future<NotificationPicker?> pickSchedule(BuildContext context) async {
  TimeOfDay? timeOfDay;

  timeOfDay = await showTimePicker(
    context: context,
    helpText: 'Seleccione la hora en formato 24 Horas.',
    confirmText: 'Confirmar',
    cancelText: 'Cancelar',
    initialTime: TimeOfDay.now(),
    builder: (BuildContext context, Widget? child) {
      return Theme(
        data: ThemeData(colorScheme: ColorScheme.light(primary: magentaColor)),
        child: child!,
      );
    },
  );

  if (timeOfDay != null) {
    return NotificationPicker(timeOfDay);
  }
  return null;
}
