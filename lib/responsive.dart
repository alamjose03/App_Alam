import 'package:flutter/material.dart';
import 'dart:math' as math;

// Clase encargada de devolver el procentaje solicitado
class Responsive {
  double _width = 0, _height = 0, _diagonal = 0;

  // Métodos para acceder a los valores originales ya que son privados
  double get widht => _width;
  double get height => _height;
  double get diagonal => _diagonal;

  // Función estatica que retorna una instancia de la clase responsive
  static Responsive of(BuildContext context) => Responsive(context);

  Responsive(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    this._width = size.width;
    this._height = size.height;

    // Para calcular la diagonal, usamos el teorema de pitagoras
    // C2 = a2 + b2 => c = sqrt(a2 + b2) a = width b = height
    this._diagonal = math.sqrt(math.pow(_width, 2) + math.pow(_height, 2));
  }

  // Funciones para retornar el % de ancho, alto y diagonal
  // Si llega 50, retornará el 0.5 que equivale al 50%
  double wp(double percent) => _width * percent / 100;
  double hp(double percent) => _height * percent / 100;
  double dp(double percent) => _diagonal * percent / 100;
}
