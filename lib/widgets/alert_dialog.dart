import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bellma/providers/providers.dart';
import 'package:bellma/responsive.dart';
import 'package:bellma/ui/ui.dart';
import 'package:bellma/widgets/widgets.dart';
import 'package:bellma/constants/colors_constant.dart';

// Stateless encargado de crear el AlertDialog
class AlertDialogWidget extends StatelessWidget {
  const AlertDialogWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uiInputDialogProvider = Provider.of<InputDialogProvider>(context);
    final Responsive responsive = Responsive.of(context);
    int valueStudy = 0;
    int valueEvaluation = 0;
    return AlertDialog(
      title: Text(
        'Por favor, introduzca los siguientes datos.',
        style: TextStyle(
          fontSize: responsive.dp(1.7),
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
      content: Container(
        height: 150.0,
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextFormField(
                autocorrect: false,
                keyboardType: TextInputType.number,
                decoration: InputDecorationsUI.floatingInputDecoration(
                  hintText: 'En horas',
                  labelText: 'Tiempo de estudió.',
                ),
                cursorColor: magentaColor,
                onChanged: (value) {
                  valueStudy = int.parse(value);
                },
              ),
              TextFormField(
                autocorrect: false,
                keyboardType: TextInputType.number,
                decoration: InputDecorationsUI.floatingInputDecoration(
                  hintText: 'En horas',
                  labelText: 'Tiempo de evaluaciones.',
                ),
                cursorColor: magentaColor,
                onChanged: (value) {
                  valueEvaluation = int.parse(value);
                },
              ),
            ],
          ),
        ),
      ),
      contentPadding: EdgeInsets.all(responsive.wp(5.0)),
      insetPadding: EdgeInsets.all(responsive.dp(6.0)),
      actions: [
        CardDialogWidget(
          child: TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'Cancelar',
              style: TextStyle(color: magentaColor),
            ),
          ),
        ),
        CardDialogWidget(
          child: TextButton(
            onPressed: () {
              uiInputDialogProvider.timeStudyInputSet = valueStudy;
              uiInputDialogProvider.timeEvaluationInputSet = valueEvaluation;
              Navigator.of(context).pop();
            },
            child: Text(
              'Confirmar',
              style: TextStyle(color: whiteColor),
            ),
          ),
          color: magentaColor,
        ),
      ],
    );
  }
}
