import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static const _dbName = 'sampahku.db';
  static const _dbVersion = 1;
  static const _tableNameCategories = 'categories';
  static const _tableUsers = 'users';
  static const _tableNameDeposit = 'deposits';

  static Database? _database;

  static Future<Database> getDatabase() async {
    if (_database != null) return _database!;
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, _dbName);

    _database = await openDatabase(
      path,
      version: _dbVersion,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE $_tableNameCategories(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            pointsPerKg INTEGER NOT NULL,
            iconName TEXT NOT NULL
          )
        ''');

        await db.execute('''
          INSERT INTO $_tableNameCategories (id, name, pointsPerKg, iconName) VALUES
          (1, 'Plastic Bottles & Containers', 50, 'bottleWater'),
          (2, 'Paper & Cardboard', 40, 'scroll'),
          (3, 'Metal Cans & Alumunium', 75, 'canFood'),
          (4, 'Glass Bottles', 560, 'wineBottle'),
          (5, 'Electronics', 100, 'computer'),
          (6, 'Organic Waste', 30, 'leaf');
        ''');

        await db.execute('''
          CREATE TABLE $_tableNameDeposit(
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
            iconNameCategory TEXT,
            reason TEXT
          )
        ''');

        await db.execute('''
          CREATE TABLE $_tableUsers(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            email TEXT,
            phoneNumber INTEGER,
            password TEXT,
            totalPoints INTEGER DEFAULT 0,
            profileImage TEXT,
            createdAt TEXT,
            role TEXT DEFAULT 'user'
          )
        ''');

        await db.execute('''
          INSERT INTO $_tableUsers (id, name, email, phoneNumber, password, role) VALUES
          (1, 'Valdo', 'tes123@gmail.com', 081245124545, '123123123', 'admin');
        ''');
      },
    );

    return _database!;
  }
}
