part of 'category_firebase_bloc.dart';

@freezed
abstract class CategoryFirebaseState with _$CategoryFirebaseState {
  const factory CategoryFirebaseState.initial() = _Initial;
  const factory CategoryFirebaseState.loading() = _Loading;
  const factory CategoryFirebaseState.loaded(
    List<CategoryFirebaseModel> categories,
  ) = _Loaded;
  const factory CategoryFirebaseState.error(String message) = _Error;
}
