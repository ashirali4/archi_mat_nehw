import 'package:dio/dio.dart';

import '../environment.dart';

class FallowService {
  var dio = new Dio();
  Future<dynamic> fallow(data) async {
    try {
      var resp = await this.dio.post(Config.url + "fallow/", data: data);
      return resp.data;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
