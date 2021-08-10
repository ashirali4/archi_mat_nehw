import 'package:dio/dio.dart';

import '../environment.dart';

class ProductService {
  var dio = new Dio();
  Future<dynamic> getproduct() async {
    try {
      var resp = await this.dio.get(
            Config.url + "product/all",
          );
      return resp.data;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<dynamic> getslider() async {
    try {
      var resp = await this.dio.get(
            Config.url + "product/getsliders",
          );
      return resp.data;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
