import 'package:bellma/constants/colors_constant.dart';
import 'package:bellma/responsive.dart';
import 'package:bellma/screens/screens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
              image: DecorationImage(
                image: AssetImage('assets/img/profile.png'),
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
    final Responsive responsive = Responsive.of(context);
    return Padding(
      padding: EdgeInsets.only(bottom: 8.0),
      child: Column(
        children: [
          Text(
            'Jessica Lambert',
            style: TextStyle(
              color: blackColor,
              fontWeight: FontWeight.bold,
              fontSize: responsive.dp(2.0),
            ),
          ),
          Text(
            'jessicalambert@gmail.com',
            style: TextStyle(fontSize: responsive.dp(1.5)),
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
          icon: Icons.auto_stories_outlined,
          text: 'Actividades a realizar',
          trailing: _ButtonActivities(),
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
        onPressed: () {},
      ),
    );
  }
}

class _ButtonActivities extends StatefulWidget {
  const _ButtonActivities({Key? key}) : super(key: key);

  @override
  __ButtonActivitiesState createState() => __ButtonActivitiesState();
}

class __ButtonActivitiesState extends State<_ButtonActivities> {
  bool _isActivity = true;
  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      value: _isActivity,
      onChanged: (value) {
        setState(() {
          _isActivity = value;
        });
        print('$value  actividades');
      },
      activeColor: magentaColor,
    );
  }
}

class _ButtonStudy extends StatefulWidget {
  const _ButtonStudy({Key? key}) : super(key: key);

  @override
  __ButtonStudyState createState() => __ButtonStudyState();
}

class __ButtonStudyState extends State<_ButtonStudy> {
  bool _isStudy = true;
  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      value: _isStudy,
      onChanged: (value) {
        setState(() {
          _isStudy = value;
        });
        print('$value  estudio');
      },
      activeColor: magentaColor,
    );
  }
}

class _ButtonEvaluation extends StatefulWidget {
  const _ButtonEvaluation({Key? key}) : super(key: key);

  @override
  __ButtonEvaluationState createState() => __ButtonEvaluationState();
}

class __ButtonEvaluationState extends State<_ButtonEvaluation> {
  bool _isEvaluation = true;
  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      value: _isEvaluation,
      onChanged: (value) {
        setState(() {
          _isEvaluation = value;
        });
        print('$value  evaluación');
      },
      activeColor: magentaColor,
    );
  }
}
