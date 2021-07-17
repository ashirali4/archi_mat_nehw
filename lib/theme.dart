import 'package:flutter/material.dart';

class AppTheme {
  // all colors here
  Color white = Colors.white;
  Color yellowdark = Colors.yellow[700];
  Color black = Colors.black87;
  Color lightblack = Colors.black12;
  Color lblack = Colors.black38;
  Color l1black = Colors.black54;
  Color blue = Colors.blue;
  Color whiteopacity = Colors.white.withOpacity(0.5);
  Color whiteopacity1 = Colors.white.withOpacity(0.8);
  Color grey = Colors.grey;
  Color lightgrey = Colors.grey[200];
  Color purple = Color(0xFFA12791);
  Color pink = Colors.pink;
  Color getstartedbg = Color(0xFF708491);
  Color lightblue = Colors.blue[50];
  Color yellow = Colors.yellow;
  Color loginBtnColor = Color(0xFFB7B7B7);
  Color virtualbg = Color(0xFF907070);

  double textPrimarySizeGlobal = 16;

  // Primary Text Style
  TextStyle primaryTextStyle(bool i) {
    return TextStyle(
      fontSize: 12,
      color: !i ? black : white,
    );
  }
}
