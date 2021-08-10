import 'package:archi_mat/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../theme.dart';

// ignore: camel_case_types
class Logou_button extends StatelessWidget {
  final Function onclick;

  const Logou_button({
    Key key,
    this.onclick,
  }) : super(key: key);
  logout() async {}

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 40,
        ),
        InkWell(
          onTap: () async {
            SharedPreferences pref = await SharedPreferences.getInstance();
            pref.clear();
            pref.setString('new', 'new');
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => SplashScreen()),
                (Route<dynamic> route) => false);
          },
          child: Container(
            width: 150,
            alignment: Alignment.center,
            padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: AppTheme().l1black, width: 1)),
            child: Text('LOG OUT'),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text('Version 1.0'),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
