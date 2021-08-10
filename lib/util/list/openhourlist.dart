import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OpenHourList extends StatefulWidget {
  final dynamic data;
  const OpenHourList({Key key, this.data}) : super(key: key);

  @override
  _OpenHourListState createState() => _OpenHourListState();
}

class _OpenHourListState extends State<OpenHourList> {
  gettimeDate(date) {
    if (date == null || date == '') {
      return '--';
    } else {
      var data = '2020-12-03 ' + date + ':00.000000';
      var dateParse = DateTime.parse(data.toString());

      print(dateParse);
      String formattedTime = DateFormat('h:mm a').format(dateParse);
      print(formattedTime.toString());
      // var formattedDate =
      //     DateFormat('h:mm a').format(_date);;

      return formattedTime.toString();
    }
  }

  @override
  void initState() {
    print(widget.data);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget.data.length == 0
          ? Text('close')
          : ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: widget.data.length,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          alignment: Alignment.centerLeft,
                          width: MediaQuery.of(context).size.width * 0.2,
                          child: Text(
                            widget.data[index]['day'],
                            style: TextStyle(fontSize: 12),
                          )),
                      Container(
                        alignment: Alignment.centerLeft,
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: Text(
                          widget.data[index]['opentime'] == '' ||
                                  widget.data[index]['opentime'] == null
                              ? " Closed"
                              : (gettimeDate(widget.data[index]['opentime']) +
                                  ' - ' +
                                  gettimeDate(widget.data[index]['closetime'])),
                          style: TextStyle(fontSize: 12),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
    );
  }
}
