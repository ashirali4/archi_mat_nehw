import 'dart:convert';

import 'package:archi_mat/Services/inboxService.dart';
import 'package:archi_mat/pages/chat.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../environment.dart';
import '../theme.dart';

class Inbox extends StatefulWidget {
  final bool shopside;
  final dynamic data;
  const Inbox({Key key, this.data, this.shopside}) : super(key: key);

  @override
  _InboxState createState() => _InboxState();
}

class _InboxState extends State<Inbox> {
  int loader = 2;
  var search = TextEditingController();
  bool loader1 = true, cancel = false;
  List months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];
  List inbox1 = [], inbox = [];

  date(DateTime from) {
    from = DateTime(from.year, from.month, from.day);
    DateTime to = DateTime.now();
    to = DateTime(to.year, to.month, to.day);
    var dif = (to.difference(from).inHours / 24).round();
    print((to.difference(from).inHours / 24).round());

    if (dif < 0) {
      String formattedTime = DateFormat('kk:mm:a').format(from);
      return formattedTime;
    } else {
      return months[from.month - 1] + ' ' + from.day.toString();
    }
    // return (to.difference(from).inHours / 24).round();
  }

  var detail;
  @override
  void initState() {
    getdata();
    super.initState();
  }

  getdata() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      detail = jsonDecode(pref.getString('user'));
    });
    if (widget.shopside) {
      getshopinbox();
    } else {
      getuserinbox();
    }
  }

  getshopinbox() {
    setState(() {
      loader1 = true;
    });
    InboxService().getshopinbox(detail['shop']['id']).then((value) {
      print(value);
      setState(() {
        inbox1 = value['inbox'];
        inbox = value['inbox'];
        if (inbox1.length == 0) {
          loader = 0;
        }
        loader1 = false;
      });
    });
  }

  getuserinbox() {
    setState(() {
      loader1 = true;
    });
    InboxService().getuserinbox(detail['id']).then((value) {
      print(value);
      setState(() {
        inbox1 = value['inbox'];
        inbox = value['inbox'];
        if (inbox1.length == 0) {
          loader = 0;
        }
        loader1 = false;
      });
    });
  }

  searchvalueASshop() {
    FocusScope.of(context).requestFocus(new FocusNode());
    setState(() {
      cancel = !cancel;
      loader1 = true;
      inbox1 = inbox
          .where((search1) => ((search1['user']['firstname']
                  .toLowerCase()
                  .contains(search.text.toLowerCase())) ||
              (search1['user']['lastname']
                  .toLowerCase()
                  .contains(search.text.toLowerCase()))))
          .toList();
      if (inbox1.length == 0) {
        loader = 0;
      }
      loader1 = false;
    });
  }

  searchvalueASuser() {
    FocusScope.of(context).requestFocus(new FocusNode());
    setState(() {
      cancel = !cancel;
      loader1 = true;
      inbox1 = inbox
          .where((search1) => ((search1['shop']['name']
              .toLowerCase()
              .contains(search.text.toLowerCase()))))
          .toList();
      if (inbox1.length == 0) {
        loader = 0;
      }
      loader1 = false;
    });
  }

  aftersearch() {
    FocusScope.of(context).unfocus();
    setState(() {
      cancel = !cancel;
      loader1 = true;
      print('inbox======================');
      print(inbox);
      inbox1 = inbox;
      print('inbox1======================');

      print(inbox1);
      if (inbox1.length == 0) {
        loader = 0;
      } else {
        loader = inbox1.length;
      }
      loader1 = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme().white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_sharp,
            color: AppTheme().black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Inbox',
          style: TextStyle(
            color: AppTheme().black,
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(
                FontAwesomeIcons.facebookMessenger,
                color: Colors.black,
              ),
              onPressed: null)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                controller: search,
                style: TextStyle(
                  fontSize: 16,
                  // color: AppTheme.dark_grey,
                ),
                decoration: new InputDecoration(
                  // fillColor: AppTheme().blue,
                  focusColor: AppTheme().blue,
                  errorText: null,
                  // border: InputBorder.none,
                  suffixIcon: cancel
                      ? InkWell(
                          child: Icon(Icons.cancel),
                          onTap: () {
                            setState(() {
                              search.clear();
                            });
                            print(search.text);
                            aftersearch();
                            // // if (loader > 0) {
                            // if (widget.shopside) {
                            //   searchvalueASshop();
                            // } else {
                            //   searchvalueASuser();
                            // }
                            // }
                          },
                        )
                      : InkWell(
                          child: Icon(Icons.search),
                          onTap: () {
                            if (loader > 0) {
                              if (search.text.isNotEmpty) {
                                if (widget.shopside) {
                                  searchvalueASshop();
                                } else {
                                  searchvalueASuser();
                                }
                              }
                            }
                          },
                        ),
                  hintText: "Search Messages",
                  hintStyle: TextStyle(color: AppTheme().l1black),
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0))),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.black, width: 2.0),
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            // Divider_Widgets(),
            loader != 0
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 300),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height - 170,
                      child: ListView.builder(
                          itemCount: inbox1.length,
                          // itemCount: 20,
                          itemBuilder: (BuildContext context, int i) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ChatPage(
                                                user: inbox1[i]['user'],
                                                shop: inbox1[i]['shop'],
                                                shopside: false,
                                              )));
                                },
                                child: ListTile(
                                  leading: CircleAvatar(
                                    child: CircleAvatar(
                                      backgroundImage: !widget.shopside &&
                                              inbox1[i]['shop']['image'] != null
                                          ? NetworkImage(Config.url +
                                              inbox1[i]['shop']['image'])
                                          : widget.shopside &&
                                                  inbox1[i]['user']['image'] !=
                                                      null
                                              ? NetworkImage(Config.url +
                                                  inbox1[i]['user']['image'])
                                              : AssetImage(
                                                  'assets/images/avatar4.png'),
                                      radius: 56,
                                    ),
                                    //       : CachedNetworkImage(
                                    //           imageUrl: url +
                                    //               '/' +
                                    //               offers[i]['product']
                                    //                       ['image']
                                    //                   .toString(),
                                    //           imageBuilder: (context,
                                    //                   imageProvider) =>
                                    //               Container(
                                    //             width: 110.0,
                                    //             height: 110.0,
                                    //             decoration: BoxDecoration(
                                    //               shape: BoxShape.circle,
                                    //               image: DecorationImage(
                                    //                   image: imageProvider,
                                    //                   fit: BoxFit.fill),
                                    //             ),
                                    //           ),
                                    //           placeholder: (context, url) =>
                                    //               new CircularProgressIndicator(),
                                    //           errorWidget:
                                    //               (context, url, error) =>
                                    //                   new Icon(Icons.error),
                                    //         ),
                                    radius: 30,
                                  ),
                                  title: Text(!widget.shopside
                                      ? inbox1[i]['shop']['name']
                                      : inbox1[i]['user']['firstname'] +
                                          ' ' +
                                          inbox1[i]['user']['lastname']),
                                  subtitle: Text(
                                    inbox1[i]['message'].length > 200
                                        ? inbox1[i]['message']
                                                .toString()
                                                .substring(0, 200) +
                                            ' ...'
                                        : inbox1[i]['message'],
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  trailing: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        date(DateTime.parse(
                                                inbox1[i]['updatedAt']))
                                            .toString(),
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 10),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  )
                : Column(
                    children: <Widget>[
                      loader1
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                'No Message available',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
