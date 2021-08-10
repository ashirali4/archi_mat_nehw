import 'package:archi_mat/theme.dart';
import 'package:archi_mat/util/widgets/back.dart';
import 'package:archi_mat/util/widgets/divider.dart';
import 'package:archi_mat/util/widgets/logout.dart';
import 'package:archi_mat/util/widgets/profilepic.dart';
import 'package:archi_mat/util/widgets/profiletab.dart';
import 'package:flutter/material.dart';

class BusinessEditProfile extends StatefulWidget {
  final dynamic data;
  const BusinessEditProfile({Key key, this.data}) : super(key: key);

  @override
  _BusinessEditProfileState createState() => _BusinessEditProfileState();
}

class _BusinessEditProfileState extends State<BusinessEditProfile> {
  TextEditingController username = new TextEditingController();
  @override
  void initState() {
    userdetail();
    super.initState();
  }

  userdetail() {}
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: AppTheme().white,
      child: Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              Back_Widgets(
                onclick: () {
                  Navigator.pop(context);
                },
              ),
              ProfilepicWidgets(
                image: '',
              ),
              SizedBox(
                height: 40,
              ),
              Divider_Widgets(),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      // width: MediaQuery.of(context).size.width * 0.65,
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      // width: MediaQuery.of(context).size.width * 0.65,
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      // width: MediaQuery.of(context).size.width * 0.65,
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text('Address'),
                      alignment: Alignment.topLeft,
                      width: 70,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      // width: MediaQuery.of(context).size.width * 0.65,
                      // height: 20,
                      child: TextField(
                        keyboardType: TextInputType.text,
                        maxLines: 2,
                        controller: username,
                        decoration: InputDecoration(
                            hintText: 'Address....',
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      // width: MediaQuery.of(context).size.width * 0.65,
                      // height: 20,
                      child: TextField(
                        keyboardType: TextInputType.text,
                        controller: username,
                        decoration: InputDecoration(
                            hintText: 'Email',
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text('Mobile'),
                      alignment: Alignment.topLeft,
                      width: 70,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      // width: MediaQuery.of(context).size.width * 0.65,
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text('Company'),
                      alignment: Alignment.topLeft,
                      width: 70,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      // width: MediaQuery.of(context).size.width * 0.65,
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
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text('Registration Number'),
                      alignment: Alignment.topLeft,
                      width: 75,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      // width: MediaQuery.of(context).size.width * 0.65,
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
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text('Bio'),
                      alignment: Alignment.topLeft,
                      width: 70,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      // width: MediaQuery.of(context).size.width * 0.65,
                      // height: 20,
                      child: TextField(
                        keyboardType: TextInputType.text,
                        maxLength: 255,
                        controller: username,
                        maxLines: 4,
                        decoration: InputDecoration(
                          hintText: 'Xxxxxxxxxxxxxxx',
                          hintStyle: TextStyle(color: Colors.grey),
                          border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Divider_Widgets(),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text('Website'),
                      alignment: Alignment.topLeft,
                      width: 70,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      // width: MediaQuery.of(context).size.width * 0.65,
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
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text('Virtual Shop'),
                      alignment: Alignment.topLeft,
                      width: 70,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      // width: MediaQuery.of(context).size.width * 0.65,
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
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text('Virtual Event'),
                      alignment: Alignment.topLeft,
                      width: 70,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      // width: MediaQuery.of(context).size.width * 0.65,
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
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text('Hotline'),
                      alignment: Alignment.topLeft,
                      width: 70,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      // width: MediaQuery.of(context).size.width * 0.65,
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
              ProfileTab(
                bold: false,
                text: 'Link Facebook',
                option: true,
                onclick: () {},
              ),
              Divider_Widgets(),
              ProfileTab(
                bold: false,
                text: 'Link Instagram',
                option: true,
                onclick: () {},
              ),
              Divider_Widgets(),
              ProfileTab(
                bold: false,
                text: 'Link Google Business',
                option: true,
                onclick: () {},
              ),
              Logou_button()
            ],
          ),
        )),
      ),
    );
  }
}
