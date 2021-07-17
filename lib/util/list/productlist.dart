import 'package:archi_mat/util/widgets/title.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../theme.dart';

class Productlist extends StatefulWidget {
  final int i;
  final dynamic data;
  final String title;
  final Function onclick;
  const Productlist({Key key, this.i, this.data, this.title, this.onclick})
      : super(key: key);

  @override
  _ProductlistState createState() => _ProductlistState();
}

class _ProductlistState extends State<Productlist> {
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
          height: 180,
          // padding: EdgeInsets.only(left: 10),
          color: AppTheme().white,
          child:
              // loader
              //     ? Center(child: CircularProgressIndicator())
              //     :
              ListView.builder(
            // padding:
            //     const EdgeInsets.only(top: 5, right: 16, left: 16, bottom: 5),
            itemCount: widget.data.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: widget.onclick,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: 180,
                  decoration: BoxDecoration(
                      border: Border.all(color: AppTheme().grey),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(2, 2), // changes position of shadow
                        ),
                      ],
                      // borderRadius: BorderRadius.circular(15),
                      color: AppTheme().white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            height: 125,
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: AppTheme().grey)),
                                image: DecorationImage(
                                    image:
                                        AssetImage(widget.data[index]['image']),
                                    fit: BoxFit.cover)),
                          ),
                          Positioned(
                            left: 10,
                            top: 10,
                            child: widget.i != 0
                                ? Container(
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppTheme()
                                            .lightgrey
                                            .withOpacity(0.4),
                                        border:
                                            Border.all(color: AppTheme().grey)),
                                    child: Text(
                                      widget.i == 1 ? 'VR' : 'AR',
                                      style: TextStyle(fontSize: 8),
                                    ))
                                : Container(),
                          )
                        ],
                      ),
                      // SizedBox(
                      //   height: 5,
                      // ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.data[index]['name'],
                              style: TextStyle(fontSize: 15),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  widget.data[index]['category'],
                                  style: TextStyle(color: AppTheme().l1black),
                                ),
                                Container(
                                  width: 70,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: AppTheme().grey)),
                                        child: Icon(
                                          Icons.star,
                                          color: AppTheme().grey,
                                          size: 15,
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: AppTheme().grey)),
                                        child: Icon(FontAwesomeIcons.leaf,
                                            size: 10, color: AppTheme().grey),
                                      ),
                                      Container(
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  color: AppTheme().grey)),
                                          child: Text(
                                            'VR',
                                            style: TextStyle(fontSize: 8),
                                          )),
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
