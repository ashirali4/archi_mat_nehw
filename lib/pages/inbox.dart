import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import '../theme.dart';

class Inbox extends StatefulWidget {
  const Inbox({Key key}) : super(key: key);

  @override
  _InboxState createState() => _InboxState();
}

class _InboxState extends State<Inbox> {
  int loader = 2;
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
  List inbox = [
    {
      'image': 'assets/images/avatar.png',
      'title': 'Kate Austen',
      'message': "Hey Cody, Yeah sounds good man",
      'createdAt': "2021-04-28 01:04:55"
    },
    {
      'image': 'assets/images/avatar1.png',
      'title': 'Scott Middough',
      'message': "Hey Cody, Yeah sounds good man",
      'createdAt': "2021-04-28 01:04:55"
    },
    {
      'image': 'assets/images/avatar2.png',
      'title': 'Thomas Hidalgo',
      'message': "Hey Cody, Yeah sounds good man",
      'createdAt': "2021-04-28 01:04:55"
    },
    {
      'image': 'assets/images/avatar4.png',
      'title': 'Angle Hernandez',
      'message': "Hey Cody, Yeah sounds good man",
      'createdAt': "2021-04-28 01:04:55"
    },
  ];
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
          'Business',
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
                style: TextStyle(
                  fontSize: 16,
                  // color: AppTheme.dark_grey,
                ),
                decoration: new InputDecoration(
                  fillColor: AppTheme().blue,
                  focusColor: AppTheme().blue,
                  errorText: null,
                  border: InputBorder.none,
                  suffixIcon: Icon(Icons.search),
                  hintText: "Search Messages",
                  hintStyle: TextStyle(color: AppTheme().l1black),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            loader != 0
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 300),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height - 170,
                      child: ListView.builder(
                          itemCount: inbox.length,
                          // itemCount: 20,
                          itemBuilder: (BuildContext context, int i) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: InkWell(
                                onTap: () {},
                                child: ListTile(
                                  leading: CircleAvatar(
                                    child:
                                        // offers[i]['product']
                                        //                 ['image'] ==
                                        //             null ||
                                        //         offers[i]['product']
                                        //                 ['image'] ==
                                        //             'null' ||
                                        //         offers[i]['product']
                                        //                 ['image'] ==
                                        //             ''
                                        //     ?
                                        CircleAvatar(
                                      backgroundImage:
                                          AssetImage(inbox[i]['image']),
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
                                  title: Text(inbox[i]['title']),
                                  subtitle:
                                      // userid !=
                                      //             offers[i]['userId']
                                      //                 .toString() &&
                                      //         userid ==
                                      //             offers[i]['posterId']
                                      //                 .toString()
                                      //     ? Text(
                                      //         offers[i]['user']['name'],
                                      //         style: TextStyle(
                                      //             color: Colors.grey),
                                      //       )
                                      //     :
                                      Text(
                                    inbox[i]['message'],
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  trailing: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        date(DateTime.parse(
                                                inbox[i]['createdAt']))
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
                      // list
                      //     ? Center(
                      //         child: SpinKitFadingCircle(
                      //           color: Colors.white,
                      //           size: 60.0,
                      //         ),
                      //       )
                      //     : Text(
                      //         'No offer available',
                      //         style: TextStyle(color: Colors.grey),
                      //       ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
