import 'package:archi_mat/environment.dart';
import 'package:archi_mat/userside/category.dart';
import 'package:archi_mat/util/widgets/divider.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

import '../../theme.dart';

class CategoryList extends StatefulWidget {
  final dynamic category;
  final bool subcategory;
  const CategoryList({Key key, this.category, this.subcategory})
      : super(key: key);

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  int i = 0;
  List category = ['All', "Tiles", "Comment", 'Furniture'];
  // List material = [
  //   // {'image': 'assets/images/search.svg', 'name': 'Search'},
  //   {'image': 'assets/images/1.svg', 'name': 'BRICK'},
  //   {'image': 'assets/images/2.svg', 'name': 'WALL'},
  //   {'image': 'assets/images/3.svg', 'name': 'CEILING'},
  //   {'image': 'assets/images/4.svg', 'name': 'CEMENT'},
  //   {'image': 'assets/images/5.svg', 'name': 'DEMOLITION'},
  //   {'image': 'assets/images/1.svg', 'name': 'BRICK'},
  //   {'image': 'assets/images/2.svg', 'name': 'WALL'},
  //   {'image': 'assets/images/3.svg', 'name': 'CEILING'},
  //   {'image': 'assets/images/4.svg', 'name': 'CEMENT'},
  //   {'image': 'assets/images/5.svg', 'name': 'DEMOLITION'},
  // ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: 20),
          height: 116,
          child:
              // loader
              //     ? Center(child: CircularProgressIndicator())
              //     :
              ListView.builder(
            itemCount: widget.category.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                  padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                  child: Container(
                    width: 60,
                    // height: 70,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CategoryPage(
                                      dat: widget.category[index]['id'],
                                      dat1: widget.subcategory,
                                    )));
                      },
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: AppTheme().l1black, width: 1)),
                            child: CircleAvatar(
                              radius: 35,
                              // backgroundColor: i == index
                              //     ? AppTheme().purple
                              //     : AppTheme().white,
                              backgroundColor: AppTheme().white,
                              child: Image.network(
                                Config.url + widget.category[index]['image'],
                                width: 25,
                                // color: i == index
                                //     ? AppTheme().white
                                //     : AppTheme().l1black,
                              ),
                            ),
                          ),
                          // SizedBox(
                          //   height: 5,
                          // ),
                          Text(
                            widget.category[index]['name'].length > 20
                                ? widget.category[index]['name']
                                        .toString()
                                        .substring(0, 20) +
                                    '... '
                                : widget.category[index]['name'],
                            style: AppTheme().primaryTextStyle(false),
                          ),
                          // SizedBox(
                          //   height: 5,
                          // ),
                        ],
                      ),
                    ),
                  ));
            },
          ),
        ),
        Divider_Widgets(),

      ],
    );
  }
}
