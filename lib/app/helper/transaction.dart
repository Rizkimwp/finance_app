import 'database_helper.dart';

class TransactionDao {
  final dbHelper = DatabaseHelper.instance;

  Future<int> createTransaction(Map<String, dynamic> transaction) async {
    final db = await dbHelper.database;
    return await db.insert('transactions', transaction);
  }

  Future<List<Map<String, dynamic>>> readTransactions() async {
    final db = await dbHelper.database;
    return await db.query('transactions', orderBy: 'date DESC');
  }

  Future<int> updateTransaction(Map<String, dynamic> transaction) async {
    final db = await dbHelper.database;
    final id = transaction['id'];
    return await db.update(
      'transactions',
      transaction,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteTransaction(int id) async {
    final db = await dbHelper.database;
    return await db.delete(
      'transactions',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
