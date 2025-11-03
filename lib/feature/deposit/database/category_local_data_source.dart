import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/category_model.dart';

class CategoryLocalDataSource {
  static const _dbName = 'category.db';
  static const _tableName = 'categories';
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
            name TEXT NOT NULL,
            pointsPerKg INTEGER NOT NULL,
            iconName TEXT NOT NULL
          )
        ''');
        await db.execute('''
          INSERT INTO $_tableName (id, name, pointsPerKg, iconName) VALUES
          (1, 'Plastic Bottles & Containers', 50, 'bottleWater'),
          (2, 'Paper & Cardboard', 40, 'scroll'),
          (3, 'Metal Cans & Alumunium', 75, 'canFood'),
          (4, 'Glass Bottles', 560, 'wineBottle'),
          (5, 'Electronics', 100, 'computer'),
          (6, 'Organic Waste', 30, 'leaf');
        ''');
      },
    );
  }

  Future<void> insertCategory(CategoryModel model) async {
    final db = await database;
    await db.insert(
      _tableName,
      model.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<CategoryModel>> getAllCategories() async {
    final db = await database;
    final result = await db.query(_tableName);
    print(result);
    return result.map((e) => CategoryModel.fromJson(e)).toList();
  }

  Future<CategoryModel?> getCategoryById(int id) async {
    final db = await database;
    final result = await db.query(_tableName, where: 'id = ?', whereArgs: [id]);
    if (result.isNotEmpty) {
      return CategoryModel.fromJson(result.first);
    }
    return null;
  }

  Future<void> deleteCategory(int id) async {
    final db = await database;
    await db.delete(_tableName, where: 'id = ?', whereArgs: [id]);
  }

  Future<void> updateCategory(CategoryModel model) async {
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
