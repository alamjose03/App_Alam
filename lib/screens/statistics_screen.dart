import 'package:bellma/ui/global.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bellma/screens/screens.dart';
import 'package:bellma/providers/providers.dart';
import 'package:bellma/widgets/widgets.dart';
import 'package:bellma/constants/colors_constant.dart';

class StatisticsScreen extends StatelessWidget {
  static final String routeName = '/statistics';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: _appBar(context),
        body: _StatisticsScreenBody(),
        floatingActionButton: _FloatingActionButtom(),
      ),
    );
  }

  // Configuración del AppBar
  PreferredSizeWidget _appBar(context) {
    return AppBar(
      title: Text(
        'Estadísticas',
      ),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      actions: [
        IconButton(
          icon: Icon(
            Icons.notifications_outlined,
          ),
          onPressed: () =>
              Navigator.pushNamed(context, NotificationScreen.routeName),
        ),
      ],
    );
  }
}

// Stateless encargado del body
class _StatisticsScreenBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Global.userModel;
    final uiInputDialogProvider = Provider.of<InputDialogProvider>(context);
    int timeStudy = uiInputDialogProvider.timeStudyInputGet;
    int timeEvaluation = uiInputDialogProvider.timeEvaluationInputGet;
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          CardStatisticsWidget(),
          Positioned(
            top: 60.0,
            left: 20.0,
            right: 20.0,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user!.process,
                    style: TextStyle(fontSize: 16.0, color: Colors.white),
                  ),
                  Container(
                    width: double.infinity,
                    height: 250.0,
                    child: Card(
                      color: whiteColor,
                      elevation: 10.0,
                      child: Text('GRAFICA'),
                    ),
                  ),
                  Text(
                    timeStudy.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    timeEvaluation.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Stateless encargado del floatingActionButtom
class _FloatingActionButtom extends StatelessWidget {
  const _FloatingActionButtom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      backgroundColor: magentaColor,
      onPressed: () => showDialog(context),
    );
  }
}

// Animación del dialogo
void showDialog(context) {
  showGeneralDialog(
    barrierColor: Colors.black.withOpacity(0.5),
    transitionBuilder: (context, a1, a2, widget) {
      return Transform.scale(
        scale: a1.value,
        child: Opacity(
          opacity: a1.value,
          child: AlertDialogWidget(),
        ),
      );
    },
    transitionDuration: Duration(milliseconds: 200),
    context: context,
    barrierLabel: "",
    pageBuilder: (context, animation1, animation2) {
      return Container();
    },
  );
}
