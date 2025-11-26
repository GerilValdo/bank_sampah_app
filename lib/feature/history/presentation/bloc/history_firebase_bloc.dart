import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../deposit/models/deposit_firebase_model.dart';

part 'history_firebase_event.dart';
part 'history_firebase_state.dart';
part 'history_firebase_bloc.freezed.dart';

class HistoryFirebaseBloc
    extends Bloc<HistoryFirebaseEvent, HistoryFirebaseState> {
  final FirebaseFirestore firestore;

  HistoryFirebaseBloc(this.firestore)
      : super(const HistoryFirebaseState()) {
    on<_LoadTransactions>(_onLoadTransactions);
    on<_FilterChanged>(_onFilterChanged);
  }

  // ===========================================================================
  // ✅ Load Transactions by userId
  // ===========================================================================
  Future<void> _onLoadTransactions(
    _LoadTransactions event,
    Emitter<HistoryFirebaseState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    try {
      final query = await firestore
          .collection('deposits')
          .where('userId', isEqualTo: event.userId)
          .orderBy('createdAt', descending: true)
          .get();

      final transactions = query.docs
          .map((e) => DepositFirebaseModel.fromFirestore(e))
          .toList();

      emit(
        state.copyWith(
          isLoading: false,
          allTransactions: transactions,
          filteredTransactions: transactions,
          selectedCategory: "All",
          completedCount:
              transactions.where((e) => e.status == "completed").length,
          pendingCount:
              transactions.where((e) => e.status == "pending").length,
          rejectedCount:
              transactions.where((e) => e.status == "rejected").length,
        ),
      );
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: 'Failed loading transactions: $e',
      ));
    }
  }

  // ===========================================================================
  // ✅ Filter Changed
  // ===========================================================================
  Future<void> _onFilterChanged(
    _FilterChanged event,
    Emitter<HistoryFirebaseState> emit,
  ) async {
    final category = event.category;
    List<DepositFirebaseModel> filtered;

    if (category == "All") {
      filtered = state.allTransactions;
    } else {
      filtered = state.allTransactions
          .where((e) => e.status.toLowerCase() == category.toLowerCase())
          .toList();
    }

    emit(
      state.copyWith(
        selectedCategory: category,
        filteredTransactions: filtered,
      ),
    );
  }
}
