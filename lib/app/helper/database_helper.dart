import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('finance.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    const intType = 'INTEGER NOT NULL';

    await db.execute('''
    CREATE TABLE transactions (
      id $idType,
      description $textType,
      amount $intType,
      date $textType,
      type $textType,
      category_id $intType,
      FOREIGN KEY (category_id) REFERENCES categories (id)
    )
  ''');

    // Tabel untuk kategori
    await db.execute('''
    CREATE TABLE categories (
      id $idType,
      name $textType,
      type $textType  -- 'income' untuk pemasukan, 'expense' untuk pengeluaran
    )
  ''');
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
