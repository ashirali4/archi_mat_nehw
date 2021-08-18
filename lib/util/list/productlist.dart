import 'package:archi_mat/environment.dart';
import 'package:archi_mat/userside/productDetail.dart';
import 'package:archi_mat/util/widgets/title.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme.dart';

class Productlist extends StatefulWidget {
  final int i;
  final dynamic data;
  final String title;
  // final Function onclick();
  const Productlist({Key key, this.i, this.data, this.title}) : super(key: key);

  @override
  _ProductlistState createState() => _ProductlistState();
}

class _ProductlistState extends State<Productlist> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Title_Widgets(
            text: widget.title,
            onclick: null,
            bold: false,
          ),
          Container(
            height: 241,
            alignment: Alignment.topLeft,
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
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    if (widget.i == 3) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetail(
                                    data: widget.data[index],
                                  )));
                    }
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: 230,
                    alignment: Alignment.topLeft,
                    decoration: BoxDecoration(
                        border: Border.all(color: AppTheme().grey,width: .5),
                        color: AppTheme().white),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              height: 185,
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom:
                                          BorderSide(color: AppTheme().grey)),
                                  image: DecorationImage(
                                      image: widget.i == 3
                                          ? widget.data[index]['images'] ==
                                                      null ||
                                                  widget.data[index]
                                                          ['images'] ==
                                                      ''
                                              ? AssetImage(
                                                  'assets/images/back.png')
                                              : NetworkImage(Config.url +
                                                  (widget.data[index]['images']
                                                      [0]['image']))
                                          : widget.i == 4
                                              ? widget.data[index]['image'] ==
                                                          null ||
                                                      widget.data[index]
                                                              ['image'] ==
                                                          ''
                                                  ? AssetImage(
                                                      'assets/images/back.png')
                                                  : NetworkImage(Config.url +
                                                      (widget.data[index]
                                                          ['image']))
                                              : AssetImage(
                                                  'assets/images/back.png'),
                                      // AssetImage(widget.data[index]['image']),
                                      fit: BoxFit.cover)),
                            ),
                            Positioned(
                              left: 10,
                              top: 10,
                              child: widget.i != 0 &&
                                      widget.i != 3 &&
                                      widget.i != 4
                                  ? Container(
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppTheme()
                                              .lightgrey
                                              .withOpacity(0.4),
                                          border: Border.all(
                                              color: AppTheme().l2black)),
                                      child: Text(
                                        widget.i == 1 ? 'VR' : 'AR',
                                        style: GoogleFonts.poppins(
                                            fontSize: 8,
                                            color: AppTheme().l2black),
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
                                style: GoogleFonts.poppins(fontSize: 15),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.i == 3
                                        ? widget.data[index]['shop']['name']
                                        : widget.i == 4
                                            ? ''
                                            : widget.data[index]['category'],
                                    style: GoogleFonts.poppins(color: AppTheme().l1black,
                                    fontSize: 12),
                                  ),
                                  // Container(
                                  //   width: 70,
                                  //   child: Row(
                                  //     mainAxisAlignment:
                                  //         MainAxisAlignment.spaceBetween,
                                  //     children: [
                                  //       // Container(
                                  //       //   decoration: BoxDecoration(
                                  //       //       shape: BoxShape.circle,
                                  //       //       border: Border.all(
                                  //       //           color: AppTheme().grey)),
                                  //       //   child: Icon(
                                  //       //     Icons.star,
                                  //       //     color: AppTheme().grey,
                                  //       //     size: 15,
                                  //       //   ),
                                  //       // ),
                                  //       // Container(
                                  //       //   padding: EdgeInsets.all(5),
                                  //       //   decoration: BoxDecoration(
                                  //       //       shape: BoxShape.circle,
                                  //       //       border: Border.all(
                                  //       //           color: AppTheme().grey)),
                                  //       //   child: Icon(FontAwesomeIcons.leaf,
                                  //       //       size: 10, color: AppTheme().grey),
                                  //       // ),
                                  //       // Container(
                                  //       //     padding: EdgeInsets.all(5),
                                  //       //     decoration: BoxDecoration(
                                  //       //         shape: BoxShape.circle,
                                  //       //         border: Border.all(
                                  //       //             color: AppTheme().grey)),
                                  //       //     child: Text(
                                  //       //       'VR',
                                  //       //       style: TextStyle(fontSize: 8),
                                  //       //     )),
                                  //     ],
                                  //   ),
                                  // )
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
      ),
    );
  }
}
