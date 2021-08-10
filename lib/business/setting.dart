import 'package:archi_mat/business/editprofile.dart';
import 'package:archi_mat/business/forget.dart';
import 'package:archi_mat/util/widgets/back.dart';
import 'package:archi_mat/util/widgets/divider.dart';
import 'package:archi_mat/util/widgets/logout.dart';
import 'package:archi_mat/util/widgets/profilepic.dart';
import 'package:archi_mat/util/widgets/profiletab.dart';
import 'package:flutter/material.dart';

class BusinessSetting extends StatefulWidget {
  const BusinessSetting({Key key}) : super(key: key);

  @override
  _BusinessSettingState createState() => _BusinessSettingState();
}

class _BusinessSettingState extends State<BusinessSetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Back_Widgets(
                onclick: () {
                  Navigator.pop(context);
                },
              ),
              ProfilepicWidgets(),
              SizedBox(
                height: 40,
              ),
              Divider_Widgets(),
              ProfileTab(
                bold: true,
                text: 'Edit Profile',
                onclick: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BusinessEditProfile()));
                },
              ),
              ProfileTab(
                bold: true,
                text: 'Change Password',
                onclick: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ForgetPassword()));
                },
              ),
              ProfileTab(
                bold: false,
                text: 'Push Notifications',
                option: true,
                onclick: () {},
              ),
              ProfileTab(
                bold: false,
                text: 'Allow Access to My Contacts',
                option: true,
                onclick: () {},
              ),
              ProfileTab(
                bold: false,
                text: 'Allow My Location',
                option: true,
                onclick: () {},
              ),
              ProfileTab(
                bold: false,
                text: 'Other Can See My Activity',
                option: true,
                onclick: () {},
              ),
              ProfileTab(
                bold: true,
                text: 'Support Center',
                onclick: () {},
              ),
              Logou_button()
            ],
          ),
        ),
      ),
    );
  }
}
