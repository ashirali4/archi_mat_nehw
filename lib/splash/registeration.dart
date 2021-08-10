import 'dart:convert';
import 'package:archi_mat/Services/loginService.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:archi_mat/pages/tab.dart';
import 'package:archi_mat/util/widgets/profilepic.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:archi_mat/theme.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gender_picker/source/enums.dart';
import 'package:gender_picker/source/gender_picker.dart';

class RegisterationPage extends StatefulWidget {
  final bool login;
  const RegisterationPage({Key key, this.login}) : super(key: key);

  @override
  _RegisterationPageState createState() => _RegisterationPageState();
}

class _RegisterationPageState extends State<RegisterationPage> {
  TextEditingController email = new TextEditingController();
  TextEditingController pswd = new TextEditingController();
  TextEditingController confirmpswd = new TextEditingController();
  TextEditingController fname = new TextEditingController();
  TextEditingController lname = new TextEditingController();
  TextEditingController number = new TextEditingController();

  String token;
  bool passwordmatch = false, birth = false;
  var countrycode = '+31';
  var newphone;

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

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppTheme().purple,
          title: Text('Signup'),
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
                  Container(
                    width: MediaQuery.of(context).size.width,
                    // height: 300,
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                            child: ProfilepicWidgets(
                          image: '',
                        )),
                        SizedBox(height: 20),
                        Container(
                          padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(color: AppTheme().black)),
                          child: TextField(
                            keyboardType: TextInputType.text,
                            controller: fname,
                            decoration: InputDecoration(
                              hintText: 'First Name',
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
                            controller: lname,
                            decoration: InputDecoration(
                              hintText: 'Last Name',
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
                            // padding: EdgeInsets.only(left: 15, right: 15),
                            // decoration: BoxDecoration(
                            //     boxShadow: [
                            //       BoxShadow(
                            //           color: Color(0x95E9EBF0),
                            //           blurRadius: 10,
                            //           spreadRadius: 2)
                            //     ],
                            //     border: Border.all(color: Colors.transparent),
                            //     borderRadius:
                            //         BorderRadius.all(Radius.circular(5))),
                            // height: 60,
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  CountryCodePicker(
                                    padding: EdgeInsets.all(0),
                                    showFlag: true,
                                    initialSelection: 'NL',
                                    favorite: ['+31', 'NL'],
                                    onChanged: (code) {
                                      this.countrycode = code.toString();
                                      print(countrycode);
                                    },
                                  ),
                                  Container(
                                    height: 30.0,
                                    width: 1.0,
                                    color: Colors.blue,
                                    margin: const EdgeInsets.only(
                                        left: 10.0, right: 10.0),
                                  ),
                                  Expanded(
                                    child: TextField(
                                      controller: number,
                                      keyboardType: TextInputType.phone,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Phone Number",
                                      ),
                                      onChanged: (value) {
                                        if (number.text.isNotEmpty) {
                                          if (value[0] != '0') {
                                            this.newphone = value;
                                          } else {
                                            this.newphone = value.substring(1);
                                          }
                                        }
                                      },
                                    ),
                                  ),
                                ])),
                        Container(
                          padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(color: AppTheme().black)),
                          child: Text(birth
                              ? 'Date of Birth'
                              : "${selectedDate.toLocal()}".split(' ')[0]),
                        ),
                        // Text("${selectedDate.toLocal()}".split(' ')[0]),
                        // SizedBox(
                        //   height: 20.0,
                        // ),

                        // // ignore: deprecated_member_use
                        // RaisedButton(
                        //   onPressed: () => _selectDate(context),
                        //   child: Text('Select date'),
                        // ),
                        // SizedBox(
                        //   height: 20,
                        // ),

                        Container(
                          padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(color: AppTheme().black)),
                          child: GenderPickerWithImage(
                            showOtherGender: true,
                            verticalAlignedText: true,
                            selectedGender: Gender.Male,
                            selectedGenderTextStyle: TextStyle(
                                color: Color(0xFF8b32a8),
                                fontWeight: FontWeight.bold),
                            unSelectedGenderTextStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.normal),
                            onChanged: (Gender gender) {
                              print(gender);
                            },
                            equallyAligned: true,
                            animationDuration: Duration(milliseconds: 300),
                            isCircular: true,
                            // default : true,
                            opacityOfGradient: 0.4,
                            padding: const EdgeInsets.all(3),
                            size: 50, //default : 40
                          ),
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
                            onChanged: (val) {
                              if (val == confirmpswd.text) {
                                passwordmatch = true;
                              } else {
                                passwordmatch = false;
                              }
                            },
                            decoration: InputDecoration(
                                hintText: 'Enter Your Password',
                                hintStyle: TextStyle(color: AppTheme().black),
                                border: InputBorder.none),
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
                            onChanged: (val) {
                              if (val == pswd.text) {
                                passwordmatch = true;
                              } else {
                                passwordmatch = false;
                              }
                            },
                            controller: confirmpswd,
                            decoration: InputDecoration(
                                hintText: 'Confirm Password',
                                hintStyle: TextStyle(color: AppTheme().black),
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
                            if (email.text.isEmpty ||
                                pswd.text.isEmpty ||
                                lname.text.trim().isEmpty ||
                                fname.text.trim().isEmpty) {
                              showAlert("Please Fill Both Field", Colors.red);
                            } else if (!passwordmatch) {
                              showAlert(
                                  "Pasword and Confirm Pasword does`t match!",
                                  Colors.red);
                            } else {
                              signup();
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
                              'Create',
                              style: TextStyle(color: AppTheme().white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  signup() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var data = {
      'email': email.text,
      'password': pswd.text,
      'mob_token': token,
      'firstname': fname.text.trim(),
      'lastname': lname.text.trim(),
      'image': prefs.getString('image')
    };
    print(data);
    LoginService().signup(data).then((value) {
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
        } else {
          showAlert('User not available', Colors.red);
          print('User not available');
        }
      } else if (value['message'] == 'user already exist') {
        showAlert('User already exist', Colors.red);
      } else {
        showAlert('Something went wrong!', Colors.red);
      }
    });
  }
}
