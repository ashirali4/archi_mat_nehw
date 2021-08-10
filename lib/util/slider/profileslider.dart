import 'package:archi_mat/environment.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProfileSliderPage extends StatefulWidget {
  final dynamic image;
  const ProfileSliderPage({Key key, this.image}) : super(key: key);

  @override
  _ProfileSliderPageState createState() => _ProfileSliderPageState();
}

class _ProfileSliderPageState extends State<ProfileSliderPage> {
  bool loader = false;

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
    getproduct();
    super.initState();
  }

  getproduct() {
    if (widget.image != null) {
      setState(() {
        imageList = [];
        imageList = widget.image;
        loader = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return loader
        ? Container(
            height: MediaQuery.of(context).size.height,
            alignment: Alignment.center,
            child: CircularProgressIndicator(),
          )
        : Stack(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  height: 250,
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
                      return InkWell(
                        onTap: () {
                          // Navigator.of(context).push(MaterialPageRoute(
                          //     builder: (BuildContext context) {
                          //   return Scaffold(
                          //     extendBodyBehindAppBar: true,
                          //     appBar: AppBar(
                          //       backgroundColor: Colors.transparent,
                          //       iconTheme: IconThemeData(
                          //         color: Colors.white, //change your color here
                          //       ),
                          //     ),
                          //     body: Center(
                          //       child: Panorama(
                          //         child:
                          //             Image.network(Config.url + item['image']),
                          //       ),
                          //     ),
                          //   );
                          // }));
                        },
                        child: Container(
                          height: 450,
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
                          child: CachedNetworkImage(
                              width: MediaQuery.of(context).size.width,
                              height: 200,
                              imageUrl: widget.image != null
                                  ? Config.url + item['image']
                                  : item,
                              memCacheHeight: 200,
                              memCacheWidth: 200,
                              fit: BoxFit.cover),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              Positioned(
                bottom: 0,
                left: ((MediaQuery.of(context).size.width * 0.5) -
                    (imageList.length * 10)),
                child: DotsIndicator(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  // axis: Axis.vertical,
                  dotsCount: imageList.length,
                  position: double.parse(currentIndexPage.toString()),
                  decorator: DotsDecorator(
                    color: Colors.black, // Inactive color
                    activeColor: Colors.white,
                  ),
                ),
              )
            ],
          );
  }
}
