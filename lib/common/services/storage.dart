import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:ulearning/common/model/entitites.dart';
import 'package:ulearning/common/utils/contants.dart';

class StorageServices {
  late final SharedPreferences _preferences;

  Future<StorageServices> init() async {
    _preferences = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setString(String key, String value) async {
    return await _preferences.setString(key, value);
  }

  Future<bool> setBool(String key, bool value) async {
    return await _preferences.setBool(key, value);
  }

  String getUserToken() {
    return _preferences.getString(AppConstants.STORAGE_USER_TOKEN_KEY) ?? "";
  }

  bool getDeviceFirstTimeOpen() {
    return _preferences.getBool(AppConstants.STORAGE_DEVICE_FIRST_TIME_OPEN) ??
        false;
  }

  bool isLoggedIn() {
    return _preferences.getString(AppConstants.STORAGE_USER_PROFILE_KEY) != null
        ? true
        : false;
  }

  Future logout() async {
    return await _preferences.remove(AppConstants.STORAGE_USER_PROFILE_KEY);
  }

  UserProfile getUserProfileInfo() {
    final userPeofileInfo =
        _preferences.getString(AppConstants.STORAGE_USER_PROFILE_KEY) ?? '';

    final userJson = UserProfile.fromJson(jsonDecode(userPeofileInfo));

    return userJson;
  }
}
