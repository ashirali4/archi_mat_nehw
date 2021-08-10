import 'dart:convert';
import 'dart:io';

import 'package:archi_mat/Services/loginService.dart';
import 'package:archi_mat/theme.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:image_picker/image_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../environment.dart';

class ProfilepicWidgets extends StatefulWidget {
  final dynamic image;
  const ProfilepicWidgets({Key key, this.image}) : super(key: key);

  @override
  _ProfilepicWidgetsState createState() => _ProfilepicWidgetsState();
}

class _ProfilepicWidgetsState extends State<ProfilepicWidgets> {
  File img1;
  final picker = ImagePicker();
  ProgressDialog pr;
  String image = '';
  @override
  void initState() {
    setState(() {
      if (widget.image != '') {
        image = widget.image;
      } else {
        image = '';
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    pr = ProgressDialog(
      context,
      type: ProgressDialogType.Normal,
      // textDirection: TextDirection.rtl,
      isDismissible: false,
    );

    pr.style(
//      message: 'Downloading file...',
      message: 'Uploading',
      borderRadius: 10.0,
      backgroundColor: Colors.white,
      elevation: 10.0,
      insetAnimCurve: Curves.easeInOut,
      progress: 0.0,
      progressWidgetAlignment: Alignment.center,
      maxProgress: 100.0,
      progressTextStyle: TextStyle(
          color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
      messageTextStyle: TextStyle(
          color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600),
    );
    return Stack(
      children: [
        Container(
          height: 100,
          child: CircleAvatar(
            radius: 50,
            backgroundColor: Colors.grey[200],
            backgroundImage: image != ''
                ? NetworkImage(Config.url + image)
                : AssetImage('assets/images/mask.png'),
          ),
        ),
        Positioned(
          right: 0,
          top: 57,
          child: Container(
            child: InkWell(
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: AppTheme().l1black,
                    blurRadius: 1,
                    offset: Offset(1, 2), // Shadow position
                  ),
                ], color: AppTheme().white, shape: BoxShape.circle),
                child: Icon(
                  FontAwesomeIcons.pen,
                  size: 15,
                  color: AppTheme().l1black,
                ),
              ),
              onTap: () {
                _showDialogue(context);
              },
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _showDialogue(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Choose Source'),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                  iconSize: 50,
                  icon: Icon(Icons.camera_alt),
                  onPressed: () {
                    opencamera(context);
                  },
                ),
                IconButton(
                  iconSize: 50,
                  icon: Icon(Icons.photo_library),
                  onPressed: () {
                    opengallery(context);
                  },
                ),
              ],
            ),
          );
        });
  }

  Future opencamera(BuildContext context) async {
    // final pickedFile = await picker.getImage(source: ImageSource.camera);
    final pickedFile1 =
        await picker.getImage(source: ImageSource.camera, imageQuality: 30);
    Navigator.pop(context);

    setState(() {
      img1 = File(pickedFile1.path);
      print(img1);
      String base64Image = base64Encode(img1.readAsBytesSync());
      String fileName = img1.path.split("/").last;
      dynamic data = {
        'image': base64Image,
        'name': fileName,
      };
      uploadimg(data);
    });
  }

  Future opengallery(BuildContext context) async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    Navigator.pop(context);

    setState(() {
      img1 = File(pickedFile.path);
      print(img1);
      String base64Image = base64Encode(img1.readAsBytesSync());
      String fileName = img1.path.split("/").last;
      print(fileName);
      dynamic data = {
        'image': base64Image,
        'name': fileName,
      };
      print('data');
      print(data);

      // print(data);

      uploadimg(data);
    });
  }

  uploadimg(data) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    print(data);
    print('hereeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee');
    await pr.show();
    // print(data['id']);
    LoginService().imageupload(data).then((value) {
      print(value);
      if (value['message'] == 'success') {
        setState(() {
          image = data['name'];
          print('image');
          print(image);
          pref.setString('image', image);
          // imageshow = true;
          hideprogresbar();
        });
      } else {
        // Toast.show('Something went wrong'.tr().toString(), context,
        //     duration: 2);
      }
    });
  }

  hideprogresbar() {
    Future.delayed(Duration(seconds: 2)).then((onValue) {
      if (pr.isShowing()) pr.hide().then((isHidden) {});
    });
  }
}
