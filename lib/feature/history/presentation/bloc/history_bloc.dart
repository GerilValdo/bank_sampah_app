import 'package:bank_sampah_app/feature/deposit/database/deposit_local_data_source.dart';
import 'package:bank_sampah_app/feature/deposit/models/deposit_model.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'history_event.dart';
part 'history_state.dart';
part 'history_bloc.freezed.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final DepositLocalDataSource _localDatasource;
  HistoryBloc(this._localDatasource) : super(HistoryState()) {
    on<_LoadTransactions>(_onLoadTransactions);
    on<_FilterChanged>(_onFilterChanged);
  }

  Future<void> _onLoadTransactions(
    _LoadTransactions event,
    Emitter<HistoryState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    try {
      final transactions = await _localDatasource.getAllDeposits();
      final completed = transactions
          .where((element) => element.status == 'completed')
          .length;
      final pending = transactions
          .where((element) => element.status == 'pending')
          .length;
      final rejected = transactions
          .where((element) => element.status == 'rejected')
          .length;
      emit(
        state.copyWith(
          completedCount: completed,
          pendingCount: pending,
          rejectedCount: rejected,
          transactions: transactions,
          filteredTransactions: transactions,
          isLoading: false,
        ),
      );
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  void _onFilterChanged(_FilterChanged event, Emitter<HistoryState> emit) {
    final category = event.category;
    if (category == 'All') {
      emit(
        state.copyWith(
          selectedCategory: category,
          filteredTransactions: state.transactions,
        ),
      );
    } else {
      final filtered = state.transactions
          .where((t) => t.status.toLowerCase() == category.toLowerCase())
          .toList();
      emit(
        state.copyWith(
          selectedCategory: category,
          filteredTransactions: filtered,
        ),
      );
    }
  }
}
