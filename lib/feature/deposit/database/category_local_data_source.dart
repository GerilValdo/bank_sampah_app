import 'package:bank_sampah_app/feature/database/database_helper.dart';
import 'package:sqflite/sqflite.dart';
import '../models/category_model.dart';

class CategoryLocalDataSource {
  static const _tableName = 'categories';

  // ✅ CREATE
  Future<int> insertCategory(CategoryModel model) async {
    final db = await DatabaseHelper.getDatabase();
    return await db.insert(
      _tableName,
      model.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // ✅ READ ALL
  Future<List<CategoryModel>> getAllCategories() async {
    final db = await DatabaseHelper.getDatabase();
    final result = await db.query(_tableName, orderBy: 'id ASC');
    return result.map((e) => CategoryModel.fromJson(e)).toList();
  }

  // ✅ READ BY ID
  Future<CategoryModel?> getCategoryById(int id) async {
    final db = await DatabaseHelper.getDatabase();
    final result = await db.query(_tableName, where: 'id = ?', whereArgs: [id]);
    if (result.isEmpty) return null;
    return CategoryModel.fromJson(result.first);
  }

  // ✅ UPDATE
  Future<int> updateCategory(CategoryModel model) async {
    final db = await DatabaseHelper.getDatabase();
    return await db.update(
      _tableName,
      model.toJson(),
      where: 'id = ?',
      whereArgs: [model.id],
    );
  }

  // ✅ DELETE
  Future<int> deleteCategory(int id) async {
    final db = await DatabaseHelper.getDatabase();
    return await db.delete(_tableName, where: 'id = ?', whereArgs: [id]);
  }

  // ✅ CLEAR ALL
  Future<void> clearAllCategories() async {
    final db = await DatabaseHelper.getDatabase();
    await db.delete(_tableName);
  }
}
