import 'package:flutter/material.dart';
import 'package:bellma/screens/screens.dart';
import 'package:bellma/widgets/profile_body.dart';
import 'package:bellma/constants/colors_constant.dart';

class ProfileScreen extends StatelessWidget {
  static final String routeName = '/profile';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _appBar(context),
        body: _ProfileScreenBody(),
        bottomNavigationBar: ButtonOut(),
      ),
    );
  }

  PreferredSizeWidget _appBar(context) {
    return AppBar(
      title: Text(
        'Perfil',
        style: TextStyle(color: blackColor),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          icon: Icon(
            Icons.notifications_outlined,
            color: blackColor,
          ),
          onPressed: () =>
              Navigator.pushNamed(context, NotificationScreen.routeName),
        ),
      ],
    );
  }
}

class _ProfileScreenBody extends StatelessWidget {
  const _ProfileScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ProfileBodyWidget(),
          // ButtonOut(),
        ],
      ),
    );
  }
}
