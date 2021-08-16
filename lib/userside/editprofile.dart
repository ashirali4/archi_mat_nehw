import 'dart:convert';

import 'package:archi_mat/theme.dart';
import 'package:archi_mat/util/widgets/back.dart';
import 'package:archi_mat/util/widgets/divider.dart';
import 'package:archi_mat/util/widgets/profilepic.dart';
import 'package:flutter/material.dart';
import 'package:gender_picker/source/enums.dart';
import 'package:gender_picker/source/gender_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserEditProfile extends StatefulWidget {
  const UserEditProfile({Key key}) : super(key: key);

  @override
  _UserEditProfileState createState() => _UserEditProfileState();
}

class _UserEditProfileState extends State<UserEditProfile> {
  TextEditingController username = new TextEditingController();
  TextEditingController lname = new TextEditingController();
  TextEditingController fname = new TextEditingController();
  TextEditingController phone = new TextEditingController();
  TextEditingController email = new TextEditingController();
  String image = '';
  var countrycode = '+92';
  var detail;
  var newphone, gender;
  Gender _gender;
  DateTime selectedDate = DateTime.now();
  // var gender;
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
          fname.text = detail['firstname'];
          lname.text = detail['lastname'];
          email.text = detail['email'];
          phone.text = detail['phoneNo'];
          if (detail['gender'] == 'Male' || detail['gender'] == 'male') {
            _gender = Gender.Male;
          } else if (detail['gender'] == 'Female' ||
              detail['gender'] == 'female') {
            _gender = Gender.Female;
          } else {
            _gender = Gender.Others;
          }
          print(_gender);
          selectedDate = DateTime.parse(detail['dateofbirth']);

          loader = false;
        });
      }
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1955, 8),
        lastDate: DateTime.now());
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
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
                        Expanded(
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
                        Expanded(
                          child: TextField(
                            keyboardType: TextInputType.text,
                            controller: fname,
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
                        Expanded(
                          child: TextField(
                            keyboardType: TextInputType.text,
                            controller: lname,
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
                  // Padding(
                  //   padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       Container(
                  //         child: Text('Gender'),
                  //         alignment: Alignment.topLeft,
                  //         width: 70,
                  //       ),
                  //       // SizedBox(
                  //       //   width: 20,
                  //       // ),
                  //       // Expanded(
                  //       //   child: TextField(
                  //       //     keyboardType: TextInputType.text,
                  //       //     controller: username,
                  //       //     decoration: InputDecoration(
                  //       //         hintText: 'Gender',
                  //       //         hintStyle: TextStyle(color: Colors.grey),
                  //       //         border: InputBorder.none),
                  //       //   ),
                  //       // )
                  //     ],
                  //   ),
                  // ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                    child: Text('Gender'),
                    alignment: Alignment.topLeft,
                    width: MediaQuery.of(context).size.width,
                  ),
                  GenderPickerWithImage(
                    showOtherGender: true,
                    verticalAlignedText: true,
                    selectedGender: Gender.Male,
                    selectedGenderTextStyle: TextStyle(
                        color: Color(0xFF8b32a8), fontWeight: FontWeight.bold),
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
                  SizedBox(
                    height: 20,
                  ),
                  Divider_Widgets(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Text('D.O.B'),
                          alignment: Alignment.topLeft,
                          width: 70,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: InkWell(
                              onTap: () => _selectDate(context),
                              child: Text(
                                  "${selectedDate.toLocal()}".split(' ')[0])),
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
                        Expanded(
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                              // CountryCodePicker(
                              //   padding: EdgeInsets.all(0),
                              //   showFlag: true,
                              //   initialSelection: 'PK',
                              //   // favorite: ['+92', 'PK'],
                              //   onChanged: (code) {
                              //     this.countrycode = code.toString();
                              //     print(countrycode);
                              //   },
                              // ),
                              // Container(
                              //   height: 30.0,
                              //   width: 1.0,
                              //   color: Colors.blue,
                              //   margin: const EdgeInsets.only(
                              //       left: 10.0, right: 10.0),
                              // ),
                              Expanded(
                                child: TextField(
                                  enabled: false,
                                  controller: phone,
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Phone Number",
                                  ),
                                  onChanged: (value) {
                                    if (phone.text.isNotEmpty) {
                                      if (value[0] != '0') {
                                        this.newphone = value;
                                      } else {
                                        this.newphone = value.substring(1);
                                      }
                                    }
                                  },
                                ),
                              ),
                            ]))
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
                        Expanded(
                          child: TextField(
                            keyboardType: TextInputType.text,
                            controller: email,
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
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            )),
    );
  }

  update() {
    // if(val['message']='success'){}
  }
}
