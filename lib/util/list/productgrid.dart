import 'package:archi_mat/environment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../theme.dart';

class ProductListGride extends StatefulWidget {
  final dynamic data;

  const ProductListGride({
    Key key,
    this.data,
  }) : super(key: key);

  @override
  _ProductListGrideState createState() => _ProductListGrideState();
}

class _ProductListGrideState extends State<ProductListGride> {
  List photos = [];
  int g = 0;
  bool loader = true;
  @override
  void initState() {
    print(widget.data);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.data.length == 0
        ? Center(
            child: Text('No product Available'),
          )
        : StaggeredGridView.countBuilder(
            scrollDirection: Axis.vertical,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            shrinkWrap: true,
            itemCount: widget.data.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: 276,
                decoration: BoxDecoration(
                    border: Border.all(color: AppTheme().grey),
                    color: AppTheme().white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      Config.url + widget.data[index]['image'],
                      width: MediaQuery.of(context).size.width,
                      height: 134,
                      fit: BoxFit.cover,
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
                          Text(
                            widget.data[index]['category']['name'],
                            style: TextStyle(color: AppTheme().l1black),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
            staggeredTileBuilder: (int index) {
              return new StaggeredTile.count(1, 1);
            });
  }
}
