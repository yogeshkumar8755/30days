import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FetchApi {
  final dio = Dio(BaseOptions(baseUrl: ""));
}

Future<Future<bool>?> fetchLoginApi() async {
  var res = await Dio().get(
      "https://dimensioning-topsid.000webhostapp.com/api_clothes_store/Admin/Admin_login.php",
      queryParameters: {
        "user_email": "nimish@gmail.com",
        "user_password": 123456
      });

  if (res.statusCode == 200) {
    // var sharedPre = await SharedPreferences.getInstance();
    // var storePref = sharedPre.setBool("key", res.data["success"]);
    // return storePref;
    // // sharedPre.setString("key", res.data);
  }
}

class UserModel {
  String user_email;
  String user_password;

  UserModel(this.user_email, this.user_password);
}

final getUserProvider = Provider<FetchApi>((ref) {
  return FetchApi();
});
