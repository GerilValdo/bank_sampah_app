import 'package:bank_sampah_app/feature/database/database_helper.dart';
import 'package:sqflite/sqflite.dart';
import '../models/deposit_model.dart';

class DepositLocalDataSource {
  static const _tableName = 'deposits';

  // ✅ CREATE
  Future<int> insertDeposit(DepositModel model) async {
    final db = await DatabaseHelper.getDatabase();
    return await db.insert(
      _tableName,
      model.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // ✅ READ ALL (JOIN CATEGORY)
  Future<List<DepositModel>> getAllDeposits() async {
    final db = await DatabaseHelper.getDatabase();
    final result = await db.rawQuery('''
      SELECT d.*, c.name AS nameCategory, c.pointsPerKg AS pointsPerKgCategory, c.iconName AS iconNameCategory
      FROM deposits d
      LEFT JOIN categories c ON d.categoryId = c.id
      ORDER BY d.id DESC
    ''');
    print(result);
    return result.map((e) => DepositModel.fromJson(e)).toList();
  }

  // ✅ READ BY ID
  Future<DepositModel?> getDepositById(int id) async {
    final db = await DatabaseHelper.getDatabase();
    final result = await db.query(_tableName, where: 'id = ?', whereArgs: [id]);
    if (result.isEmpty) return null;
    return DepositModel.fromJson(result.first);
  }

  // ✅ UPDATE
  Future<int> updateDeposit(DepositModel model) async {
    final db = await DatabaseHelper.getDatabase();
    return await db.update(
      _tableName,
      model.toJson(),
      where: 'id = ?',
      whereArgs: [model.id],
    );
  }

  // ✅ DELETE
  Future<int> deleteDeposit(int id) async {
    final db = await DatabaseHelper.getDatabase();
    return await db.delete(_tableName, where: 'id = ?', whereArgs: [id]);
  }

  // ✅ CLEAR ALL
  Future<void> clearAllDeposits() async {
    final db = await DatabaseHelper.getDatabase();
    await db.delete(_tableName);
  }

  /// Total Deposits (jumlah row)
  Future<int> getTotalDeposits() async {
    final db = await DatabaseHelper.getDatabase();
    final result = await db.rawQuery('SELECT COUNT(*) as total FROM $_tableName');
    return Sqflite.firstIntValue(result) ?? 0;
  }
  
  /// Total Weight (sum all weights)
  Future<double> getTotalWeight() async {
    final db = await DatabaseHelper.getDatabase();
    final result = await db.rawQuery('SELECT SUM(weight) as totalWeight FROM $_tableName');

    final total = result.first['totalWeight'];
    if (total == null) return 0.0;

    return (total as double);
  }
}
