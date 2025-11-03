import 'package:freezed_annotation/freezed_annotation.dart';

part 'deposit_model.freezed.dart';
part 'deposit_model.g.dart';

@freezed
abstract class DepositModel with _$DepositModel {
  factory DepositModel({
    int? id,
    required int categoryId,
    required double weight,
    required int totalPoints,
    required String status,
    String? imageUrl,
    String? notes,
    required DateTime createdAt,
    String? nameCategory,
    int? pointsPerKgCategory,
    String? iconNameCategory,
  }) = _DepositModel;

  factory DepositModel.fromJson(Map<String, dynamic> json) =>
      _$DepositModelFromJson(json);
}
