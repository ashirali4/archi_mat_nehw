import 'package:archi_mat/pages/inbox.dart';
import 'package:archi_mat/userside/category.dart';
import 'package:archi_mat/userside/feeds.dart';
import 'package:archi_mat/userside/homepage.dart';
import 'package:archi_mat/theme.dart';
import 'package:archi_mat/userside/shophome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TabPage extends StatefulWidget {
  final int index;
  final dynamic data;
  TabPage({@required this.index, this.data});
  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  // PageController _controller = PageController(
  //   initialPage: 0,
  // );
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
  int _page = 0;
  bool check = true;

  getPage() {
    if (_page == 0) {
      return AnimatedContainer(
          color: AppTheme().white,
          duration: Duration(seconds: 1),
          child: widget.data != null
              ? ShopHomePage(
                  data: widget.data,
                  shop: true,
                )
              : HomePage());
    }
    if (_page == 1) {
      return AnimatedContainer(
        color: AppTheme().white,
        duration: Duration(seconds: 1),
        child: widget.data != null
            ? Inbox(
                shopside: true,
              )
            : CategoryPage(
                dat1: false,
              ),
      );
    }

    if (_page == 2) {
      return AnimatedContainer(
          color: AppTheme().white,
          duration: Duration(seconds: 1),
          child: Feeds());
    }
    if (_page == 3) {
      return AnimatedContainer(
          color: AppTheme().white,
          duration: Duration(seconds: 1),
          child: Container());
    }
    if (_page == 4) {
      return AnimatedContainer(
          color: AppTheme().white,
          duration: Duration(seconds: 1),
          child: Container());
    }
  }

  List pages = [];
  String logstatment = 'You Need To Login First \nTo Move Forward!';

  @override
  void initState() {
    super.initState();
    setState(() {
      _page = widget.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(237, 240, 242, 1.0),
      body: getPage(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        child: SvgPicture.asset(
          'assets/images/floatlogo.svg',
          width: 20,
          color: AppTheme().white,
        ),
        onPressed: () {
          this.setState(() {
            _page = 4;
          });
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: AppTheme().white,
        shape: CircularNotchedRectangle(),
        notchMargin: 0.0,
        child: Container(
          height: 70,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              InkWell(
                onTap: () {
                  this.setState(() {
                    _page = 0;
                  });
                },
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 1, bottom: 3),
                      child: SvgPicture.asset(
                        'assets/images/home.svg',
                        width: 25,
                        color: _page == 0 ? AppTheme().purple : AppTheme().grey,
                      ),
                    ),
                    Text(
                      'Home',
                      style: TextStyle(
                          color:
                              _page == 0 ? AppTheme().purple : AppTheme().grey,
                          fontSize: 12),
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  this.setState(() {
                    _page = 1;
                  });
                },
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 3),
                      child: SvgPicture.asset(
                        widget.data != null
                            ? 'assets/images/message.svg'
                            : 'assets/images/category.svg',
                        width: 25,
                        color: _page == 1 ? AppTheme().purple : AppTheme().grey,
                      ),
                    ),
                    Text(
                      widget.data != null ? 'Chat' : 'Category',
                      style: TextStyle(
                        color: _page == 1 ? AppTheme().purple : AppTheme().grey,
                        fontSize: 12,
                      ),
                    )
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      'ARVR',
                      style: TextStyle(
                        color: AppTheme().purple,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  this.setState(() {
                    _page = 2;
                  });
                },
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 3),
                      child: SvgPicture.asset(
                        'assets/images/search.svg',
                        width: 25,
                        color: _page == 2 ? AppTheme().purple : AppTheme().grey,
                      ),
                    ),
                    Text(
                      'Discover',
                      style: TextStyle(
                          color:
                              _page == 2 ? AppTheme().purple : AppTheme().grey,
                          fontSize: 12),
                    )
                  ],
                ),
              ),
              Column(
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      this.setState(() {
                        _page = 3;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: SvgPicture.asset(
                        'assets/images/mat.svg',
                        width: 40,
                        color: _page == 3 ? AppTheme().purple : AppTheme().grey,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
