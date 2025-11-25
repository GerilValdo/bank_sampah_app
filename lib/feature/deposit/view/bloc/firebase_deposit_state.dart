part of 'firebase_deposit_bloc.dart';

@freezed
abstract class FirebaseDepositState with _$FirebaseDepositState {
  const factory FirebaseDepositState({
    @Default([]) List<DepositModel> deposits,
    @Default(false) bool isLoading,
    String? errorMessage,
  }) = _FirebaseDepositState;
}