part of 'withdraw_bloc.dart';

@freezed
abstract class WithdrawState with _$WithdrawState {
  const factory WithdrawState({
    @Default(false) bool isLoading,
    @Default([]) List<WithdrawRequestModel> requests,
    String? successMessage,
    String? errorMessage,
  }) = _WithdrawState;
}
