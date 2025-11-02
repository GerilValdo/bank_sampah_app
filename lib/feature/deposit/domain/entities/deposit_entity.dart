import 'package:freezed_annotation/freezed_annotation.dart';

part 'deposit_entity.freezed.dart';

@freezed
abstract class DepositEntity with _$DepositEntity {
  const factory DepositEntity({
    required String id,
    required String categoryId,
    required double weight,
    required int totalPoints,
    required String status,
    String? imageUrl,
    String? notes,
    required DateTime createdAt,
  }) = _DepositEntity;
}
