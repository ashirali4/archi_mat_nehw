import 'package:flutter/material.dart';

import '../../theme.dart';

// ignore: camel_case_types
class Divider_Widgets extends StatelessWidget {
  const Divider_Widgets({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: AppTheme().l1black,
      thickness: 1,
      height: 1,
    );
  }
}
