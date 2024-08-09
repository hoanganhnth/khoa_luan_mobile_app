import 'package:app_flutter/share/utils/constants/string_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenLocalDatasourse {
  final SharedPreferences _preferences;
  AuthenLocalDatasourse(this._preferences);

  Future<void> setAccessToken(String accessToken) async {
    await _preferences.setString(StringConstants.accessToken, accessToken);
  }
}
