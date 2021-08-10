import 'package:dio/dio.dart';
import '../environment.dart';

class CategoryService {
  var dio = new Dio();
  Future<dynamic> getcategory() async {
    try {
      var resp = await this.dio.get(
            Config.url + "category/all",
          );
      return resp.data;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<dynamic> getallprodcat() async {
    try {
      var resp = await this.dio.get(
            Config.url + "category/allprodbyallcat",
          );
      return resp.data;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<dynamic> getprodbycate(data) async {
    try {
      var resp = await this.dio.get(
            Config.url + "category/allprodbycat/" + data,
          );
      return resp.data;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<dynamic> getallprobysub(data) async {
    try {
      var resp = await this.dio.get(
            Config.url + "subcategory/allprodbysubcat/" + data,
          );
      return resp.data;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
