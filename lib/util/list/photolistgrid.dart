import 'package:archi_mat/environment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

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
    dynamic width = MediaQuery.of(context).size.width;
    // dynamic height = MediaQuery.of(context).size.height;
    return loader
        ? Center(child: CircularProgressIndicator())
        : StaggeredGridView.countBuilder(
            scrollDirection: Axis.vertical,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            shrinkWrap: true,
            itemCount: widget.data.length,
            itemBuilder: (BuildContext context, int index) {
              // if (photos[index]['add'] == 0) {
              //   //for even row
              //   return ImageCard(
              //     data: widget.data[index],
              //     width: width,
              //     height: 400.0,
              //   );
              // } else {
              return ImageCard(
                data: widget.data[index],
                i: widget.i,
                width: width * 0.5,
                // height: 400.0,
              );
              // }
            },
            staggeredTileBuilder: (int index) {
              print(photos[index]['add']);
              if (photos[index]['add'] != 1) {
                // return new StaggeredTile.fit(2);
                return new StaggeredTile.count(2, 1);
              } else {
                return new StaggeredTile.count(1, 1);
                // return new StaggeredTile.fit(1);
              }
            });
  }
}

class ImageCard extends StatefulWidget {
  final dynamic data;
  final dynamic i;
  final dynamic width;
  final dynamic height;
  const ImageCard({Key key, this.data, this.width, this.height, this.i})
      : super(key: key);

  @override
  _ImageCardState createState() => _ImageCardState();
}

class _ImageCardState extends State<ImageCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: widget.width,
      // height: widget.height,
      decoration: BoxDecoration(
          border: Border.all(color: AppTheme().grey), color: AppTheme().white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration:
                BoxDecoration(border: Border.all(color: AppTheme().grey)),
            child: widget.i == 1
                ? Image.network(
                    Config.url + widget.data['images'][0]['image'],
                    width: MediaQuery.of(context).size.width,
                    height: 132,
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    widget.data['image'],
                    width: MediaQuery.of(context).size.width,
                    height: 132,
                    fit: BoxFit.cover,
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.data['name'],
                  style: TextStyle(fontSize: 15),
                ),
                Text(
                  widget.i != 1
                      ? widget.data['category']
                      : widget.data['category']['name'],
                  // widget.data['category'],
                  style: TextStyle(color: AppTheme().l1black),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
