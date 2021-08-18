import 'package:archi_mat/environment.dart';
import 'package:archi_mat/theme.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class SliderPage extends StatefulWidget {
  final bool text;
  final dynamic data;
  const SliderPage({Key key, this.text, this.data}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  List slider = [
    {'image': 'assets/images/hero3.png', 'name': ''},
    {'image': 'assets/images/hero3.png', 'name': ''},
    {'image': 'assets/images/hero3.png', 'name': ''},
  ];

  // final List<String> imageList = [
  //   "assets/images/hero3.png",
  //   "assets/images/Rectangle.png",
  //   "assets/images/Rectangle1.png",
  //   "assets/images/2.png",
  //   "assets/images/3.png",
  // ];
  List imageList = [
    "https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg",
    "https://cdn.pixabay.com/photo/2017/12/13/00/23/christmas-3015776_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/19/10/55/christmas-market-4705877_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/20/00/03/road-4707345_960_720.jpg",
    "https://cdn.pixabay.com/photo/2016/11/22/07/09/spruce-1848543__340.jpg"
  ];
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
            height: 480,
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
                return Stack(
                  children: [
                    Container(
                      height: 480,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        // image: DecorationImage(
                        //     image: NetworkImage(item['path']),
                        //     CachedNetworkImage(
                        //   imageUrl: item['path'],
                        //   placeholder: (context, url) =>
                        //       CircularProgressIndicator(),
                        // ),
                        // fit: BoxFit.fill),
                      ),
                      width: MediaQuery.of(context).size.width,
                      // height: 200,
                      // margin: EdgeInsets.only(right: 8),

                      child: CachedNetworkImage(
                        width: MediaQuery.of(context).size.width,
                        height: 200,
                        imageUrl: widget.data != null
                            ? Config.url + item['image']
                            : item,
                        memCacheHeight: 200,
                        memCacheWidth: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                    widget.text
                        ? Container()
                        : Positioned(
                            top: 20,
                            left: 20,
                            child: Column(
                              children: [
                                widget.data != null
                                    ? Text(
                                        item['title'],
                                        style: TextStyle(
                                            color: AppTheme().white,
                                            fontSize: 20),
                                      )
                                    : Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Hello Eva Tee',
                                            style: TextStyle(
                                                color: AppTheme().white,
                                                fontSize: 15),
                                          ),
                                          Text(
                                            'How can we help you?',
                                            style: TextStyle(
                                                color: AppTheme().white,
                                                fontSize: 20),
                                          ),
                                        ],
                                      ),
                              ],
                            )),
                  ],
                );
              },
            );
          }).toList(),
        ),
        Positioned(
          right: 30,
          top: (240.0 - (imageList.length * 8)),
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
  // Widget build(BuildContext context) {
  //   return Column(
  //     children: [
  //       CarouselSlider(
  //         options: CarouselOptions(
  //           height: 450,
  //           viewportFraction: 1,
  //           initialPage: 0,
  //           enableInfiniteScroll: true,
  //           reverse: false,
  //           autoPlay: true,
  //           autoPlayInterval: Duration(seconds: 4),
  //           autoPlayAnimationDuration: Duration(milliseconds: 1500),
  //           autoPlayCurve: Curves.linearToEaseOut,
  //           enlargeCenterPage: true,
  //           onPageChanged: (index, reason) {
  //             this.setState(() {
  //               this.currentIndexPage = index;
  //             });
  //           },
  //           scrollDirection: Axis.horizontal,
  //         ),
  //         items: this.imageList.map((item) {
  //           return Builder(
  //             builder: (BuildContext context) {
  //               return Padding(
  //                   padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
  //                   child: Stack(
  //                     children: <Widget>[
  //                       Container(
  //                         height: 450,
  //                         decoration: BoxDecoration(
  //                           borderRadius: BorderRadius.circular(5),
  //                           // image: DecorationImage(
  //                           //     image: NetworkImage(item['path']),
  //                           //     CachedNetworkImage(
  //                           //   imageUrl: item['path'],
  //                           //   placeholder: (context, url) =>
  //                           //       CircularProgressIndicator(),
  //                           // ),
  //                           // fit: BoxFit.fill),
  //                         ),
  //                         width: MediaQuery.of(context).size.width,
  //                         // height: 200,
  //                         // margin: EdgeInsets.only(right: 8),

  //                         child: CachedNetworkImage(
  //                           width: MediaQuery.of(context).size.width,
  //                           height: 200,
  //                           imageUrl: item,
  //                           memCacheHeight: 200,
  //                           memCacheWidth: 200,
  //                           fit: BoxFit.cover,
  //                           // placeholder: (context, url) =>
  //                           //     CircularProgressIndicator(),
  //                         ),
  //                       ),
  //                       widget.text
  //                           ? Container()
  //                           : Positioned(
  //                               top: 20,
  //                               left: 20,
  //                               child: Column(
  //                                 crossAxisAlignment: CrossAxisAlignment.start,
  //                                 children: [
  //                                   Text(
  //                                     'Hello Eva Tee',
  //                                     style: TextStyle(
  //                                         color: AppTheme().white,
  //                                         fontSize: 15),
  //                                   ),
  //                                   Text(
  //                                     'How can we help you?',
  //                                     style: TextStyle(
  //                                         color: AppTheme().white,
  //                                         fontSize: 20),
  //                                   ),
  //                                 ],
  //                               )),
  //                       Positioned(
  //                         right: 30,
  //                         top: MediaQuery.of(context).size.width / 2,
  //                         child: DotsIndicator(
  //                           // mainAxisAlignment: MainAxisAlignment.center,
  //                           axis: Axis.vertical,
  //                           dotsCount: imageList.length,
  //                           position: double.parse(currentIndexPage.toString()),
  //                           decorator: DotsDecorator(
  //                             color: Colors.black, // Inactive color
  //                             activeColor: Colors.white,
  //                           ),
  //                         ),
  //                       )
  //                     ],
  //                   ));
  //             },
  //           );
  //         }).toList(),
  //       ),
  //       // GFCarousel(
  //       //   items: imageList.map(
  //       //     (url) {
  //       //       return Stack(
  //       //         children: [
  //       //           Container(
  //       //             margin: EdgeInsets.all(8.0),
  //       //             width: MediaQuery.of(context).size.width,
  //       //             height: 500,
  //       //             child: ClipRRect(
  //       //               borderRadius: BorderRadius.all(Radius.circular(5.0)),
  //       //               child: Image.asset(url,
  //       //                   fit: BoxFit.cover,
  //       //                   width: MediaQuery.of(context).size.width
  //       //                   //  1000.0
  //       //                   ),
  //       //             ),
  //       //           ),
  //       //           widget.text
  //       //               ? Container()
  //       //               : Positioned(
  //       //                   top: 20,
  //       //                   left: 20,
  //       //                   child: Column(
  //       //                     crossAxisAlignment: CrossAxisAlignment.start,
  //       //                     children: [
  //       //                       Text(
  //       //                         'Hello Eva Tee',
  //       //                         style: TextStyle(
  //       //                             color: AppTheme().white, fontSize: 15),
  //       //                       ),
  //       //                       Text(
  //       //                         'How can we help you?',
  //       //                         style: TextStyle(
  //       //                             color: AppTheme().white, fontSize: 20),
  //       //                       ),
  //       //                     ],
  //       //                   ))
  //       //         ],
  //       //       );
  //       //     },
  //       //   ).toList(),
  //       //   onPageChanged: (index) {
  //       //     // setState(() {
  //       //     //   index;
  //       //     // });
  //       //   },
  //       // ),
  //     ],
  //   );
  // }
}
