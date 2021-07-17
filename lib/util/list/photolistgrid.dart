import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../theme.dart';

class PhotoListGride extends StatefulWidget {
  final int i;
  final int count;
  final dynamic data;
  final String title;
  const PhotoListGride({Key key, this.i, this.count, this.data, this.title})
      : super(key: key);

  @override
  _PhotoListGrideState createState() => _PhotoListGrideState();
}

class _PhotoListGrideState extends State<PhotoListGride> {
  List photos = [];
  int g = 0;
  bool loader = true;

  // 'assets/images/Image1.png',
  //   'assets/images/virtual.png',
  //   'assets/images/Image1.png',
  //   'assets/images/Image1.png',
  //   'assets/images/virtual.png',
  //   'assets/images/Image1.png',
  //   'assets/images/Image1.png',

  @override
  void initState() {
    reshap();
    super.initState();
  }

  reshap() {
    for (int k = 0; k < widget.data.length; k++) {
      if (g == 0) {
        photos.add({'add': 0});
      } else {
        photos.add({'add': 1});
      }
      setState(() {
        if (g == widget.count) {
          g = 0;
        } else {
          g = g + 1;
        }
      });
    }
    print(photos);
    setState(() {
      loader = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return loader
        ? Center(child: CircularProgressIndicator())
        : Container(
            // height: MediaQuery.of(context).size.height,
            // width: MediaQuery.of(context).size.width,
            child: StaggeredGridView.countBuilder(
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                shrinkWrap: true,
                itemCount: widget.data.length,
                itemBuilder: (BuildContext context, int index) {
                  if (photos[index]['add'] == 0) {
                    //for even row
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      // height: 200,
                      decoration: BoxDecoration(
                          border: Border.all(color: AppTheme().grey),
                          color: AppTheme().white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 145,
                            decoration: BoxDecoration(
                                // borderRadius: BorderRadius.only(
                                //     topLeft: Radius.circular(15),
                                //     topRight: Radius.circular(15)),
                                border: Border(
                                    bottom: BorderSide(color: AppTheme().grey)),
                                image: DecorationImage(
                                    image:
                                        AssetImage(widget.data[index]['image']),
                                    fit: BoxFit.cover)),
                          ),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      widget.data[index]['category'],
                                      style:
                                          TextStyle(color: AppTheme().l1black),
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
                                            child: Icon(
                                              FontAwesomeIcons.leaf,
                                              color: AppTheme().grey,
                                              size: 10,
                                            ),
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
                    );
                  } else {
                    return Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      // height: 200,
                      decoration: BoxDecoration(
                          border: Border.all(color: AppTheme().grey),

                          // borderRadius: BorderRadius.circular(15),
                          color: AppTheme().white),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            height: 145,
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: AppTheme().grey)),
                                image: DecorationImage(
                                    image:
                                        AssetImage(widget.data[index]['image']),
                                    fit: BoxFit.cover)),
                          ),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      widget.data[index]['category'],
                                      style:
                                          TextStyle(color: AppTheme().l1black),
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
                                                size: 10,
                                                color: AppTheme().grey),
                                          ),
                                          Container(
                                              padding: EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                      color: AppTheme().grey)),
                                              child: Text(
                                                'VR',
                                                style: TextStyle(
                                                    fontSize: 8,
                                                    color: AppTheme().grey),
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
                    );
                    //for odd row

                  }
                },
                staggeredTileBuilder: (int index) {
                  if (photos[index]['add'] != 1) {
                    return new StaggeredTile.count(2, 1);
                  } else {
                    return new StaggeredTile.count(1, 1);
                  }
                }
                // staggeredTileBuilder: (int index) {
                //   if (photos[index]['add'] == 1) {
                //     return new StaggeredTile.fit(2);
                //   } else {
                //     return new StaggeredTile.fit(1);
                //   }
                // },
                // mainAxisSpacing: 4.0,
                // crossAxisSpacing: 4.0,
                ),
          );
  }
}
