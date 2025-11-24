import 'package:bank_sampah_app/feature/database/database_helper.dart';
import '../models/withdraw_request_model.dart';

class WithdrawLocalDataSource {
  static const table = 'withdraw_requests';

  Future<int> createWithdraw(WithdrawRequestModel model) async {
    final db = await DatabaseHelper.getDatabase();
    return await db.insert(table, model.toJson());
  }

  Future<List<WithdrawRequestModel>> getUserWithdraws(int userId) async {
    final db = await DatabaseHelper.getDatabase();
    final result = await db.query(table, where: 'userId = ?', whereArgs: [userId]);

    return result.map((e) => WithdrawRequestModel.fromJson(e)).toList();
  }

  Future<int> updateWithdrawStatus({
    required int id,
    required String status,
    String? notes,
  }) async {
    final db = await DatabaseHelper.getDatabase();
    return await db.update(
      table,
      {
        'status': status,
        'notes': notes,
        'updatedAt': DateTime.now().toIso8601String(),
      },
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
