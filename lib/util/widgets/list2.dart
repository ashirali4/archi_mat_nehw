import 'package:flutter/material.dart';

import '../../theme.dart';

class List2 extends StatefulWidget {
  const List2({Key key}) : super(key: key);

  @override
  _List2State createState() => _List2State();
}

class _List2State extends State<List2> {
  @override
  Widget build(BuildContext context) {
    int j = 0;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppTheme().grey, width: 1)),
            child: Icon(
              Icons.search,
              size: 20,
              color: AppTheme().grey,
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                j = 0;
              });
            },
            child: Container(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              decoration: j != 0
                  ? BoxDecoration(
                      color: AppTheme().white,
                    )
                  : BoxDecoration(
                      color: AppTheme().white,
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: AppTheme().lblack, width: 1)),
              child: Text(
                'New',
                style: AppTheme().primaryTextStyle(false),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                j = 1;
              });
            },
            child: Container(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              decoration: j != 1
                  ? BoxDecoration(
                      color: AppTheme().white,
                    )
                  : BoxDecoration(
                      color: AppTheme().white,
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: AppTheme().lblack, width: 1)),
              child: Text(
                'Top',
                style: AppTheme().primaryTextStyle(false),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                j = 2;
              });
            },
            child: Container(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              decoration: j != 2
                  ? BoxDecoration(
                      color: AppTheme().white,
                    )
                  : BoxDecoration(
                      color: AppTheme().white,
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: AppTheme().lblack, width: 1)),
              child: Text(
                'Minimalist',
                style: AppTheme().primaryTextStyle(false),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                j = 3;
              });
            },
            child: Container(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              decoration: j != 3
                  ? BoxDecoration(
                      color: AppTheme().white,
                    )
                  : BoxDecoration(
                      color: AppTheme().white,
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: AppTheme().lblack, width: 1)),
              child: Text(
                'Eco',
                style: AppTheme().primaryTextStyle(false),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
