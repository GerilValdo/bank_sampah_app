part of 'history_bloc.dart';

@freezed
abstract class HistoryState with _$HistoryState {
  const factory HistoryState({
    @Default([]) List<DepositModel> transactions,
    @Default([]) List<DepositModel> filteredTransactions,
    @Default('All') String selectedCategory,
    @Default(false) bool isLoading,
    @Default(0) int completedCount,
    @Default(0) int pendingCount,
    @Default(0) int rejectedCount,
    String? errorMessage,
  }) = _HistoryState;
}
