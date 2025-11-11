import 'package:bank_sampah_app/feature/database/database_helper.dart';
import 'package:sqflite/sqflite.dart';

class UserLocalDatasource {
  static const _tableName = 'users';

  Future<int> insertUser(Map<String, dynamic> user) async {
  final db = await DatabaseHelper.getDatabase();
  return await db.insert(_tableName, user,
      conflictAlgorithm: ConflictAlgorithm.replace);
}

Future<Map<String, dynamic>?> getUserByEmail(String email) async {
  final db = await DatabaseHelper.getDatabase();
  final result = await db.query(_tableName, where: 'email = ?', whereArgs: [email]);
  if (result.isNotEmpty) {
    return result.first;
  }
  return null;
}

Future<List<Map<String, dynamic>>> getAllUsers() async {
  final db = await DatabaseHelper.getDatabase();
  return await db.query(_tableName);
}

  
}