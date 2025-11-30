import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_firebase_model.freezed.dart';
part 'category_firebase_model.g.dart';

@freezed
abstract class CategoryFirebaseModel with _$CategoryFirebaseModel {
  factory CategoryFirebaseModel({
    String? id, 
    required int idCategory,
    required String name,
    required String iconName,
    required int pointsPerKg,
  }) = _CategoryFirebaseModel;

  factory CategoryFirebaseModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryFirebaseModelFromJson(json);

  factory CategoryFirebaseModel.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data() ?? <String, dynamic>{};
    return CategoryFirebaseModel.fromJson({...data, 'id': doc.id});
  }
}
