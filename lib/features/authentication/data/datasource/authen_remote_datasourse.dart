import 'dart:collection';
import 'package:app_flutter/share/utils/constants/end_point.dart';
import 'package:app_flutter/share/utils/helpers/api/dio_api.dart';

class AuthenRemoteDataSourse {
  // final ApiHandler DioApi;
  AuthenRemoteDataSourse();

  Future<dynamic> login(String email, String password) async {
    Map<String, dynamic> param = HashMap();

    param.putIfAbsent("email", () => email);
    param.putIfAbsent("password", () => password);

    final response = await DioApi.post(EndPoints.login, data: param);

    return response;
  }

  Future<dynamic> register(
      String email, String password, String phone, String userName) async {
    Map<String, dynamic> param = HashMap();
    param.putIfAbsent("email", () => email);
    param.putIfAbsent("password", () => password);
    param.putIfAbsent("phone", () => phone);
    param.putIfAbsent("user_name", () => userName);
    param.putIfAbsent("role", () => "user");
    final response = await DioApi.post(EndPoints.login, data: param);

    return response;
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
