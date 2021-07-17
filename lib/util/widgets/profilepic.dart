import 'package:archi_mat/theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: camel_case_types
class Profilepic_Widgets extends StatelessWidget {
  final Function onclick;

  const Profilepic_Widgets({
    Key key,
    this.onclick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 100,
          child: CircleAvatar(
            radius: 50,
            backgroundColor: Colors.grey[200],
            backgroundImage:
                //  image != null && imageshow == true
                //     ? NetworkImage(Config.url + '/' + image)
                //     :
                AssetImage('assets/images/mask.png'),
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
                // _showDialogue(context);
              },
            ),
          ),
        ),
      ],
    );
  }
}
