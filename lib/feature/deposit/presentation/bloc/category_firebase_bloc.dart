import 'package:bank_sampah_app/feature/deposit/models/category_firebase_model.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_firebase_event.dart';
part 'category_firebase_state.dart';
part 'category_firebase_bloc.freezed.dart';

class CategoryFirebaseBloc
    extends Bloc<CategoryFirebaseEvent, CategoryFirebaseState> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  CategoryFirebaseBloc() : super(const CategoryFirebaseState.initial()) {
    on<_LoadCategories>(_loadCategories);
  }

  /// LOAD CATEGORIES FROM FIRESTORE
  Future<void> _loadCategories(
    _LoadCategories event,
    Emitter<CategoryFirebaseState> emit,
  ) async {
    emit(const CategoryFirebaseState.loading());

    try {
      final snapshot = await _firestore.collection('categories').get();

      final categories = snapshot.docs
          .map((doc) => CategoryFirebaseModel.fromFirestore(doc))
          .toList();

      emit(CategoryFirebaseState.loaded(categories));
    } catch (e) {
      emit(CategoryFirebaseState.error("Failed to load categories: $e"));
    }
  }
}
