import 'package:dio/dio.dart';

import '../environment.dart';

class InboxService {
  var dio = new Dio();
  Future<dynamic> checkinbox(data) async {
    try {
      var resp =
          await this.dio.post(Config.url + "inbox/checkInbox", data: data);
      return resp.data;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<dynamic> getshopinbox(data) async {
    try {
      var resp =
          await this.dio.get(Config.url + "inbox/shop/" + data.toString());
      return resp.data;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<dynamic> getuserinbox(data) async {
    print(data.toString());
    try {
      var resp =
          await this.dio.get(Config.url + "inbox/user/" + data.toString());
      return resp.data;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
