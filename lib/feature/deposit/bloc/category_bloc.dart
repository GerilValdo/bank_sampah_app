import 'package:bank_sampah_app/feature/deposit/database/category_local_data_source.dart';
import 'package:bank_sampah_app/feature/deposit/models/category_model.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_event.dart';
part 'category_state.dart';
part 'category_bloc.freezed.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryLocalDataSource _localDataSource;

  CategoryBloc(this._localDataSource) : super(const CategoryState()) {
    on<_LoadCategories>(_onLoadCategories);
    on<_AddCategory>(_onAddCategory);
    on<_DeleteCategory>(_onDeleteCategory);
    on<_UpdateCategory>(_onUpdateCategory);
  }

   Future<void> _onLoadCategories(
      _LoadCategories event, Emitter<CategoryState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      final categories = await _localDataSource.getAllCategories();
      emit(state.copyWith(categories: categories, isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  Future<void> _onAddCategory(
      _AddCategory event, Emitter<CategoryState> emit) async {
    try {
      await _localDataSource.insertCategory(event.category);
      final updated = await _localDataSource.getAllCategories();
      emit(state.copyWith(categories: updated));
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
    }
  }

  Future<void> _onDeleteCategory(
      _DeleteCategory event, Emitter<CategoryState> emit) async {
    try {
      await _localDataSource.deleteCategory(event.id);
      final updated = await _localDataSource.getAllCategories();
      emit(state.copyWith(categories: updated));
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
    }
  }

  Future<void> _onUpdateCategory(
      _UpdateCategory event, Emitter<CategoryState> emit) async {
    try {
      await _localDataSource.updateCategory(event.category);
      final updated = await _localDataSource.getAllCategories();
      emit(state.copyWith(categories: updated));
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
    }
  }
   
}
