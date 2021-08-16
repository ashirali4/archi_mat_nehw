import 'package:archi_mat/splash/splash.dart';
import 'package:archi_mat/util/widgets/divider.dart';
import 'package:flutter/material.dart';
import 'package:archi_mat/theme.dart';
import 'package:dots_indicator/dots_indicator.dart';

class VirtualMaterialScreen1 extends StatefulWidget {
  @override
  _VirtualMaterialScreen1State createState() => _VirtualMaterialScreen1State();
}

class _VirtualMaterialScreen1State extends State<VirtualMaterialScreen1> {
  @override
  void initState() {
    super.initState();
  }

  double i = 0;
  double currentIndex = 0;
  List<String> items = [
    'assets/images/Capture.PNG',
    'assets/images/Capture.PNG',

    'assets/images/Capture.PNG',

    //  'assets/images/2.png',
    //  'assets/images/3.png'
  ];

  Widget slider() {
    return Column(
      children: [
        Container(
            height: 220.0,
            child: Container(
                padding: EdgeInsets.all(15),
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                child: Image(
                  width: 400,
                  // height: 500,
                  image: AssetImage(items[i.toInt()]),
                  fit: BoxFit.fill,
                ))),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height,
                color: AppTheme().white,
              ),

              // Image(
              //   image: AssetImage('assets/images/splashbg.png'),
              //   fit: BoxFit.fitHeight,
              //   width: MediaQuery.of(context).size.width,
              // ),
              SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 15),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    i > 0
                                        ? IconButton(
                                            icon: Icon(
                                              Icons.arrow_back_ios,
                                              color: AppTheme().grey,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                i--;
                                                currentIndex = i;
                                              });
                                            },
                                          )
                                        : Container(
                                            height: 20,
                                          ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.of(context)
                                            .pushAndRemoveUntil(
                                                MaterialPageRoute(
                                                    builder:
                                                        (context) =>
                                                            SplashScreen()),
                                                (Route<dynamic> route) =>
                                                    false);
                                      },
                                      child: Text(
                                        'SKIP',
                                        style: TextStyle(
                                          color: AppTheme().grey,
                                        ),
                                      ),
                                    )
                                  ]),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 30),
                              child: Column(children: [
                                Center(
                                  child: Text(
                                    i == 0
                                        ? 'Discover \n More New Things'
                                        : i == 1
                                            ? 'Experience \n Virtually'
                                            : 'Save Your \n Fave Materials',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 32,
                                        color: Colors.black54,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 15),
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    width: 40,
                                    height: 1.5,
                                    color: Colors.black54,
                                  ),
                                ),
                                Text(
                                  'World Of Architectural & \n Building Materials',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 20),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Container(child: slider()),
                                SizedBox(
                                  height: 5,
                                ),
                                Center(
                                  // alignment: Alignment.center,
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: new DotsIndicator(
                                      dotsCount: items.length,
                                      position: currentIndex,
                                      decorator: DotsDecorator(
                                        spacing:
                                            EdgeInsets.fromLTRB(5, 0, 5, 0),
                                        color: Colors.grey, // Inactive color
                                        activeColor: AppTheme().lightgrey,
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                            ),
                          ]),
                      Padding(
                        padding: const EdgeInsets.all(60.0),
                        child: InkWell(
                          onTap: () {
                            if (i < 2) {
                              setState(() {
                                i++;
                                currentIndex = i;
                              });
                            } else {
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) => SplashScreen()),
                                  (Route<dynamic> route) => false);
                            }
                          },
                          child: Container(
                              // padding: EdgeInsets.only(left: 15),

                              height: 50,
                              width: MediaQuery.of(context).size.width * 0.5,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 2,
                                        spreadRadius: 2,
                                        color: Colors.black54),
                                  ],
                                  color: AppTheme().white,
                                  borderRadius: BorderRadius.circular(25)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'NEXT',
                                    style: TextStyle(
                                        color: Colors.black,
                                        // fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  )
                                ],
                              )),
                        ),
                      ),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
