import 'package:archi_mat/util/list/photolistgrid.dart';
import 'package:archi_mat/util/widgets/list2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../theme.dart';

class Feeds extends StatefulWidget {
  const Feeds({Key key}) : super(key: key);

  @override
  _FeedsState createState() => _FeedsState();
}

class _FeedsState extends State<Feeds> {
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
        title: Image(
          image: AssetImage('assets/images/archimat.png'),
          width: 150,
          height: 100,
        ),
        centerTitle: true,
        //   actions: <Widget>[
        //     Padding(
        //       padding: const EdgeInsets.only(right: 15),
        //       child: SvgPicture.asset(
        //         'assets/images/search.svg',
        //         color: AppTheme().l1black,
        //         width: 20,
        //       ),
        //     )
        //   ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            List2(),
            PhotoListGride(
              count: 4,
              data: product,
              i: 0,
              title: 'Find Interactive Events',
            ),
          ],
        ),
      ),
    );
  }
}
