import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bank_sampah_app/feature/authentication/data/models/user_model.dart';

class AuthPrefsService {
  static const _userKey = 'user_data';
  static const _roleKey = 'user_role';
  static const _loggedInKey = 'is_logged_in';

  static Future<void> saveUser(UserModel user, {required String role}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userKey, jsonEncode(user.toJson()));
    await prefs.setString(_roleKey, role);
    await prefs.setBool(_loggedInKey, true);
  }

  static Future<UserModel?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_userKey);
    if (jsonString == null) return null;
    return UserModel.fromJson(jsonDecode(jsonString));
  }

  static Future<String?> getRole() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_roleKey);
  }

  static Future<void> setLoggedIn(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_loggedInKey, value);
  }

  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_loggedInKey) ?? false;
  }

  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userKey);
    await prefs.remove(_roleKey);
    await prefs.setBool(_loggedInKey, false);
  }

  static Future<void> clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
