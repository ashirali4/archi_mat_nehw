import 'dart:convert';

import 'package:archi_mat/Services/fallowService.dart';
import 'package:archi_mat/Services/inboxService.dart';
import 'package:archi_mat/Services/shopService.dart';
import 'package:archi_mat/pages/chat.dart';
import 'package:archi_mat/util/slider/profileslider.dart';
import 'package:archi_mat/util/widgets/businesslist.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  int fallow = 0;
  bool loader = true, youfallow = false;
  var shop, product, userdata;
  List slider = [];
  @override
  void initState() {
    getshop();
    super.initState();
  }

  getshop() async {
    var pref = await SharedPreferences.getInstance();
    setState(() {
      loader = true;
      userdata = jsonDecode(pref.getString('user'));
      print(userdata);
    });
    var data = {'user': userdata['id'], 'shop': widget.data['id']};

    ShopService().getshop(data).then((value) {
      print(value);
      setState(() {
        if (value != null) {
          var data = value;
          print(data['product']);
          shop = data['shop'];
          product = data['product'];
          slider = data['slider'];
          fallow = data['fallow'];
          if (!widget.shop) {
            youfallow = data['youfallow'];
          }
          print('slider=================================');
          print(slider);
          print('slider=================================');

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
                    Stack(
                      children: [
                        ProfileSliderPage(
                          image: slider,
                        ),
                        Positioned(
                          // bottom: 5,
                          top: 5,
                          right: 5,
                          child: InkWell(
                            onTap: () {
                              message();
                            },
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: AppTheme().white, width: 2),
                                  color: AppTheme().l1black),
                              child: Icon(
                                Icons.message,
                                size: 20,
                                color: AppTheme().white,
                              ),
                            ),
                          ),
                        )
                      ],
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
                              : GestureDetector(
                                  child: Container(
                                    // width: 150,
                                    alignment: Alignment.center,
                                    padding:
                                        EdgeInsets.fromLTRB(15, 15, 15, 15),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: youfallow
                                            ? AppTheme().red
                                            : AppTheme().purple,
                                        border: Border.all(
                                            color: AppTheme().l1black,
                                            width: 1)),
                                    child: GestureDetector(
                                      onTap: () {
                                        fallow1();
                                      },
                                      child: Text(
                                        youfallow ? 'Unfallow' : 'Follow',
                                        style:
                                            TextStyle(color: AppTheme().white),
                                      ),
                                    ),
                                  ),
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

  fallow1() {
    var data = {'user': userdata['id'], 'shop': shop['id']};
    print(data);
    FallowService().fallow(data).then((value) {
      showAlert(value['message'], Colors.green);
      getshop();
    });
  }

  showAlert(text, backcolor) {
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  message() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ChatPage(
                  user: userdata,
                  shop: shop,
                  shopside: false,
                )));
  }
}
