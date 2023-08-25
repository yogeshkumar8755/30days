import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vapp/core/utils.dart';
import 'package:vapp/model/getUserData_model.dart';
import 'package:vapp/model/postdata.dart';

// class FetchApi {
//   final dio = Dio(BaseOptions(baseUrl: ""));
// }

// Future<Future<bool>?> fetchLoginApi() async {
//   var res = await Dio().get(
//       "https://dimensioning-topsid.000webhostapp.com/api_clothes_store/Admin/Admin_login.php",
//       queryParameters: {
//         "user_email": "nimish@gmail.com",
//         "user_password": 123456
//       });

//   if (res.statusCode == 200) {
//     // var sharedPre = await SharedPreferences.getInstance();
//     // var storePref = sharedPre.setBool("key", res.data["success"]);
//     // return storePref;
//     // // sharedPre.setString("key", res.data);
//   }
// }

// class UserModel {
//   String user_email;
//   String user_password;

//   UserModel(this.user_email, this.user_password);
// }

// final getUserProvider = Provider<FetchApi>((ref) {
//   return FetchApi();
// });
class FetchAllApi {
  Future<List<GetUserData>> getUserData() async {
    List<GetUserData> userData = [];

    var res = await Dio().get("https://jsonplaceholder.typicode.com/posts");
    if (res.statusCode == 200) {
      for (var i in res.data) {
        userData.add(GetUserData.from(i));
        // return userData;
      }
      return userData;
    }
    return userData;
  }

  Future<PostDAta?> postData(
      name, rating, tags, price, size, color, description, image) async {
    PostDAta userDetails = PostDAta(
        name: name,
        rating: rating,
        tags: tags,
        price: price,
        size: size,
        color: color,
        description: description,
        image: image);

    var res = await Dio().post(
        "https://dimensioning-topsid.000webhostapp.com/api_clothes_store/Admin/Item_add_api.php",
        queryParameters: userDetails.toJson());

        if (res.statusCode ==200) {
          Utiss().flutterMsg("done");
          
        }
  }
}

final ApiProvider = Provider<FetchAllApi>((ref) {
  return FetchAllApi();
});
