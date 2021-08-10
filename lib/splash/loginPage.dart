import 'dart:convert';

import 'package:archi_mat/Services/loginService.dart';

import 'package:archi_mat/pages/tab.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:archi_mat/theme.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  final bool login;
  const LoginPage({Key key, this.login}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = new TextEditingController();
  TextEditingController pswd = new TextEditingController();

  String token;

  @override
  initState() {
    super.initState();
    FirebaseMessaging.instance.getToken().then((tokeen) {
      print(tokeen);
      this.token = tokeen;
      print(token);
    });
  }

  showAlert(text, backcolor) {
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: backcolor,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppTheme().purple,
          title: Text('Login'),
          centerTitle: true,
        ),
        body: InkWell(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: SafeArea(
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  Image(
                    image: AssetImage('assets/images/splashbg.png'),
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                    // height: MediaQuery.of(context).size.height * 0.2,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: Center(
                          child: Container(
                            alignment: Alignment.topCenter,
                            child: Image(
                              image:
                                  AssetImage('assets/images/archimatlogo.png'),
                              fit: BoxFit.cover,
                              // height: 160,
                              width: 180,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        // height: 300,
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Text(
                            //   'Login',
                            //   style: TextStyle(
                            //       fontWeight: FontWeight.bold,
                            //       fontSize: 20,
                            //       color: AppTheme().l1black),
                            // ),
                            // SizedBox(
                            //   height: 10,
                            // ),
                            // Text('Welcome Archimat'),
                            // SizedBox(
                            //   height: 10,
                            // ),
                            // Container(
                            //   width: 40,
                            //   child: Divider(
                            //     color: AppTheme().black,
                            //     thickness: 1,
                            //   ),
                            // ),
                            // SizedBox(height: 20),
                            Container(
                              padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(color: AppTheme().black)),
                              child: TextField(
                                keyboardType: TextInputType.text,
                                controller: email,
                                decoration: InputDecoration(
                                  hintText: 'Enter Your E-Mail',
                                  hintStyle: TextStyle(color: AppTheme().black),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(color: AppTheme().black)),
                              child: TextField(
                                keyboardType: TextInputType.text,
                                obscureText: true,
                                controller: pswd,
                                decoration: InputDecoration(
                                    hintText: 'Enter Your Password',
                                    hintStyle:
                                        TextStyle(color: AppTheme().black),
                                    border: InputBorder.none),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            GestureDetector(
                              onTap: () {
                                FocusScope.of(context)
                                    .requestFocus(new FocusNode());
                                if (email.text.isEmpty || pswd.text.isEmpty) {
                                  showAlert(
                                      "Please Fill Both Field", Colors.red);
                                } else {
                                  login();
                                }
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                alignment: Alignment.center,
                                padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
                                decoration: BoxDecoration(
                                    color: AppTheme().purple,
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(
                                        color: AppTheme().lblack, width: 1)),
                                child: Text(
                                  'Login',
                                  style: TextStyle(color: AppTheme().white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  login() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var data = {'email': email.text, 'password': pswd.text, 'mob_token': token};
    print(data);
    LoginService().login(data).then((value) {
      print(value);
      if (value['message'] == 'success') {
        if (value['user']['role']['name'] == 'user') {
          print('user');
          prefs.setString('user', jsonEncode(value['user']));

          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (context) => TabPage(
                        index: 0,
                        data: null,
                      )),
              (Route<dynamic> route) => false);
        } else if (value['user']['role']['name'] == 'shopOwner') {
          prefs.setString('user', jsonEncode(value['user']));

          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (context) => TabPage(
                        index: 0,
                        data: value['user']['shop'],
                      )),
              (Route<dynamic> route) => false);
          print('shop');
        } else {
          showAlert('User not available', Colors.red);
          print('user not available');
        }
      }
    });
  }
}
