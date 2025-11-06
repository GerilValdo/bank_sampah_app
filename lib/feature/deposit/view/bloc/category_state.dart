part of 'category_bloc.dart';

@freezed
abstract class CategoryState with _$CategoryState {
  const factory CategoryState({
    @Default([]) List<CategoryModel> categories,
    @Default(false) bool isLoading,
    String? errorMessage,
  }) = _CategoryState;
}