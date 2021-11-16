import 'package:bellma/constants/colors_constant.dart';
import 'package:bellma/responsive.dart';
import 'package:bellma/screens/screens.dart';
import 'package:bellma/services/auth_service.dart';
import 'package:bellma/ui/global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileBodyWidget extends StatelessWidget {
  const ProfileBodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ImageProfile(),
        EmailProfile(),
        _ProfileData(),
        _NotificationData(),
      ],
    );
  }
}

class ImageProfile extends StatelessWidget {
  const ImageProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Global.userModel;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20.0, bottom: 5.0),
          child: Container(
            width: 80.0,
            height: 80.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: GestureDetector(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40.0),
                child: FadeInImage(
                  image: NetworkImage(user!.image),
                  placeholder: AssetImage('assets/img/jar-loading.gif'),
                  fit: BoxFit.cover,
                  width: 60.0,
                  height: 60.0,
                ),
              ),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => DetailImageScreen(image: user.image),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class EmailProfile extends StatelessWidget {
  const EmailProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Global.userModel;

    final Responsive responsive = Responsive.of(context);
    return Padding(
      padding: EdgeInsets.only(bottom: 8.0),
      child: Column(
        children: [
          Text(
            user!.name,
            style: TextStyle(
              color: blackColor,
              fontWeight: FontWeight.bold,
              fontSize: responsive.dp(2.0),
            ),
          ),
          Text(
            user.email,
            style: TextStyle(fontSize: responsive.dp(1.6)),
          ),
        ],
      ),
    );
  }
}

class _ProfileData extends StatelessWidget {
  const _ProfileData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20.0, top: 10.0),
          child: Row(
            children: [
              Text(
                'PERFIL',
                style:
                    TextStyle(color: greyColor, fontSize: responsive.dp(1.0)),
              ),
            ],
          ),
        ),
        _ListTile(
          icon: Icons.person_outline,
          text: 'Detalles de la cuenta',
          trailing: Icon(Icons.arrow_forward_ios),
          textOntap: ProfileDetailScreen.routeName,
        ),
      ],
    );
  }
}

class _NotificationData extends StatelessWidget {
  const _NotificationData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20.0, left: 20.0),
          child: Row(
            children: [
              Text(
                'NOTIFICACIONES',
                style:
                    TextStyle(color: greyColor, fontSize: responsive.dp(1.0)),
              ),
            ],
          ),
        ),
        _ListTile(
          icon: Icons.notifications_none_outlined,
          text: 'Administrar recordatorios',
          trailing: Icon(Icons.arrow_forward_ios),
        ),
        _ListTile(
          icon: Icons.watch_later_outlined,
          text: 'Tiempo de estudios',
          trailing: _ButtonStudy(),
        ),
        _ListTile(
          icon: Icons.description_outlined,
          text: 'Evaluaciones',
          trailing: _ButtonEvaluation(),
        ),
      ],
    );
  }
}

class _ListTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final Widget trailing;
  final String? textOntap;
  _ListTile({
    Key? key,
    required this.icon,
    required this.text,
    required this.trailing,
    this.textOntap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Column(
      children: [
        ListTile(
          leading: Icon(this.icon, color: blackColor, size: responsive.dp(3.0)),
          title: Text(this.text),
          trailing: this.trailing,
          onTap: textOntap != null
              ? () => Navigator.pushNamed(context, this.textOntap!)
              : null,
        ),
        Divider(indent: 74.0),
      ],
    );
  }
}

class ButtonOut extends StatelessWidget {
  const ButtonOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 45.0, vertical: 5.0),
      width: double.infinity,
      height: 50.0,
      decoration: BoxDecoration(
        color: magentaColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextButton(
        child: Text('Log Out', style: TextStyle(color: whiteColor)),
        onPressed: () {
          authService.logout();
          Navigator.pushReplacementNamed(context, LoginScreen.routeName);
        },
      ),
    );
  }
}

class _ButtonStudy extends StatelessWidget {
  const _ButtonStudy({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    bool _isStudy = true;
    return CupertinoSwitch(
      value: _isStudy,
      onChanged: (value) {},
      activeColor: magentaColor,
    );
  }
}

class _ButtonEvaluation extends StatelessWidget {
  const _ButtonEvaluation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _isEvaluation = true;
    return CupertinoSwitch(
      value: _isEvaluation,
      onChanged: (value) {},
      activeColor: magentaColor,
    );
  }
}
