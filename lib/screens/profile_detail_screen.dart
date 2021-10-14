import 'package:flutter/material.dart';
import 'package:bellma/responsive.dart';
import 'package:bellma/constants/colors_constant.dart';
import 'package:bellma/widgets/widgets.dart';

class ProfileDetailScreen extends StatelessWidget {
  static final String routeName = '/profileDetail';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Detalle Perfil',
            style: TextStyle(color: blackColor),
          ),
          centerTitle: true,
          iconTheme: IconThemeData(color: blackColor),
        ),
        body: SingleChildScrollView(child: _ProfileDetailBody()));
  }
}

class _ProfileDetailBody extends StatelessWidget {
  const _ProfileDetailBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ImageProfile(),
        EmailProfile(),
        _LabelData(text: 'Nombre completo'),
        _ValueLabel(text: 'Jessica Yareli Lambert Guerrero'),
        _LabelData(text: 'Dirección de correo electrónico'),
        _ValueLabel(text: 'jessicaLambert@gmail.com'),
        _LabelData(text: 'Proceso'),
        _ValueLabel(text: 'Promoción horizontal'),
        _LabelData(text: 'Teléfono'),
        _ValueLabel(text: '99-99-99-99-99'),
        _LabelData(text: 'Edad'),
        _ValueLabel(text: '34 años'),
        _LabelData(text: 'Dirección'),
        _ValueLabel(text: 'Av. del Sol No 105, Col.Centro Centro'),
        _LabelData(text: 'Código Postal - Ciudad'),
        _ValueLabel(text: '97800 Maxcanú, Yuc.'),
      ],
    );
  }
}

class _LabelData extends StatelessWidget {
  final String text;
  _LabelData({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Padding(
      padding: EdgeInsets.only(left: 20.0, top: 10.0),
      child: Row(
        children: [
          Text(
            this.text,
            style: TextStyle(color: greyColor, fontSize: responsive.dp(1.3)),
          ),
        ],
      ),
    );
  }
}

class _ValueLabel extends StatelessWidget {
  final String text;
  _ValueLabel({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);

    return Padding(
      padding: EdgeInsets.only(left: 20.0, top: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            this.text,
            style: TextStyle(
              color: blackColor,
              fontSize: responsive.dp(1.8),
              fontWeight: FontWeight.bold,
            ),
          ),
          Divider(indent: 2.0),
        ],
      ),
    );
  }
}
