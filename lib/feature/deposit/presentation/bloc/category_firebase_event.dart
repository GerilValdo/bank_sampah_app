part of 'category_firebase_bloc.dart';

@freezed
abstract class CategoryFirebaseEvent with _$CategoryFirebaseEvent {
  const factory CategoryFirebaseEvent.loadCategories() = _LoadCategories;
}
