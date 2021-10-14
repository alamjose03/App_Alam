import 'package:bellma/responsive.dart';
import 'package:flutter/material.dart';
import 'package:bellma/constants/colors_constant.dart';

class CardStatisticsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Container(
      width: double.infinity,
      height: responsive.hp(35.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25.0),
        ),
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          stops: [0, 9],
          colors: [
            blackColor,
            blackFaintColor,
          ],
        ),
      ),
    );
  }
}
