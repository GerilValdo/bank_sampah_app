import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/deposit_model.dart';

class DepositLocalDataSource {
  static const _dbName = 'deposit.db';
  static const _tableName = 'deposits';
  static const _dbVersion = 1;

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, _dbName);

    return await openDatabase(
      path,
      version: _dbVersion,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE $_tableName(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            categoryId INTEGER NOT NULL,
            weight REAL NOT NULL,
            totalPoints INTEGER NOT NULL,
            status TEXT NOT NULL,
            imageUrl TEXT,
            notes TEXT,
            createdAt TEXT NOT NULL,
            nameCategory TEXT,
            pointsPerKgCategory INTEGER,
            iconNameCategory TEXT

          )
        ''');
      },
    );
  }

  Future<int> insertDeposit(DepositModel model) async {
    final db = await database;
    return await db.insert(
      _tableName,
      model.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<DepositModel>> getAllDeposits() async {
    final db = await database;
    // final result = await db.query(_tableName, orderBy: 'id DESC');
    final result2 = await db.rawQuery('''
    SELECT $_tableName.*, categories.*
    FROM $_tableName
    LEFT JOIN categories ON $_tableName.categoryId = categories.id
''');
    return result2.map((json) => DepositModel.fromJson(json)).toList();
  }

  Future<DepositModel?> getDepositById(int id) async {
    final db = await database;
    final result = await db.query(_tableName, where: 'id = ?', whereArgs: [id]);
    if (result.isEmpty) return null;
    return DepositModel.fromJson(result.first);
  }

  Future<void> deleteDeposit(int id) async {
    final db = await database;
    await db.delete(_tableName, where: 'id = ?', whereArgs: [id]);
  }

  Future<void> updateDeposit(DepositModel model) async {
    final db = await database;
    await db.update(
      _tableName,
      model.toJson(),
      where: 'id = ?',
      whereArgs: [model.id],
    );
  }

  Future<void> clearAll() async {
    final db = await database;
    await db.delete(_tableName);
  }
}
