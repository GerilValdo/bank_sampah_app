part of 'firebase_deposit_bloc.dart';

@freezed
abstract class FirebaseDepositEvent with _$FirebaseDepositEvent {
  const factory FirebaseDepositEvent.loadDeposits() = _LoadDeposits;

  const factory FirebaseDepositEvent.addDeposit(DepositModel deposit) = _AddDeposit;

  const factory FirebaseDepositEvent.deleteDeposit(String id) = _DeleteDeposit;
}
