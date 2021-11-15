import 'package:bellma/constants/colors_constant.dart';
import 'package:flutter/material.dart';

class DetailImageScreen extends StatelessWidget {
  final String image;
  DetailImageScreen({required this.image});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: whiteColor),
      ),
      body: Center(
        child: Container(
          child: FadeInImage(
            placeholder: AssetImage('assets/img/no-image.jpg'),
            fit: BoxFit.contain,
            image: NetworkImage(image),
          ),
        ),
      ),
    );
  }
}
