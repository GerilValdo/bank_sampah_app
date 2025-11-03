import 'package:freezed_annotation/freezed_annotation.dart';

part 'redeem_model.freezed.dart';
part 'redeem_model.g.dart';

@freezed
abstract class RedeemModel with _$RedeemModel {
  const factory RedeemModel({
    required String id,
    required String rewardId,
    required String userId,
    required DateTime redeemedAt,
  }) = _RedeemModel;

  factory RedeemModel.fromJson(Map<String, dynamic> json) =>
      _$RedeemModelFromJson(json);
}
