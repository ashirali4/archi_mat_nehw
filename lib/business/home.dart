import 'package:archi_mat/util/slider/slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import '../theme.dart';

class BusinessHome extends StatefulWidget {
  const BusinessHome({Key key}) : super(key: key);

  @override
  _BusinessHomeState createState() => _BusinessHomeState();
}

class _BusinessHomeState extends State<BusinessHome> {
  double rating = 3.5, i = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SliderPage(
              text: false,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              decoration: BoxDecoration(
                border: Border.all(width: 0.5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.65,
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.grey[200],
                          backgroundImage:
                              //  image != null && imageshow == true
                              //     ? NetworkImage(Config.url + '/' + image)
                              //     :
                              AssetImage('assets/images/mask.png'),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Username',
                                  style: TextStyle(fontSize: 15),
                                ),
                                Text(
                                  '@username',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Verified',
                              style: TextStyle(fontSize: 12),
                            ),
                            SmoothStarRating(
                                allowHalfRating: false,
                                onRated: (v) {},
                                starCount: 5,
                                rating: rating,
                                size: 15.0,
                                isReadOnly: true,
                                // fullRatedIconData: Icons.blur_off,
                                // halfRatedIconData: Icons.blur_on,
                                color: Colors.green,
                                borderColor: Colors.green,
                                spacing: 0.0)
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // width: 150,
                    alignment: Alignment.center,
                    padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border:
                            Border.all(color: AppTheme().l1black, width: 1)),
                    child: Text('Follow'),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  height: 80,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(border: Border.all(width: 0.5)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Listing',
                        style: TextStyle(fontSize: 12),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text('24')
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  height: 80,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(border: Border.all(width: 0.5)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Industry',
                        style: TextStyle(fontSize: 12),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text('Interior Designer')
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  height: 80,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(border: Border.all(width: 0.5)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Country',
                        style: TextStyle(fontSize: 12),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text('Malaysia')
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  height: 80,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(border: Border.all(width: 0.5)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Followers',
                        style: TextStyle(fontSize: 12),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text('1244')
                    ],
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              decoration: BoxDecoration(
                border: Border.all(width: 0.5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        i = 0;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      decoration: i != 0
                          ? BoxDecoration(
                              color: AppTheme().white,
                            )
                          : BoxDecoration(
                              color: AppTheme().l1black,
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(
                                  color: AppTheme().lblack, width: 1)),
                      child: Text(
                        'Listing',
                        style:
                            AppTheme().primaryTextStyle(i == 0 ? true : false),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        i = 1;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      decoration: i != 1
                          ? BoxDecoration(
                              color: AppTheme().white,
                            )
                          : BoxDecoration(
                              color: AppTheme().l1black,
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(
                                  color: AppTheme().lblack, width: 1)),
                      child: Text(
                        'Reviews',
                        style:
                            AppTheme().primaryTextStyle(i == 1 ? true : false),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        i = 2;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      decoration: i != 2
                          ? BoxDecoration(
                              color: AppTheme().white,
                            )
                          : BoxDecoration(
                              color: AppTheme().l1black,
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(
                                  color: AppTheme().lblack, width: 1)),
                      child: Text(
                        'Shop',
                        style:
                            AppTheme().primaryTextStyle(i == 2 ? true : false),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        i = 3;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                      decoration: i != 3
                          ? BoxDecoration(
                              color: AppTheme().white,
                            )
                          : BoxDecoration(
                              color: AppTheme().l1black,
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(
                                  color: AppTheme().lblack, width: 1)),
                      child: Text(
                        'About',
                        style:
                            AppTheme().primaryTextStyle(i == 3 ? true : false),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
