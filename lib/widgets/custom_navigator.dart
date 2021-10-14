import 'package:flutter/material.dart';
import 'package:bellma/ui/ui.dart';
import 'package:bellma/providers/providers.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:provider/provider.dart';

class CustomNavigatorBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final uiProvier = Provider.of<UiProvider>(context);
    int currentIndex = uiProvier.selectedMenuOptGet;

    return BottomNavyBar(
      selectedIndex: currentIndex,
      onItemSelected: (index) => uiProvier.selectedMenuOptSet = index,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      itemCornerRadius: 12.0,
      iconSize: 30.0,
      showElevation: true,
      items: [
        BottomNavDecorationsUI.bottomNavyItem(
          icon: Icons.bar_chart,
          title: 'Estadísticas',
        ),
        BottomNavDecorationsUI.bottomNavyItem(
          icon: Icons.person,
          title: 'Perfil',
        ),
      ],
    );
  }
}
