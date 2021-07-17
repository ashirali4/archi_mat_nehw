import 'package:archi_mat/util/widgets/title.dart';
import 'package:flutter/material.dart';

import '../../theme.dart';

class InstList extends StatefulWidget {
  final dynamic data;
  final String title;
  const InstList({Key key, this.data, this.title}) : super(key: key);

  @override
  _InstListState createState() => _InstListState();
}

class _InstListState extends State<InstList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Title_Widgets(
          text: widget.title,
          onclick: null,
          bold: false,
        ),
        Container(
          height: 150,
          color: AppTheme().white,
          child:
              // loader
              //     ? Center(child: CircularProgressIndicator())
              //     :
              ListView.builder(
            itemCount: widget.data.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                width: MediaQuery.of(context).size.width * 0.5,
                decoration: BoxDecoration(
                    border: Border.all(color: AppTheme().grey),
                    image: DecorationImage(
                        image: AssetImage(widget.data[index]['image']),
                        fit: BoxFit.cover),
                    color: AppTheme().white),
              );
            },
          ),
        ),
      ],
    );
  }
}
