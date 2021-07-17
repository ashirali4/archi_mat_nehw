import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../theme.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({Key key}) : super(key: key);

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  int i = 0;
  List category = ['All', "Tiles", "Comment", 'Furniture'];
  List material = [
    // {'image': 'assets/images/search.svg', 'name': 'Search'},
    {'image': 'assets/images/1.svg', 'name': 'BRICK'},
    {'image': 'assets/images/2.svg', 'name': 'WALL'},
    {'image': 'assets/images/3.svg', 'name': 'CEILING'},
    {'image': 'assets/images/4.svg', 'name': 'CEMENT'},
    {'image': 'assets/images/5.svg', 'name': 'DEMOLITION'},
    {'image': 'assets/images/1.svg', 'name': 'BRICK'},
    {'image': 'assets/images/2.svg', 'name': 'WALL'},
    {'image': 'assets/images/3.svg', 'name': 'CEILING'},
    {'image': 'assets/images/4.svg', 'name': 'CEMENT'},
    {'image': 'assets/images/5.svg', 'name': 'DEMOLITION'},
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 120,
          child:
              // loader
              //     ? Center(child: CircularProgressIndicator())
              //     :
              ListView.builder(
            itemCount: material.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                  padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                  child: Container(
                    width: 75,
                    // height: 70,
                    color: AppTheme().white,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          i = index;
                        });
                      },
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: AppTheme().grey, width: 1)),
                            child: CircleAvatar(
                              radius: 35,
                              backgroundColor: i == index
                                  ? AppTheme().purple
                                  : AppTheme().white,
                              child: SvgPicture.asset(
                                material[index]['image'],
                                width: 25,
                                color: i == index
                                    ? AppTheme().white
                                    : AppTheme().grey,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            material[index]['name'],
                            style: AppTheme().primaryTextStyle(false),
                          ),
                        ],
                      ),
                    ),
                  ));
            },
          ),
        ),
      ],
    );
  }
}
