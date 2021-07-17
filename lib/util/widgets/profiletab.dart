import 'package:archi_mat/util/widgets/divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../../theme.dart';

class ProfileTab extends StatefulWidget {
  final dynamic text;
  final Function onclick;
  final bool bold;
  final bool option;

  const ProfileTab(
      {Key key, this.onclick, this.text, @required this.bold, this.option})
      : super(key: key);

  @override
  _ProfileTabState createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  bool push = false;
  @override
  void initState() {
    if (!widget.bold) {
      push = widget.option;
    }
    print(widget.onclick);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Divider_Widgets(),
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
          child: InkWell(
            onTap: widget.onclick,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.text),
                widget.bold
                    ? Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border:
                                Border.all(color: AppTheme().grey, width: 1)),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        ),
                      )
                    : FlutterSwitch(
                        activeColor: AppTheme().purple,
                        width: 50.0,
                        height: 30.0,
                        // valueFontSize: 25.0,
                        // toggleSize: 45.0,
                        value: push,
                        borderRadius: 30.0,
                        padding: 5.0,
                        // showOnOff: true,
                        onToggle: (val) {
                          setState(() {
                            push = val;
                          });
                        },
                      ),
              ],
            ),
          ),
        ),
        Divider_Widgets(),
      ],
    );
  }
}
