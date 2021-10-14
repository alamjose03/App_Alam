import 'package:flutter/material.dart';
import 'package:bellma/screens/screens.dart';
import 'package:bellma/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:bellma/providers/providers.dart';

class HomeScreen extends StatelessWidget {
  static final String routeName = '/home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _HomeScreenBody(),
      bottomNavigationBar: CustomNavigatorBarWidget(),
    );
  }
}

class _HomeScreenBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final uiProvier = Provider.of<UiProvider>(context);

    final currentIndex = uiProvier.selectedMenuOptGet;

    // Encargado de cambiar la pantalla según el index que llegue
    switch (currentIndex) {
      case 0:
        return StatisticsScreen();

      case 1:
        return ProfileScreen();

      default:
        return StatisticsScreen();
    }
  }
}
