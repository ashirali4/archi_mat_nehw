import 'package:archi_mat/environment.dart';
import 'package:archi_mat/theme.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class Slider1Page extends StatefulWidget {
  final dynamic data;
  const Slider1Page({Key key, this.data}) : super(key: key);

  @override
  _Slider1PageState createState() => _Slider1PageState();
}

class _Slider1PageState extends State<Slider1Page> {
  List slider = [
    {'image': 'assets/images/hero3.png', 'name': ''},
    {'image': 'assets/images/hero3.png', 'name': ''},
    {'image': 'assets/images/hero3.png', 'name': ''},
  ];

  List imageList = [
    "assets/images/hero3.png",
    "assets/images/hero3.png",
    "assets/images/hero3.png",
  ];
  // final List<String> imageList = [
  //   "https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg",
  //   "https://cdn.pixabay.com/photo/2017/12/13/00/23/christmas-3015776_960_720.jpg",
  //   "https://cdn.pixabay.com/photo/2019/12/19/10/55/christmas-market-4705877_960_720.jpg",
  //   "https://cdn.pixabay.com/photo/2019/12/20/00/03/road-4707345_960_720.jpg",
  //   "https://cdn.pixabay.com/photo/2016/11/22/07/09/spruce-1848543__340.jpg"
  // ];
  var currentIndexPage = 0;
  @override
  void initState() {
    setState(() {
      if (widget.data != null) {
        imageList = widget.data;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 200,
            viewportFraction: 1,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 4),
            autoPlayAnimationDuration: Duration(milliseconds: 1500),
            autoPlayCurve: Curves.linearToEaseOut,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              this.setState(() {
                this.currentIndexPage = index;
              });
            },
            scrollDirection: Axis.horizontal,
          ),
          items: this.imageList.map((item) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                        image: widget.data != null
                            ? NetworkImage(Config.url + item['image'])
                            : AssetImage(item),
                        fit: BoxFit.fitWidth),
                  ),
                  width: MediaQuery.of(context).size.width,
                  // height: 200,
                  // // margin: EdgeInsets.only(right: 8),

                  // child: CachedNetworkImage(
                  //   width: MediaQuery.of(context).size.width,
                  //   height: 200,
                  //   imageUrl: item,
                  //   memCacheHeight: 200,
                  //   memCacheWidth: 200,
                  //   fit: BoxFit.cover,
                  // ),
                );
              },
            );
          }).toList(),
        ),
        Positioned(
          right: 30,
          top: (100.0 - (imageList.length * 8)),
          child: DotsIndicator(
            // mainAxisAlignment: MainAxisAlignment.center,
            axis: Axis.vertical,
            dotsCount: imageList.length,
            position: double.parse(currentIndexPage.toString()),
            decorator: DotsDecorator(
              color: AppTheme().grey, // Inactive color
              activeColor: AppTheme().white,
            ),
          ),
        )
      ],
    );
  }
}
