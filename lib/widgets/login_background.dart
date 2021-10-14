import 'package:flutter/material.dart';
import 'package:bellma/responsive.dart';
import 'package:bellma/constants/colors_constant.dart';

class LoginBackgroundWidget extends StatelessWidget {
  final Widget child;
  const LoginBackgroundWidget({required this.child});

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        // Si no queremos que se mueva el fondo, y solo el card quitamos el singlechil
        child: SingleChildScrollView(
          child: Stack(
            children: [
              _BlackBox(),
              Positioned.fill(
                top: responsive.hp(12.0),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: _Logo(responsive),
                ),
              ),
              this.child,
            ],
          ),
        ),
      ),
    );
  }
}

class _BlackBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Container(
      width: double.infinity,
      height: responsive.hp(50),
      decoration: BoxDecoration(
        color: blackColor,
      ),
      child: Stack(
        children: [
          Positioned(child: _Bubble(), top: -55, left: 10),
          Positioned(child: _Bubble(), top: -15, left: 180),
          Positioned(child: _Bubble(), top: -45, right: -20),
          Positioned(child: _Bubble(), top: 60, left: 85),
          Positioned(child: _Bubble(), top: 100, right: 50),
          Positioned(child: _Bubble(), top: 140, left: -10),
          Positioned(child: _Bubble(), bottom: 150, left: 150),
          Positioned(child: _Bubble(), bottom: 150, right: -45),
        ],
      ),
    );
  }

  // BoxDecoration _blackBackground() => BoxDecoration(
  //       gradient: LinearGradient(
  //         stops: [0.0, 1],
  //         colors: [
  //           Color(0xFF151E22),
  //           Color(0XFF456370),
  //         ],
  //       ),
  //     );
}

class _Logo extends StatelessWidget {
  final Responsive responsive;
  const _Logo(this.responsive);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: responsive.wp(40.0),
      child: Image(
        image: AssetImage('assets/img/LogoUnivelWhite.png'),
        fit: BoxFit.cover,
      ),
    );
  }
}

class _Bubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: blackOpaColor,
      ),
    );
  }
}
