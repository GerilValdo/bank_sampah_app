part of 'withdraw_bloc.dart';

@freezed
abstract class WithdrawEvent with _$WithdrawEvent {
  const factory WithdrawEvent.createRequest({
    required int userId,
    required int pointsRequested,
    required double amount,
    required String paymentMethod,
    String? phone,
  }) = _CreateRequest;

  const factory WithdrawEvent.loadRequests(int userId) = _LoadRequests;
}
