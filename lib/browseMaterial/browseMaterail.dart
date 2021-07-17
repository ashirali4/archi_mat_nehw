import 'package:archi_mat/browseMaterial/viewVirtualMaterial.dart';
import 'package:archi_mat/pages/tab.dart';
import 'package:flutter/material.dart';
import 'package:archi_mat/theme.dart';

class VirtualMaterialScreen1 extends StatefulWidget {
  @override
  _VirtualMaterialScreen1State createState() => _VirtualMaterialScreen1State();
}

class _VirtualMaterialScreen1State extends State<VirtualMaterialScreen1> {
  @override
  void initState() {
    super.initState();
  }

  final List items = [
    {'img': 'assets/images/mask.png', 'name': 'Glass', 'desc': 'OCEAN BEACH'},
    {'img': 'assets/images/2.png', 'name': 'Paint ', 'desc': 'TORREY PINES'},
    {'img': 'assets/images/3.png', 'name': 'Yoga', 'desc': 'SOLONA BEACH'},
  ];

  Widget slider() {
    return Container(
        height: 200.0,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: this.items.length,
          itemBuilder: (BuildContext context, i) => GestureDetector(
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //       builder: (context) =>
              //           ItemDetailPage(text: this.item2[i])),
              // );
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
              child: Container(
                width: 150,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  color: Colors.white,
                  elevation: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: <Widget>[
                          Container(
                              width: 150,
                              height: 180,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                              )),
                          Container(
                            width: 150,
                            height: 110,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              image: DecorationImage(
                                  image: AssetImage(
                                    items[i]['img'],
                                  ),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 130),
                            child: Column(
                              children: [
                                Center(
                                  child: Container(
                                    // width: 90,
                                    child: Text(
                                      items[i]['name'],
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Color(0xFF0E3746),
                                      ),
                                      textScaleFactor: 1.0,
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Container(
                                    // width: 90,
                                    child: Text(
                                      items[i]['desc'],
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Color(0xFF0E3746),
                                      ),
                                      textScaleFactor: 1.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: 54,
                            right: 55,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 3,
                                      spreadRadius: 4,
                                      color: Colors.black12),
                                ],
                              ),
                              child: CircleAvatar(
                                radius: 17,
                                backgroundColor: AppTheme().white,
                                child: Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/1_surf.png'),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
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
                color: AppTheme().virtualbg.withOpacity(0.4),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                color: Colors.black38,
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
                                  horizontal: 15, vertical: 5),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                      icon: Icon(
                                        Icons.arrow_back_ios,
                                        color: AppTheme().white,
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.of(context)
                                            .pushAndRemoveUntil(
                                                MaterialPageRoute(
                                                    builder:
                                                        (context) =>
                                                            TabPage(index: 0)),
                                                (Route<dynamic> route) =>
                                                    false);
                                      },
                                      child: Text(
                                        'SKIP',
                                        style:
                                            TextStyle(color: AppTheme().white),
                                      ),
                                    )
                                  ]),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 60),
                              child: Column(children: [
                                Center(
                                  child: Text(
                                    'Explore \nNew Things',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 32,
                                        color: AppTheme().white,
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
                                    color: AppTheme().white,
                                  ),
                                ),
                                Text(
                                  'World of Architectural & \nBuilding Materials',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: AppTheme().white, fontSize: 20),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Container(child: slider()),
                              ]),
                            ),
                          ]),
                      Padding(
                        padding: const EdgeInsets.all(60.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    VirtualMaterialScreen2()));
                          },
                          child: Container(
                              // padding: EdgeInsets.only(left: 15),

                              height: 50,
                              width: MediaQuery.of(context).size.width * 0.5,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 5,
                                        spreadRadius: 4,
                                        color: Colors.black12),
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
