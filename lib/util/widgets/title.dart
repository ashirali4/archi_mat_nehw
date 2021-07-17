import 'package:archi_mat/util/widgets/divider.dart';
import 'package:flutter/material.dart';

import '../../theme.dart';

// ignore: camel_case_types
class Title_Widgets extends StatelessWidget {
  final dynamic text;
  final Function onclick;
  final bool bold;
  const Title_Widgets({Key key, this.onclick, this.text, @required this.bold})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider_Widgets(),
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                this.text,
                style: TextStyle(
                    color: AppTheme().grey,
                    fontSize: 15,
                    fontWeight:
                        this.bold == true ? FontWeight.bold : FontWeight.w500),
              ),
              InkWell(
                onTap: this.onclick,
                child: Row(
                  children: [
                    Text('See All ',
                        style: TextStyle(
                          color: AppTheme().grey,
                        )),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                      color: AppTheme().grey,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Divider_Widgets(),
      ],
    );
  }
}
