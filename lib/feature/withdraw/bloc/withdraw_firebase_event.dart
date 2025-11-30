part of 'withdraw_firebase_bloc.dart';

@freezed
abstract class WithdrawFirebaseEvent with _$WithdrawFirebaseEvent {
  const factory WithdrawFirebaseEvent.createRequest({
    required String userId,
    required int pointsRequested,
    required double amount,
    required String paymentMethod,
    String? phone,
  }) = _CreateRequest;

  const factory WithdrawFirebaseEvent.loadRequests(String userId) =
      _LoadRequests;

  const factory WithdrawFirebaseEvent.updateStatus(
    String requestId,
    String newStatus,
  ) = _UpdateStatus;
}
