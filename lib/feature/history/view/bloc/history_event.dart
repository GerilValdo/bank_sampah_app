part of 'history_bloc.dart';

@freezed
abstract class HistoryEvent with _$HistoryEvent {
  const factory HistoryEvent.loadTransactions() = _LoadTransactions;
  const factory HistoryEvent.filterChanged(String category) = _FilterChanged;
}
