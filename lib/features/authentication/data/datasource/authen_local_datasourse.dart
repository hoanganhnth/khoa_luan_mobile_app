import 'dart:async';

import 'package:app_flutter/share/utils/constants/app_constants.dart';
import 'package:app_flutter/share/utils/constants/string_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenLocalDatasourse {
  final SharedPreferences _preferences;
  AuthenLocalDatasourse(this._preferences);

  Future<void> setAccessToken(String accessToken) async {
    await _preferences.setString(StringConstants.accessToken, accessToken);
  }

  Future<void> savePassword(String email, String password) async {
    await _preferences.setStringList(AppConstants.password, [email, password]);
    await _preferences.setBool(AppConstants.keySavePass, true);
  }

  List<String> getSavePassword() {
    return _preferences.getStringList(AppConstants.password) ?? [];
  }

  Future<void> notSavePassword() async {
    await _preferences.setBool(AppConstants.keySavePass, false);
  }

  bool checkSavePassword() {
    return _preferences.getBool(AppConstants.keySavePass) ?? false;
  }
}
