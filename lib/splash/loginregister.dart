import 'package:flutter/material.dart';
import 'package:archi_mat/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginRegister extends StatefulWidget {
  const LoginRegister({Key key}) : super(key: key);

  @override
  _LoginRegisterState createState() => _LoginRegisterState();
}

class _LoginRegisterState extends State<LoginRegister> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: <Widget>[
          SvgPicture.asset(
            'assets/images/background.svg',
            width: MediaQuery.of(context).size.width,
          ),
          // Image(
          //   image: AssetImage('assets/images/splashbg.png'),
          //   fit: BoxFit.cover,
          //   width: MediaQuery.of(context).size.width,
          //   // height: MediaQuery.of(context).size.height * 0.9,
          // ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Center(
                  child: Container(
                    alignment: Alignment.topCenter,
                    child: Image(
                      image: AssetImage('assets/images/archimatlogo.png'),
                      fit: BoxFit.cover,
                      // height: 160,
                      width: 180,
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(color: AppTheme().white),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //  Container(width: 20,),
                          Container(
                            // width: 150,
                            height: 60,
                            alignment: Alignment.center,
                            padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                    color: AppTheme().l1black, width: 1)),
                            child: Text('Lonin'),
                          ),
                          Container(
                            // width: 10,
                            height: 60,
                            alignment: Alignment.center,
                            padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                    color: AppTheme().l1black, width: 1)),
                            child: Text('Register'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
