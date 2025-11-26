part of 'withdraw_firebase_bloc.dart';

@freezed
abstract class WithdrawFirebaseState with _$WithdrawFirebaseState {
  const factory WithdrawFirebaseState({
    @Default(false) bool isLoading,
    @Default([]) List<WithdrawRequestFirebaseModel> withdraws,
    String? successMessage,
    String? errorMessage,
  }) = _WithdrawFirebaseState;
}
