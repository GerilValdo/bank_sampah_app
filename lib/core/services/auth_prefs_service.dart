import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bank_sampah_app/feature/authentication/models/user_model.dart';

class AuthPrefsService {
  static const _userKey = 'user_data';
  static const _roleKey = 'user_role';
  static const _loggedInKey = 'is_logged_in';

  /// 🔹 Simpan user (bisa user atau admin)
  static Future<void> saveUser(UserModel user, {required String role}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userKey, jsonEncode(user.toJson()));
    await prefs.setString(_roleKey, role);
    await prefs.setBool(_loggedInKey, true);
  }

  /// 🔹 Ambil data user yang tersimpan
  static Future<UserModel?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_userKey);
    if (jsonString == null) return null;
    return UserModel.fromJson(jsonDecode(jsonString));
  }

  /// 🔹 Ambil role user (misalnya 'admin' atau 'user')
  static Future<String?> getRole() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_roleKey);
  }

  /// 🔹 Set status login (true / false)
  static Future<void> setLoggedIn(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_loggedInKey, value);
  }

  /// 🔹 Cek apakah user sudah login
  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_loggedInKey) ?? false;
  }

  /// 🔹 Logout user
  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userKey);
    await prefs.remove(_roleKey);
    await prefs.setBool(_loggedInKey, false);
  }

  /// 🔹 Hapus semua data auth
  static Future<void> clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
