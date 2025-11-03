import 'package:freezed_annotation/freezed_annotation.dart';

part 'reward_model.freezed.dart';
part 'reward_model.g.dart';

@freezed
abstract class RewardModel with _$RewardModel {
  const factory RewardModel({
    required String id,
    required String title,
    required int pointsRequired,
    required String imageUrl,
  }) = _RewardModel;

  factory RewardModel.fromJson(Map<String, dynamic> json) =>
      _$RewardModelFromJson(json);
}
