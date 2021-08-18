import 'package:archi_mat/Services/categoryService.dart';
import 'package:archi_mat/Services/productService.dart';
import 'package:archi_mat/Services/service.dart';
import 'package:archi_mat/pages/drawer.dart';
import 'package:archi_mat/theme.dart';
import 'package:archi_mat/util/list/categorylist.dart';
import 'package:archi_mat/util/list/productlist.dart';
import 'package:archi_mat/util/slider/slider.dart';
import 'package:archi_mat/util/slider/slider1.dart';

import 'package:archi_mat/util/widgets/list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int i = 0, j = 0;
  List category = [],
      product1 = [],
      service = [],
      slider = [],
      slider2 = [],
      slider3 = [];

  bool loader = true;
  // List professional = [
  //   {'image': 'assets/images/card2.png', 'name': 'Architects'},
  //   {'image': 'assets/images/card10.png', 'name': 'Interior Designer'},
  //   {'image': 'assets/images/card9.png', 'name': 'Engineer'},
  //   {'image': 'assets/images/card8.png', 'name': 'Contractors'},
  // ];
  // List professional1 = [
  //   {'image': 'assets/images/professional1.png', 'name': 'Architects'},
  //   {'image': 'assets/images/professional.png', 'name': 'Interior Designer'},
  //   {'image': 'assets/images/professional3.png', 'name': 'Engineer'},
  //   {'image': 'assets/images/professional2.png', 'name': 'Contractors'},
  //   {'image': 'assets/images/professional1.png', 'name': 'Architects'},
  //   {'image': 'assets/images/professional.png', 'name': 'Interior Designer'},
  //   {'image': 'assets/images/professional3.png', 'name': 'Engineer'},
  //   {'image': 'assets/images/professional2.png', 'name': 'Contractors'},
  // // ];
  // List photos = [
  //   'assets/images/card1.png',
  //   'assets/images/card3.png',
  //   'assets/images/card4.png',
  //   'assets/images/card6.png',
  //   'assets/images/card7.png',
  //   'assets/images/2.png',
  //   'assets/images/Image1.png',
  //   'assets/images/card4.png',
  //   'assets/images/card6.png'
  // ];

  getcategory() {
    setState(() {
      loader = true;
    });
    CategoryService().getcategory().then((value) {
      print(value);
      setState(() {
        if (value != null) {
          // var data = jsonDecode(value);
          var data = value;
          print(data['arks']);
          category = data['arks'];
          // loader = false;
        }
      });
    });
  }

  getproduct() {
    // setState(() {
    //   loader = true;
    // });

    ProductService().getproduct().then((value) {
      print(value);
      setState(() {
        if (value != null) {
          var data = value;
          print(data['arks']);
          product1 = data['arks'];
          // loader = false;
        }
      });
    });
  }

  getservice() {
    // setState(() {
    //   loader = true;
    // });

    ServiceRoute().getservice().then((value) {
      print(value);
      setState(() {
        if (value != null) {
          var data = value;
          print(data['arks']);
          service = data['arks'];
          // loader = false;
        }
      });
    });
  }

  getslider() {
    setState(() {
      loader = true;
    });

    ProductService().getslider().then((value) {
      print(value);
      setState(() {
        if (value != null) {
          var data = value;
          // print(data['arks']);
          slider = data['slider1'];
          slider2 = data['slider2'];
          slider3 = data['slider3'];
          loader = false;
        }
      });
    });
  }

  List product = [
    {
      'image': 'assets/images/product.png',
      'name': 'Mererials',
      'category': 'Shop'
    },
    {
      'image': 'assets/images/product1.png',
      'name': 'Showrooms',
      'category': 'Shop'
    },
    {
      'image': 'assets/images/product2.png',
      'name': 'Event',
      'category': 'Shop'
    },
    {
      'image': 'assets/images/product.png',
      'name': 'Mererials',
      'category': 'Shop'
    },
    {
      'image': 'assets/images/product1.png',
      'name': 'Showrooms',
      'category': 'Shop'
    },
    {
      'image': 'assets/images/product2.png',
      'name': 'Event',
      'category': 'Shop'
    },
  ];

  @override
  void initState() {
    getcategory();
    getproduct();
    getservice();
    getslider();
    super.initState();
  }

  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        drawer: Menu2(),
        appBar: AppBar(
          backgroundColor: AppTheme().white,
          leading: GestureDetector(
            onTap: () => scaffoldKey.currentState.openDrawer(),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppTheme().black)),
                child: SvgPicture.asset(
                  'assets/images/menu.svg',
                  color: AppTheme().l1black,
                  width: 20,
                ),
              ),
            ),
          ),
          title: Image(
            image: AssetImage('assets/images/archimat.png'),
            width: 150,
            height: 100,
          ),
          centerTitle: true,
          // actions: <Widget>[
          //   Padding(
          //     padding: const EdgeInsets.only(right: 15),
          //     child: SvgPicture.asset(
          //       'assets/images/search.svg',
          //       color: AppTheme().l1black,
          //       width: 20,
          //     ),
          //   )
          // ],
        ),
        body: loader
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SliderPage(
                      text: false,
                      data: slider,
                    ),
                    List1(),
                    CategoryList(
                      category: category,
                      subcategory: false,
                    ),
                    Productlist(
                      // onclick: () {
                      //   Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //           builder: (context) => ProductDetail()));
                      // },
                      i: 3,
                      data: product1,
                      title: 'Find Materials Around You',
                    ),
                    Slider1Page(
                      data: slider2,
                    ),
                    Productlist(
                      i: 1,
                      data: product,
                      title: 'Find Virtual Shops',
                    ),
                    Productlist(
                      i: 2,
                      data: product,
                      title: 'Find AR Product',
                    ),
                    Productlist(
                      i: 4,
                      data: service,
                      title: 'Find Professional Services',
                    ),
                    Slider1Page(
                      data: slider3,
                    ),
                    // Productlist(
                    //   i: 0,
                    //   data: product,
                    //   title: 'Find Interactive Events',
                    // ),
                    // Title_Widgets(
                    //   bold: false,
                    //   text: 'Latest Feed',
                    // ),
                    // List2(),
                    // PhotoListGride(
                    //   i: 0,
                    //   count: 2,
                    //   data: product,
                    //   title: 'Find Interactive Events',
                    // ),
                    // InstList(
                    //   data: product,
                    //   title: 'Instagram #archimat.xr',
                    // ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
