import 'package:bank_sampah_app/core/database/database_helper.dart';
import 'package:sqflite/sqflite.dart';

class UserLocalDatasource {
  static const _tableName = 'users';

  Future<int> insertUser(Map<String, dynamic> user) async {
    try {
      final db = await DatabaseHelper.getDatabase();
      return await db.insert(
        _tableName,
        user,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      print('DB Insert Error: $e');
      return 0;
    }
  }

  Future<Map<String, dynamic>?> getUserByEmail(String email) async {
    try {
      final db = await DatabaseHelper.getDatabase();
      final result = await db.query(
        _tableName,
        where: 'email = ?',
        whereArgs: [email],
        limit: 1,
      );

      return result.isNotEmpty ? result.first : null;
    } catch (e) {
      print('DB Query Error: $e');
      return null;
    }
  }

  Future<List<Map<String, dynamic>>> getAllUsers() async {
    try {
      final db = await DatabaseHelper.getDatabase();
      return await db.query(_tableName);
    } catch (e) {
      print('DB GetAll Error: $e');
      return [];
    }
  }

  Future<int> updateUser(Map<String, dynamic> user, String email) async {
    try {
      final db = await DatabaseHelper.getDatabase();
      return await db.update(
        _tableName,
        user,
        where: 'email = ?',
        whereArgs: [email],
      );
    } catch (e) {
      print('DB Update Error: $e');
      return 0;
    }
  }

  Future<int> deleteUser(String email) async {
    try {
      final db = await DatabaseHelper.getDatabase();
      return await db.delete(
        _tableName,
        where: 'email = ?',
        whereArgs: [email],
      );
    } catch (e) {
      print('DB Delete Error: $e');
      return 0;
    }
  }
}
