import 'package:archi_mat/Services/shopService.dart';
import 'package:archi_mat/util/slider/profileslider.dart';
import 'package:archi_mat/util/widgets/businesslist.dart';
import 'package:flutter/material.dart';
import '../environment.dart';
import '../theme.dart';

class ShopHomePage extends StatefulWidget {
  final dynamic data;
  final bool shop;
  const ShopHomePage({Key key, this.data, this.shop}) : super(key: key);

  @override
  _ShopHomePageState createState() => _ShopHomePageState();
}

class _ShopHomePageState extends State<ShopHomePage> {
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
                      image: slider,
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      decoration: BoxDecoration(
                        border: Border.all(width: 0.5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.68,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                    // Text(
                                    //   'Verified',
                                    //   style: TextStyle(fontSize: 12),
                                    // ),
                                    // SmoothStarRating(
                                    //     allowHalfRating: false,
                                    //     onRated: (v) {},
                                    //     starCount: 5,
                                    //     rating: rating,
                                    //     size: 15.0,
                                    //     isReadOnly: true,
                                    //     // fullRatedIconData: Icons.blur_off,
                                    //     // halfRatedIconData: Icons.blur_on,
                                    //     color: Colors.green,
                                    //     borderColor: Colors.green,
                                    //     spacing: 0.0)
                                  ],
                                ),
                              ],
                            ),
                          ),
                          widget.shop
                              ? Container()
                              : Container(
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
                              Text(product.length.toString())
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
                    BusinessList(shop: shop, product: product)
                  ],
                ),
        ),
      ),
    );
  }
}
