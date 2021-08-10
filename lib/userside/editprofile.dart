import 'dart:convert';

import 'package:archi_mat/theme.dart';
import 'package:archi_mat/util/widgets/back.dart';
import 'package:archi_mat/util/widgets/divider.dart';
import 'package:archi_mat/util/widgets/logout.dart';
import 'package:archi_mat/util/widgets/profilepic.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserEditProfile extends StatefulWidget {
  const UserEditProfile({Key key}) : super(key: key);

  @override
  _UserEditProfileState createState() => _UserEditProfileState();
}

class _UserEditProfileState extends State<UserEditProfile> {
  TextEditingController username = new TextEditingController();
  String image = '';
  var detail;
  bool loader = true;
  @override
  void initState() {
    userdetail();
    super.initState();
  }

  userdetail() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      detail = jsonDecode(pref.getString('user'));
      if (detail != null) {
        setState(() {
          image = detail['image'];
          loader = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loader
          ? Container(
              height: MediaQuery.of(context).size.height,
              alignment: Alignment.center,
              child: CircularProgressIndicator())
          : SafeArea(
              child: SingleChildScrollView(
              child: Column(
                children: [
                  Back_Widgets(
                    onclick: () {
                      Navigator.pop(context);
                    },
                  ),
                  ProfilepicWidgets(
                    image: image,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Divider_Widgets(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Text('Username'),
                          alignment: Alignment.topLeft,
                          width: 70,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.65,
                          // height: 20,
                          child: TextField(
                            keyboardType: TextInputType.text,
                            controller: username,
                            decoration: InputDecoration(
                                hintText: 'User Name',
                                hintStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none),
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider_Widgets(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Text('First Name'),
                          alignment: Alignment.topLeft,
                          width: 70,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.65,
                          // height: 20,
                          child: TextField(
                            keyboardType: TextInputType.text,
                            controller: username,
                            decoration: InputDecoration(
                                hintText: 'First Name',
                                hintStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none),
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider_Widgets(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Text('Last Name'),
                          alignment: Alignment.topLeft,
                          width: 70,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.65,
                          // height: 20,
                          child: TextField(
                            keyboardType: TextInputType.text,
                            controller: username,
                            decoration: InputDecoration(
                                hintText: 'Last Name',
                                hintStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none),
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider_Widgets(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Text('Gender'),
                          alignment: Alignment.topLeft,
                          width: 70,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.65,
                          // height: 20,
                          child: TextField(
                            keyboardType: TextInputType.text,
                            controller: username,
                            decoration: InputDecoration(
                                hintText: 'Gender',
                                hintStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none),
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider_Widgets(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Text('D.O.B'),
                          alignment: Alignment.topLeft,
                          width: 60,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.65,
                          // height: 20,
                          child: TextField(
                            keyboardType: TextInputType.text,
                            controller: username,
                            decoration: InputDecoration(
                                hintText: 'Day/Month',
                                hintStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none),
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider_Widgets(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Text('Phone'),
                          alignment: Alignment.topLeft,
                          width: 70,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.65,
                          // height: 20,
                          child: TextField(
                            keyboardType: TextInputType.text,
                            controller: username,
                            decoration: InputDecoration(
                                hintText: 'Xxxxxxx',
                                hintStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none),
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider_Widgets(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Text('Email'),
                          alignment: Alignment.topLeft,
                          width: 70,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.65,
                          // height: 20,
                          child: TextField(
                            keyboardType: TextInputType.text,
                            controller: username,
                            decoration: InputDecoration(
                                hintText: 'Xxxxxxxxxxxxxxx',
                                hintStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none),
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider_Widgets(),
                  SizedBox(
                    height: 40,
                  ),
                  InkWell(
                    onTap: () async {
                      // SharedPreferences pref = await SharedPreferences.getInstance();
                      // pref.clear();
                      // pref.setString('new', 'new');
                      // Navigator.of(context).pushAndRemoveUntil(
                      //     MaterialPageRoute(builder: (context) => SplashScreen()),
                      //     (Route<dynamic> route) => false);
                    },
                    child: Container(
                      width: 150,
                      alignment: Alignment.center,
                      padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border:
                              Border.all(color: AppTheme().l1black, width: 1)),
                      child: Text('Save'),
                    ),
                  ),
                ],
              ),
            )),
    );
  }
}
