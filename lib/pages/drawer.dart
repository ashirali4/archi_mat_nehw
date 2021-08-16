import 'dart:convert';
import 'package:archi_mat/pages/inbox.dart';
import 'package:archi_mat/theme.dart';
import 'package:archi_mat/userside/setting.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../environment.dart';

class Menu2 extends StatefulWidget {
  @override
  _Menu2State createState() => _Menu2State();
}

class _Menu2State extends State<Menu2> {
  String name = '', image = '';
  dynamic detail;

  userdetail() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      detail = jsonDecode(pref.getString('user'));
    });
    if (detail != null) {
      setState(() {
        name = detail['firstname'] + ' ' + detail['lastname'];
        image = detail['image'];
      });
    }
  }

  @override
  void initState() {
    userdetail();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      decoration: BoxDecoration(color: Colors.pink),
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                    width: 70,
                    height: 70,
                    margin: EdgeInsets.only(bottom: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: image == '' || image == 'null'
                              ? AssetImage('assets/images/dp.jpg')
                              : NetworkImage(
                                  Config.url + '/' + image,
                                ),
                        )),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 30),
                    child: Text(
                      name != ''
                          ? name.length > 20
                              ? name.toString().substring(0, 200) + ' ...'
                              : name
                          : '----',
                      style: TextStyle(color: AppTheme().white),
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: AppTheme().purple,
              ),
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(
                    Icons.person,
                    color: AppTheme().purple,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Profile',
                    style: TextStyle(color: AppTheme().purple),
                  ),
                ],
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UserSetting(
                              data: detail,
                            )));
              },
            ),
            // Divider(
            //   thickness: 2,
            //   height: 5,
            // ),
            ListTile(
              title: Row(
                children: [
                  Icon(
                    Icons.event_note,
                    color: AppTheme().purple,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Inbox',
                    style: TextStyle(color: AppTheme().purple),
                  ),
                ],
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Inbox(
                              shopside: false,
                            )));
              },
            ),
            // Divider(
            //   thickness: 2,
            //   height: 5,
            // ),
          ],
        ),
      ),
    );
  }
}
