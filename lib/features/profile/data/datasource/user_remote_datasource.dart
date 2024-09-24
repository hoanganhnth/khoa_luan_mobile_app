import 'dart:collection';

import 'package:app_flutter/share/utils/constants/end_point.dart';
import 'package:app_flutter/share/utils/helpers/api/dio_api.dart';

class UserRemoteDataSource {
  // final ApiHandler DioApi;
  UserRemoteDataSource();

  Future<dynamic> getProfile() async {
    final response = await DioApi.get(
      EndPoints.getProfile,
    );

    // return response;
    return {
      "status": 1,
      "message": "Success",
      "data": {
        "id": 19,
        "user_name": "hoang a",
        "email": "hoanganh1@gmail.com",
        "role": "user",
        "address": null,
        "phone": "0357660712",
        "profile_url": null,
        "create_time": "2024-09-09T10:08:09.000Z",
        "modify_time": "2024-09-09T10:12:10.000Z"
      }
    };
  }

  Future<dynamic> updateProfile(String? userName, String? email,
      String? address, String? phone, String? profileUrl) async {
    Map<String, dynamic> param = HashMap();
    param.putIfAbsent("email", () => email);
    param.putIfAbsent("phone", () => phone);
    param.putIfAbsent("user_name", () => userName);
    param.putIfAbsent("address", () => address);
    param.putIfAbsent("profile_url", () => profileUrl);
    final response = await DioApi.post(
      EndPoints.login,
    );

    return response;
  }
}
