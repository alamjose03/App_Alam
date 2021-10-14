import 'package:flutter/material.dart';
import 'package:bellma/constants/colors_constant.dart';

class InputDecorationsUI {
  static InputDecoration loginInputDecoration({
    required String hintText,
    required String labelText,
    required IconData prefixIcon,
    Widget? suffix,
  }) {
    return InputDecoration(
      fillColor: Colors.blue[50],
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6.0),
        borderSide: BorderSide.none,
      ),
      filled: true,
      hintText: hintText,
      labelText: labelText,
      labelStyle: TextStyle(color: blackColor),
      prefixIcon: Icon(prefixIcon, color: greyColor),
      suffix: suffix != null ? suffix : null,
    );
  }

  static InputDecoration floatingInputDecoration({
    required String hintText,
    required String labelText,
  }) {
    return InputDecoration(
      fillColor: Colors.grey[60],
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide.none,
      ),
      filled: true,
      hintText: hintText,
      labelText: labelText,
      labelStyle: TextStyle(color: blackColor),
    );
  }
}
