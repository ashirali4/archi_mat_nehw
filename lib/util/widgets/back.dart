import 'package:archi_mat/util/widgets/divider.dart';
import 'package:flutter/material.dart';

import '../../theme.dart';

// ignore: camel_case_types
class Back_Widgets extends StatelessWidget {
  final Function onclick;

  const Back_Widgets({
    Key key,
    this.onclick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: onclick,
            child: Container(
              padding: EdgeInsets.fromLTRB(10, 5, 5, 5),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppTheme().grey, width: 1)),
              child: Icon(
                Icons.arrow_back_ios,
                size: 15,
              ),
            ),
          )
        ],
      ),
    );
  }
}
