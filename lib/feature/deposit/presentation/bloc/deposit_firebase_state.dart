part of 'deposit_firebase_bloc.dart';

@freezed
abstract class DepositFirebaseState with _$DepositFirebaseState {
  const factory DepositFirebaseState({
    @Default([]) List<DepositFirebaseModel> deposits,
    @Default(false) bool isLoading,
    String? errorMessage,
    String? successMessage,
  }) = _DepositFirebaseState;
}
