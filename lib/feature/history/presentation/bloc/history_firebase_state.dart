part of 'history_firebase_bloc.dart';

@freezed
abstract class HistoryFirebaseState with _$HistoryFirebaseState {
  const factory HistoryFirebaseState({
    @Default([]) List<DepositFirebaseModel> allTransactions,
    @Default([]) List<DepositFirebaseModel> filteredTransactions,
    @Default('All') String selectedCategory,
    @Default(0) int completedCount,
    @Default(0) int pendingCount,
    @Default(0) int rejectedCount,
    @Default(false) bool isLoading,
    String? errorMessage,
  }) = _HistoryFirebaseState;
}
