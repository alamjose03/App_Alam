import 'dart:ui';

import 'package:bellma/constants/colors_constant.dart';
import 'package:flutter/material.dart';

class CardTableWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Table(
      // Crea la tabla
      children: [
        // El table row crea la fila y sus hijos van a ser las columnas
        // Todas las filas deben contener el mismo numero de hijos (columnas)
        TableRow(
          children: [
            _SingleCard(
              icon: Icons.wb_sunny,
              text: 'Buenos días',
              color: Colors.blue,
            ),
            _SingleCard(
              icon: Icons.nightlight_round_sharp,
              text: 'Buenas tardes',
              color: Colors.pinkAccent,
            ),
          ],
        ),
        TableRow(
          children: [
            _SingleCard(
              icon: Icons.nightlight_round_sharp,
              text: 'Buenas noches',
              color: Colors.lightGreen,
            ),
            _SingleCard(
              icon: Icons.cloud,
              text: 'Hasta mañana',
              color: Colors.blueGrey,
            ),
          ],
        ),
      ],
    );
  }
}

class _CardBackground extends StatelessWidget {
  final Widget child;
  const _CardBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 5.0, right: 5.0, top: 10.0),
      // margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
      // Se va encargar de que el blur se corte y no se expanda del container
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: BackdropFilter(
          // Se encargará del blur(difuminado)
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            height: 100,
            decoration: BoxDecoration(
              color: Color.fromRGBO(62, 66, 107, 0.7),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: this.child,
          ),
        ),
      ),
    );
  }
}

class _SingleCard extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;

  const _SingleCard(
      {required this.icon, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return _CardBackground(
      // Se encarga de recibir datos y desplegarlos por cada card
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: this.color,
            child: Icon(this.icon, size: 20.0, color: Colors.white),
            radius: 20.0,
          ),
          SizedBox(height: 5.0),
          Text(
            this.text,
            style: TextStyle(color: whiteColor, fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}
