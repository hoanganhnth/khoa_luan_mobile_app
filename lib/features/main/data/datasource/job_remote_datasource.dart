import 'dart:collection';

import 'package:app_flutter/share/utils/constants/end_point.dart';
import 'package:app_flutter/share/utils/dummy/dummy_data.dart';
import 'package:app_flutter/share/utils/helpers/api/dio_api.dart';

class JobRemoteDatasource {
  JobRemoteDatasource();
  Future<dynamic> getJob(int page, int size) async {
    Map<String, dynamic> param = HashMap();

    param.putIfAbsent("page", () => page);
    param.putIfAbsent("size", () => size);

    // final response = await DioApi.post(EndPoints.login, data: param);
    await Future.delayed(const Duration(seconds: 2));
    return DummyData.listJobSuggest;
    // return response;
  }

  Future<dynamic> getDetailJob(int idJob) async {
    Map<String, dynamic> param = HashMap();

    param.putIfAbsent("jop_id", () => idJob);

    final response = await DioApi.post(EndPoints.detailJob, data: param);
    await Future.delayed(const Duration(seconds: 2));
    return response;
    // return response;
  }

  Future<dynamic> getCompany(int idCompany) async {
    Map<String, dynamic> param = HashMap();

    param.putIfAbsent("company_id", () => idCompany);

    // final response = await DioApi.post(EndPoints.getCompany, data: param);
    await Future.delayed(const Duration(seconds: 2));
    return null;
    // return response;
    // return response;
  }
}
