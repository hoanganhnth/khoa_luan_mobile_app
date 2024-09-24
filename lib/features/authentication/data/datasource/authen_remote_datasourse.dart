import 'dart:collection';
import 'package:app_flutter/share/utils/constants/end_point.dart';
import 'package:app_flutter/share/utils/helpers/api/dio_api.dart';

class AuthenRemoteDataSource {
  // final ApiHandler DioApi;
  AuthenRemoteDataSource();

  Future<dynamic> login(String email, String password) async {
    Map<String, dynamic> param = HashMap();

    param.putIfAbsent("email", () => email);
    param.putIfAbsent("password", () => password);

    // final response = await DioApi.post(EndPoints.login, data: param);
    await Future.delayed(const Duration(seconds: 2));
    return {
      "status": 1,
      "message": "Success",
      "data": {
        "accessToken":
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTksImlhdCI6MTcyNTg3NjczMCwiZXhwIjoxNzI2NzQwNzMwfQ.bns51s1zBucTWNN_Tq6cTfxIXalc6UOenBLb-jrFI0w",
        "user": {
          "id": 19,
          "user_name": "hoang a",
          "email": "hoanganh1@gmail.com",
          "role": "user",
          "address": null,
          "phone": "0357660712",
          "profile_url": null,
          "create_time": "2024-09-09T10:08:09.000Z",
          "modify_time": "2024-09-09T10:12:10.401Z"
        }
      }
    };
    // return response;
  }

  Future<dynamic> register(
      String email, String password, String phone, String userName) async {
    Map<String, dynamic> param = HashMap();
    param.putIfAbsent("email", () => email);
    param.putIfAbsent("password", () => password);
    param.putIfAbsent("phone", () => phone);
    param.putIfAbsent("user_name", () => userName);
    param.putIfAbsent("role", () => "user");
    await Future.delayed(const Duration(seconds: 2));
    return {
      "status": 1,
      "message": "Success",
    };
    // final response = await DioApi.post(EndPoints.login, data: param);

    // return response;
  }

  Future<dynamic> getProfile() async {
    final response = await DioApi.get(
      EndPoints.getProfile,
    );

    return response;
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
