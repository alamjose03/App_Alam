import 'package:flutter/material.dart';
import 'package:bellma/responsive.dart';

class CardContainerWidget extends StatelessWidget {
  final Widget child;
  const CardContainerWidget({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Container(
      width: double.infinity,
      height: responsive.hp(67.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(35.0),
          topLeft: Radius.circular(35.0),
        ),
      ),
      child: this.child,
    );
  }
}
