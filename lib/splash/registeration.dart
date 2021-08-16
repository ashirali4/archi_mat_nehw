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
  TextEditingController uname = new TextEditingController();
  TextEditingController lname = new TextEditingController();
  TextEditingController number = new TextEditingController();

  String token;
  bool passwordmatch = false, birth = true;
  var countrycode = '+92';
  var newphone, gender;
  bool loader = false;

  @override
  initState() {
    super.initState();
    FirebaseMessaging.instance.getToken().then((tokeen) {
      print(tokeen);
      this.token = tokeen;
      print(token);
    });
  }

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1955, 8),
        lastDate: DateTime.now());
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        birth = false;
      });
  }

  showAlert(text, backcolor) {
    print('infunction');
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
        title: Text('Signup'),
        centerTitle: true,
      ),
      body: InkWell(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child:
                // Stack(
                //   children: [
                //     Image(
                //       image: AssetImage('assets/images/splashbg.png'),
                //       fit: BoxFit.cover,
                //       width: MediaQuery.of(context).size.width,
                //       // height: MediaQuery.of(context).size.height * 0.2,
                //     ),
                Container(
              width: MediaQuery.of(context).size.width,
              // height: 300,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/splashbg.png'),
                      fit: BoxFit.cover)),
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                      child: ProfilepicWidgets(
                    image: '',
                    update: true,
                  )),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: AppTheme().black)),
                    child: TextField(
                      keyboardType: TextInputType.text,
                      controller: uname,
                      decoration: InputDecoration(
                        hintText: 'User Name',
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
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            CountryCodePicker(
                              padding: EdgeInsets.all(0),
                              showFlag: true,
                              initialSelection: 'PK',
                              favorite: ['+92', 'PK'],
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
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: AppTheme().black)),
                    child: InkWell(
                      onTap: () => _selectDate(context),
                      child: Text(birth
                          ? 'Date of Birth'
                          : "${selectedDate.toLocal()}".split(' ')[0]),
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
                    child: GenderPickerWithImage(
                      showOtherGender: true,
                      verticalAlignedText: true,
                      selectedGender: Gender.Male,
                      selectedGenderTextStyle: TextStyle(
                          color: Color(0xFF8b32a8),
                          fontWeight: FontWeight.bold),
                      unSelectedGenderTextStyle: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.normal),
                      onChanged: (Gender val) {
                        print(val);
                        setState(() {
                          if (val == Gender.Male) {
                            gender = 'Male';
                          } else if (val == Gender.Female) {
                            gender = 'Female';
                          } else {
                            gender = 'Other';
                          }
                        });
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
                  loader
                      ? Center(child: CircularProgressIndicator())
                      : GestureDetector(
                          onTap: () {
                            FocusScope.of(context)
                                .requestFocus(new FocusNode());
                            print(selectedDate.toString());
                            print(birth);
                            print(newphone);
                            print(email.text);
                            print(pswd.text);
                            print(lname.text);
                            print(fname.text);
                            if (email.text.isEmpty ||
                                pswd.text.isEmpty ||
                                lname.text.trim().isEmpty ||
                                fname.text.trim().isEmpty ||
                                uname.text.trim().isEmpty ||
                                birth ||
                                newphone == null) {
                              print('Please Fill All Field');
                              showAlert("Please Fill All Field", Colors.red);
                            } else if (!passwordmatch) {
                              print(
                                  'Pasword and Confirm Pasword does`t match!');
                              showAlert(
                                  "Pasword and Confirm Pasword does`t match!",
                                  Colors.red);
                            } else {
                              print('signup');
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
            // ],
          ),
        ),
      ),
      // )
    );
  }

  signup() async {
    setState(() {
      loader = true;
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var data = {
      'email': email.text,
      'username': uname.text,
      'password': pswd.text,
      'mob_token': token,
      'firstname': fname.text.trim(),
      'lastname': lname.text.trim(),
      'gender': gender != null ? gender : 'Male',
      'birthday': selectedDate.toString(),
      'phone': countrycode + newphone,
      'image': prefs.getString('image')
    };
    print(data);
    LoginService().signup(data).then((value) {
      print(value);
      if (value['message'] == 'success') {
        if (value['user']['role']['name'] == 'user') {
          print('user');
          prefs.remove('image');
          prefs.setString('user', jsonEncode(value['user']));

          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (context) => TabPage(
                        index: 0,
                        data: null,
                      )),
              (Route<dynamic> route) => false);
        } else {
          setState(() {
            loader = false;
          });
          showAlert('User not available', Colors.red);
          print('User not available');
        }
      } else {
        setState(() {
          loader = false;
        });
        showAlert(value['message'], Colors.red);
      }
    });
  }
}
