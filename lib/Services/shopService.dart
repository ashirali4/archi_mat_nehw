import 'package:dio/dio.dart';

import '../environment.dart';

class ShopService {
  var dio = new Dio();
  Future<dynamic> getshop(id) async {
    try {
      var resp = await this.dio.get(
            Config.url + "shop/" + id.toString(),
          );
      return resp.data;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
