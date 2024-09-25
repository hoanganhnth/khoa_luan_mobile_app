import 'dart:collection';
import 'dart:io';

import 'package:app_flutter/share/utils/constants/end_point.dart';
import 'package:app_flutter/share/utils/helpers/api/dio_api.dart';
import 'package:dio/dio.dart';

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

  Future<dynamic> uploadFile(File file) async {
    Map<String, dynamic> param = HashMap();
    FormData formData = FormData.fromMap({
      'fileUpload': await MultipartFile.fromFile(
        file.path,
      ),
      // Add other parameters if needed
    });
    final response = await DioApi.post(EndPoints.login,
        data: formData,
        options: Options(
          headers: {
            'Content-Type': 'multipart/form-data',
          },
        ));

    return response;
  }

  Future<dynamic> getResume() async {
    final response = await DioApi.post(
      EndPoints.getResume,
    );

    // return response;
    return {
      "status": 1,
      "message": "Success",
      "data": [
        {
          "id": 2,
          "user_id": 19,
          "resume_name": "cv1",
          "resume_url":
              "https://res.cloudinary.com/djnfk8j8v/image/upload/v1727198229/cv/epyfv1dxmminvtzyrscv.pdf",
          "create_time": "2024-09-25T15:12:32.000Z",
          "modify_time": "2024-09-25T15:12:32.000Z"
        },
        {
          "id": 3,
          "user_id": 19,
          "resume_name": "cv2",
          "resume_url":
              "https://res.cloudinary.com/djnfk8j8v/image/upload/v1727198229/cv/epyfv1dxmminvtzyrscv.pdf",
          "create_time": "2024-09-25T15:12:32.000Z",
          "modify_time": "2024-09-25T15:12:32.000Z"
        }
      ]
    };
  }

  Future<dynamic> createResume(String resumeName, String resumeUrl) async {
    Map<String, dynamic> param = HashMap();
    param.putIfAbsent("resume_name", () => resumeName);
    param.putIfAbsent("resume_url", () => resumeUrl);

    final response = await DioApi.post(
      EndPoints.createResume,
    );

    return response;
  }

  Future<dynamic> updateResume(
      String resumeName, String resumeUrl, int resumeId) async {
    Map<String, dynamic> param = HashMap();
    param.putIfAbsent("resume_id", () => resumeId);
    param.putIfAbsent("resume_name", () => resumeName);
    param.putIfAbsent("resume_url", () => resumeUrl);

    final response = await DioApi.post(
      EndPoints.updateResume,
    );

    return response;
  }

  Future<dynamic> deleteResume(int resumeId) async {
    Map<String, dynamic> param = HashMap();
    param.putIfAbsent("resume_id", () => resumeId);

    final response = await DioApi.post(
      EndPoints.deleteResume,
    );

    return response;
  }
}
