part of 'category_bloc.dart';

@freezed
abstract class CategoryEvent with _$CategoryEvent {
  const factory CategoryEvent.loadCategories() = _LoadCategories;
  const factory CategoryEvent.addCategory(CategoryModel category) =
      _AddCategory;
  const factory CategoryEvent.deleteCategory(int id) = _DeleteCategory;
  const factory CategoryEvent.updateCategory(CategoryModel category) =
      _UpdateCategory;
}
