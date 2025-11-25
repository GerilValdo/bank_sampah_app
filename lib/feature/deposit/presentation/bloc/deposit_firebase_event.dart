part of 'deposit_firebase_bloc.dart';

@freezed
abstract class DepositFirebaseEvent with _$DepositFirebaseEvent {
  const factory DepositFirebaseEvent.loadDeposits(String userId) = _LoadDeposits;

  const factory DepositFirebaseEvent.addDeposit(DepositFirebaseModel deposit) =
      _AddDeposit;

  const factory DepositFirebaseEvent.updateDeposit(DepositFirebaseModel deposit) =
      _UpdateDeposit;

  const factory DepositFirebaseEvent.deleteDeposit(String id) = _DeleteDeposit;
}
