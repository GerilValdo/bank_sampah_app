part of 'deposit_bloc.dart';

@freezed
abstract class DepositState with _$DepositState {
  const factory DepositState({
    @Default([]) List<DepositModel> deposits,
    @Default(false) bool isLoading,
    String? errorMessage,
  }) = _DepositState;
}
