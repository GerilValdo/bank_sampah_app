import '../entities/deposit_entity.dart';

abstract class DepositRepository {
  Future<void> insertDeposit(DepositEntity deposit);
  Future<List<DepositEntity>> getAllDeposits();
}
