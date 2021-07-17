import 'package:archi_mat/business/home.dart';
import 'package:archi_mat/business/setting.dart';
import 'package:archi_mat/theme.dart';
import 'package:archi_mat/util/list/categorylist.dart';
import 'package:archi_mat/util/list/instagram.dart';
import 'package:archi_mat/util/list/photolistgrid.dart';
import 'package:archi_mat/util/list/productlist.dart';
import 'package:archi_mat/util/slider/slider.dart';
import 'package:archi_mat/util/widgets/list.dart';
import 'package:archi_mat/util/widgets/list2.dart';
import 'package:archi_mat/util/widgets/title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int i = 0, j = 0;
  List professional = [
    {'image': 'assets/images/card2.png', 'name': 'Architects'},
    {'image': 'assets/images/card10.png', 'name': 'Interior Designer'},
    {'image': 'assets/images/card9.png', 'name': 'Engineer'},
    {'image': 'assets/images/card8.png', 'name': 'Contractors'},
  ];
  List professional1 = [
    {'image': 'assets/images/professional1.png', 'name': 'Architects'},
    {'image': 'assets/images/professional.png', 'name': 'Interior Designer'},
    {'image': 'assets/images/professional3.png', 'name': 'Engineer'},
    {'image': 'assets/images/professional2.png', 'name': 'Contractors'},
    {'image': 'assets/images/professional1.png', 'name': 'Architects'},
    {'image': 'assets/images/professional.png', 'name': 'Interior Designer'},
    {'image': 'assets/images/professional3.png', 'name': 'Engineer'},
    {'image': 'assets/images/professional2.png', 'name': 'Contractors'},
  ];
  List photos = [
    'assets/images/card1.png',
    'assets/images/card3.png',
    'assets/images/card4.png',
    'assets/images/card6.png',
    'assets/images/card7.png',
    'assets/images/2.png',
    'assets/images/Image1.png',
    'assets/images/card4.png',
    'assets/images/card6.png'
  ];

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme().white,
        leading: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            // padding: EdgeInsets.only(left: 10),
            child: SvgPicture.asset(
              'assets/images/menu.svg',
              color: AppTheme().l1black,
              width: 20,
            ),
          ),
        ),
        title: Image(
          image: AssetImage('assets/images/archimat.png'),
          width: 150,
          height: 100,
        ),
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: SvgPicture.asset(
              'assets/images/search.svg',
              color: AppTheme().l1black,
              width: 20,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SliderPage(
              text: false,
            ),
            List1(),
            // SizedBox(
            //   height: 20,
            // ),
            CategoryList(),

            Productlist(
              onclick: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BusinessHome()));
              },
              i: 0,
              data: product,
              title: 'Find Materials Around You',
            ),
            SliderPage(
              text: true,
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
              i: 0,
              data: product,
              title: 'Find Professional Services',
            ),
            SliderPage(text: true),
            Productlist(
              i: 0,
              data: product,
              title: 'Find Interactive Events',
            ),
            Title_Widgets(
              bold: false,
              text: 'Latest Feed',
            ),
            List2(),
            PhotoListGride(
              i: 0,
              count: 2,
              data: product,
              title: 'Find Interactive Events',
            ),
            InstList(
              data: product,
              title: 'Instagram #archimat.xr',
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
