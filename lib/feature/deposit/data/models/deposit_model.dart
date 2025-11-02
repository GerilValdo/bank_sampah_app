import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/deposit_entity.dart';

part 'deposit_model.freezed.dart';
part 'deposit_model.g.dart';

@freezed
abstract class DepositModel with _$DepositModel {
  factory DepositModel({
    required String id,
    required String categoryId,
    required double weight,
    required int totalPoints,
    required String status,
    String? imageUrl,
    String? notes,
    required DateTime createdAt,
  }) = _DepositModel;

  factory DepositModel.fromJson(Map<String, dynamic> json) =>
      _$DepositModelFromJson(json);

  factory DepositModel.fromEntity(DepositEntity entity) => DepositModel(
        id: entity.id,
        categoryId: entity.categoryId,
        weight: entity.weight,
        totalPoints: entity.totalPoints,
        status: entity.status,
        imageUrl: entity.imageUrl,
        notes: entity.notes,
        createdAt: entity.createdAt,
      );
}

extension DepositModelMapper on DepositModel {
  DepositEntity toEntity() => DepositEntity(
        id: id,
        categoryId: categoryId,
        weight: weight,
        totalPoints: totalPoints,
        status: status,
        imageUrl: imageUrl,
        notes: notes,
        createdAt: createdAt,
      );
}
