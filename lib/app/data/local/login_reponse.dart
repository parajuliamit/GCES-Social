import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/login/login_response.dart';

class LoginResponseCache {
  final String key = "loginResponseLocal";
  final SharedPreferences prefs;

  LoginResponseCache(this.prefs);

  void _setTimeStamp() {
    prefs.setInt(key + "TimeStamp", DateTime.now().microsecondsSinceEpoch);
  }

  DateTime lastUpdatedOn() {
    int? microsecondsSinceEpoch = prefs.getInt(key + "TimeStamp");
    return DateTime.fromMicrosecondsSinceEpoch(microsecondsSinceEpoch!);
  }

  Future<LoginResponse?> get() async {
    var valueString = prefs.getString(key);
    try {
      Map<String, dynamic> mapToken = json.decode(valueString!);
      return LoginResponse.fromJson(mapToken);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<LoginResponse?> set(LoginResponse loginResponse) async {
    var valueMap = loginResponse.toJson();
    var valueString = json.encode(valueMap);
    try {
      prefs.setString(key, valueString);
      _setTimeStamp();
      return loginResponse;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<bool> delete() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString(key, "");
      _setTimeStamp();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> isEmpty() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var valueString = prefs.getString(key);
    if (valueString == "")
      return true;
    else
      return false;
  }
}
