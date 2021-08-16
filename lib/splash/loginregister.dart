import 'package:archi_mat/splash/loginPage.dart';
import 'package:archi_mat/splash/registeration.dart';
import 'package:archi_mat/util/widgets/divider.dart';
import 'package:flutter/material.dart';
import 'package:archi_mat/theme.dart';
import 'package:flutter_svg/svg.dart';

class LoginRegister extends StatefulWidget {
  final bool login;
  const LoginRegister({Key key, this.login}) : super(key: key);

  @override
  _LoginRegisterState createState() => _LoginRegisterState();
}

class _LoginRegisterState extends State<LoginRegister> {
  bool login = true;
  @override
  void initState() {
    setState(() {
      login = widget.login;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            // Container(
            //   height: MediaQuery.of(context).size.height,
            //   child: Container(
            //     height: MediaQuery.of(context).size.height * 0.5,
            //     child: SvgPicture.asset(
            //       'assets/images/background.svg',
            //       color: AppTheme().pink,
            //       width: MediaQuery.of(context).size.width,
            //     ),
            //   ),
            // ),
            Image(
              image: AssetImage('assets/images/back.png'),
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.43,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 300,
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    login ? 'Login' : 'Create a \nNew Account',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: AppTheme().l1black),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      // login
                      //   ?
                      'Welcome Archimat'
                      // : 'For best experience, download apps here'
                      ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 40,
                    child: Divider(
                      color: AppTheme().black,
                      thickness: 1,
                    ),
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    // onTap: () {
                    //   Navigator.of(context).push(MaterialPageRoute(
                    //       builder: (context) => VirtualMaterialScreen1()));
                    // },
                    child: Container(
                        margin: EdgeInsets.only(left: 15, right: 15),
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: AppTheme().white,
                            border: Border.all(color: AppTheme().loginBtnColor),
                            borderRadius: BorderRadius.circular(25)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/images/google.svg',
                                color: AppTheme().black,
                                width: 20,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                (login ? 'Login' : 'SIGN UP') + ' WITH GMAIL',
                                style: TextStyle(
                                    color: Colors.black,
                                    // fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              )
                            ],
                          ),
                        )),
                  ),
                  SizedBox(height: 15),
                  InkWell(
                    onTap: () {
                      if (login) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => LoginPage()));
                      } else {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => RegisterationPage()));
                      }
                    },
                    child: Container(
                        // padding: EdgeInsets.only(left: 15),
                        margin: EdgeInsets.only(left: 15, right: 15),
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            // color: AppTheme().white,
                            border: Border.all(color: AppTheme().loginBtnColor),
                            borderRadius: BorderRadius.circular(25)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/images/email.svg',
                                color: AppTheme().black,
                                width: 20,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                (login ? 'Login' : 'SIGN UP') + ' WITH EMAIL',
                                style: TextStyle(
                                    color: Colors.black,
                                    // fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              )
                            ],
                          ),
                        )),
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        print(login);
                        login = !login;
                        print(login);
                      });
                    },
                    child: Align(
                        alignment: Alignment.topRight,
                        child: Text(!login ? 'LOGIN HERE' : 'SIGNUP')),
                  )
                ],
              ),
            ),
            Column(
              children: [
                Divider_Widgets(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 0, 5),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: AppTheme().black)),
                        child: SvgPicture.asset(
                          'assets/images/facebook.svg',
                          color: AppTheme().black,
                          width: 10,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: AppTheme().black)),
                        child: SvgPicture.asset(
                          'assets/images/insta.svg',
                          color: AppTheme().black,
                          width: 20,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: AppTheme().black)),
                        child: SvgPicture.asset(
                          'assets/images/word.svg',
                          color: AppTheme().black,
                          width: 20,
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
    ));
  }
}
