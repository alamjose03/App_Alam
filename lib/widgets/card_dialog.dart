import 'package:flutter/material.dart';

class CardDialogWidget extends StatelessWidget {
  final Widget child;
  final Color? color;

  const CardDialogWidget({required this.child, this.color});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      color: color != null ? color : null,
      elevation: 10.0,
      child: Container(
        width: 90.0,
        height: 50.0,
        child: child,
      ),
    );
  }
}
