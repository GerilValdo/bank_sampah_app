part of 'history_firebase_bloc.dart';

@freezed
abstract class HistoryFirebaseEvent with _$HistoryFirebaseEvent {
  const factory HistoryFirebaseEvent.loadTransactions(String userId) =
      _LoadTransactions;

  const factory HistoryFirebaseEvent.filterChanged(String category) =
      _FilterChanged;
}
