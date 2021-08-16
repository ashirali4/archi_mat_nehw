import 'package:archi_mat/userside/shophome.dart';
import 'package:archi_mat/util/slider/profileslider.dart';
import 'package:archi_mat/util/widgets/divider.dart';
import 'package:flutter/material.dart';

import '../theme.dart';

class ProductDetail extends StatefulWidget {
  final dynamic data;
  const ProductDetail({Key key, this.data}) : super(key: key);

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  double rating = 3.5, i = 0;
  bool aboutText = true, loader = true;
  List image = [];
  String about =
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc,';
  @override
  void initState() {
    product();
    super.initState();
  }

  product() {
    setState(() {
      about = widget.data['desc'];

      image = widget.data['images'];
      print(image);
      print(widget.data);
      loader = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: loader
              ? Container(
                  height: MediaQuery.of(context).size.height,
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        ProfileSliderPage(
                          image: image,
                        ),
                        Positioned(
                          // bottom: 5,
                          top: 5,
                          left: 5,
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              padding: EdgeInsets.fromLTRB(10, 5, 5, 5),
                              decoration: BoxDecoration(
                                  color: AppTheme().l1black,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: AppTheme().white, width: 1)),
                              child: Icon(
                                Icons.arrow_back_ios,
                                size: 20,
                                color: AppTheme().white,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Divider_Widgets(),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(widget.data['name']),
                    ),
                    Divider_Widgets(),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Description'),
                          SizedBox(
                            height: 20,
                          ),
                          Text(about.length > 200 && aboutText
                              ? about.toString().substring(0, 200) + ' .....\n '
                              : about + '\n'),
                          about.length > 200 && aboutText
                              ? GestureDetector(
                                  child: Text(
                                    'More',
                                    style: TextStyle(color: AppTheme().blue),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      aboutText = false;
                                    });
                                  },
                                )
                              : about.length > 200
                                  ? GestureDetector(
                                      child: Text(
                                        'less',
                                        style:
                                            TextStyle(color: AppTheme().blue),
                                      ),
                                      onTap: () {
                                        setState(() {
                                          aboutText = true;
                                        });
                                      },
                                    )
                                  : Container(),
                        ],
                      ),
                    ),
                    Divider_Widgets(),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Text('Shop'),
                          ),
                          InkWell(
                            onTap: () {
                              print(
                                widget.data['shop'],
                              );
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ShopHomePage(
                                            data: widget.data['shop'],
                                            shop: false,
                                          )));
                            },
                            child: Container(
                              alignment: Alignment.centerLeft,
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: Text(
                                widget.data['shop']['name'],
                                style: TextStyle(color: AppTheme().blue),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider_Widgets(),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Text('Price'),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Text(widget.data['price'].toString()),
                          ),
                        ],
                      ),
                    ),
                    Divider_Widgets(),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Text('In Stock'),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Text(widget.data['stock'].toString()),
                          ),
                        ],
                      ),
                    ),
                    Divider_Widgets(),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Text('Category'),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Text(widget.data['category']['name'] +
                                '>' +
                                widget.data['subcategory']['name']),
                          ),
                        ],
                      ),
                    ),
                    Divider_Widgets(),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Text('Size'),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Text(widget.data['size']),
                          ),
                        ],
                      ),
                    ),
                    Divider_Widgets(),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Text('Product Code'),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Text(widget.data['productCode']),
                          ),
                        ],
                      ),
                    ),
                    Divider_Widgets(),
                  ],
                ),
        ),
      ),
    );
  }
}
