import 'package:archi_mat/util/widgets/divider.dart';
import 'package:flutter/material.dart';

import '../../theme.dart';

class List1 extends StatefulWidget {
  const List1({Key key}) : super(key: key);

  @override
  _List1State createState() => _List1State();
}

class _List1State extends State<List1> {
  int i = 0;
  @override
  Widget build(BuildContext context) {
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
                  print(i.toString());
                  setState(() {
                    i = 0;
                    print(i.toString());
                  });
                },
                child: Container(
                  padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                  alignment: Alignment.center,
                  width: i == 0 ? 90 : 50,
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
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    i = 1;
                    print(i.toString());
                  });
                },
                child: Container(
                  padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                  alignment: Alignment.center,
                  width: i == 1 ? 90 : 50,
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
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    i = 2;
                    print(i.toString());
                  });
                },
                child: Container(
                  padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                  alignment: Alignment.center,
                  width: i == 2 ? 90 : 50,
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
                    style: TextStyle(
                      fontSize: 12,
                    ),
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
                  padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                  alignment: Alignment.center,
                  width: i == 3 ? 90 : 50,
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
                    style: TextStyle(
                      fontSize: 12,
                    ),
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
