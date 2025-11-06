part of 'deposit_bloc.dart';

@freezed
abstract class DepositEvent with _$DepositEvent {
  const factory DepositEvent.loadDeposits() = _LoadDeposits;
  const factory DepositEvent.addDeposit(DepositModel deposit) = _AddDeposit;
  const factory DepositEvent.deleteDeposit(int id) = _DeleteDeposit;
}