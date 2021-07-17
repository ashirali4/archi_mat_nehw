import 'package:archi_mat/util/widgets/divider.dart';
import 'package:flutter/material.dart';

import '../../theme.dart';

class List1 extends StatefulWidget {
  const List1({Key key}) : super(key: key);

  @override
  _List1State createState() => _List1State();
}

class _List1State extends State<List1> {
  @override
  Widget build(BuildContext context) {
    int i = 0;
    return Column(
      children: [
        Divider_Widgets(),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    i = 0;
                  });
                },
                child: Container(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  decoration: i != 0
                      ? BoxDecoration(
                          color: AppTheme().white,
                        )
                      : BoxDecoration(
                          color: AppTheme().white,
                          borderRadius: BorderRadius.circular(25),
                          border:
                              Border.all(color: AppTheme().lblack, width: 1)),
                  child: Text(
                    'Shops',
                    style: AppTheme().primaryTextStyle(false),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    i = 1;
                  });
                },
                child: Container(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  decoration: i != 1
                      ? BoxDecoration(
                          color: AppTheme().white,
                        )
                      : BoxDecoration(
                          color: AppTheme().white,
                          borderRadius: BorderRadius.circular(25),
                          border:
                              Border.all(color: AppTheme().lblack, width: 1)),
                  child: Text(
                    'Products',
                    style: AppTheme().primaryTextStyle(false),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    i = 2;
                  });
                },
                child: Container(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  decoration: i != 2
                      ? BoxDecoration(
                          color: AppTheme().white,
                        )
                      : BoxDecoration(
                          color: AppTheme().white,
                          borderRadius: BorderRadius.circular(25),
                          border:
                              Border.all(color: AppTheme().lblack, width: 1)),
                  child: Text(
                    'Services',
                    style: AppTheme().primaryTextStyle(false),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    i = 3;
                  });
                },
                child: Container(
                  padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                  decoration: i != 3
                      ? BoxDecoration(
                          color: AppTheme().white,
                        )
                      : BoxDecoration(
                          color: AppTheme().white,
                          borderRadius: BorderRadius.circular(25),
                          border:
                              Border.all(color: AppTheme().lblack, width: 1)),
                  child: Text(
                    'Events',
                    style: AppTheme().primaryTextStyle(false),
                  ),
                ),
              ),
            ],
          ),
        ),
        Divider_Widgets()
      ],
    );
  }
}
