import 'package:dio/dio.dart';

import '../environment.dart';

class ServiceRoute {
  var dio = new Dio();
  Future<dynamic> getservice() async {
    try {
      var resp = await this.dio.get(
            Config.url + "service/all",
          );
      return resp.data;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
