import 'package:freezed_annotation/freezed_annotation.dart';

part 'withdraw_request_model.freezed.dart';
part 'withdraw_request_model.g.dart';

@freezed
abstract class WithdrawRequestModel with _$WithdrawRequestModel {
  const factory WithdrawRequestModel({
    int? id,
    required int userId,
    required int pointsRequested,
    required double amount,
    required String status, // pending, approved, completed, rejected
    String? paymentMethod, // cash, bank, dana, ovo, gopay
    String? phone,
    String? notes,
    required DateTime createdAt,
    DateTime? updatedAt,
  }) = _WithdrawRequestModel;

  factory WithdrawRequestModel.fromJson(Map<String, dynamic> json) =>
      _$WithdrawRequestModelFromJson(json);
}
