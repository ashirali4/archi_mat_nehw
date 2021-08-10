import 'dart:async';
import 'dart:convert';

import 'package:archi_mat/pages/browseMaterail.dart';
import 'package:archi_mat/pages/tab.dart';
import 'package:archi_mat/splash/loginregister.dart';
import 'package:flutter/material.dart';
import 'package:archi_mat/theme.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Image(
              image: AssetImage('assets/images/splashbg.png'),
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              // height: MediaQuery.of(context).size.height * 0.9,
            ),
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
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginRegister(
                                              login: true,
                                            )));
                              },
                              child: Container(
                                // width: 150,
                                height: 50,
                                alignment: Alignment.center,
                                padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(
                                        color: AppTheme().l1black, width: 1)),
                                child: Text('Lonin'),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginRegister(
                                              login: false,
                                            )));
                              },
                              child: Container(
                                // width: 10,
                                height: 50,
                                alignment: Alignment.center,
                                padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(
                                        color: AppTheme().l1black, width: 1)),
                                child: Text('Register'),
                              ),
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
      ),
    );
  }
}

class SplachPage extends StatefulWidget {
  @override
  _SplachPageState createState() => _SplachPageState();
}

class _SplachPageState extends State<SplachPage> {
  var profile;
  var profile1;
  var role;
  checker() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    // pref.clear();

    this.profile1 = pref.getString('user');

    print('role her');
    print(profile1);
    //  print(role);
    //  print(jsonDecode(profile));
    if (pref.getString('new') == '' || pref.getString('new') == null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => VirtualMaterialScreen1()),
          (Route<dynamic> route) => false);
    } else {
      if (this.profile1 == null) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => SplashScreen()),
            (Route<dynamic> route) => false);
      } else {
        this.profile = jsonDecode(pref.getString('user'));
        this.role = profile['role']['name'];

        if (this.role == 'user') {
          // Navigator.of(context).pushAndRemoveUntil(
          //     MaterialPageRoute(builder: (context) => OptionsPage()),
          //     (Route<dynamic> route) => false);
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (context) => TabPage(
                        index: 0,
                        data: null,
                      )),
              (Route<dynamic> route) => false);
        } else if (this.role == 'shopOwner') {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (context) => TabPage(
                        index: 0,
                        data: profile['user']['shop'],
                      )),
              (Route<dynamic> route) => false);
        } else {
          Fluttertoast.showToast(
              msg: 'Something went wrong',
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
          // Toast.show('Something went wrong', context, duration: 3);
        }
      }
    }
  }

  @override
  void initState() {
    super.initState();

    var himr = Timer(Duration(seconds: 3), () => checker());
    // firebaseCloudMessaging_Listeners();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Image(
              image: AssetImage('assets/images/splashbg.png'),
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height * 0.9,
                  child: Image(
                    image: AssetImage('assets/images/archimatlogo.png'),
                    fit: BoxFit.cover,
                    // height: 160,
                    width: 180,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
