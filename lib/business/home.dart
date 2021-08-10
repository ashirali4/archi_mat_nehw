import 'package:archi_mat/Services/shopService.dart';
import 'package:archi_mat/util/slider/profileslider.dart';
import 'package:archi_mat/util/widgets/businesslist.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import '../environment.dart';
import '../theme.dart';

class BusinessHome extends StatefulWidget {
  final dynamic data;
  const BusinessHome({Key key, this.data}) : super(key: key);

  @override
  _BusinessHomeState createState() => _BusinessHomeState();
}

class _BusinessHomeState extends State<BusinessHome> {
  double rating = 3.5, i = 0;
  bool loader = true;
  var shop, product;
  List slider = [];
  @override
  void initState() {
    getshop();
    super.initState();
  }

  getshop() {
    setState(() {
      loader = true;
    });

    ShopService().getshop(widget.data['id']).then((value) {
      print(value);
      setState(() {
        if (value != null) {
          var data = value;
          print(data['product']);
          shop = data['shop'];
          product = data['product'];
          slider = data['slider'];
          loader = false;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: loader
              ? Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height,
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: [
                    ProfileSliderPage(
                      image: null,
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
                                  backgroundImage: widget.data['image'] != null
                                      ? NetworkImage(Config.url +
                                          '/' +
                                          widget.data['image'])
                                      : AssetImage('assets/images/mask.png'),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          widget.data['name'],
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
                                border: Border.all(
                                    color: AppTheme().l1black, width: 1)),
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
                          decoration:
                              BoxDecoration(border: Border.all(width: 0.5)),
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
                          decoration:
                              BoxDecoration(border: Border.all(width: 0.5)),
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
                              Text(shop['shop_type']['name'])
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.25,
                          height: 80,
                          padding: EdgeInsets.all(10),
                          decoration:
                              BoxDecoration(border: Border.all(width: 0.5)),
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
                          decoration:
                              BoxDecoration(border: Border.all(width: 0.5)),
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
                    BusinessList()
                  ],
                ),
        ),
      ),
    );
  }
}
