import 'package:dio/dio.dart';
import '../environment.dart';

class LoginService {
  var dio = new Dio();
  Future<dynamic> login(data) async {
    try {
      var resp =
          await this.dio.post(Config.url + "users/userlogin", data: data);
      return resp.data;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<dynamic> signup(data) async {
    try {
      var resp =
          await this.dio.post(Config.url + "users/userregister", data: data);
      return resp.data;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<dynamic> imageupload(data) async {
    try {
      var resp = await this.dio.post(Config.url + "file/image", data: data);
      return resp.data;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
