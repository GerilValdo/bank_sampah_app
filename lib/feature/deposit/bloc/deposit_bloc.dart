import 'package:bank_sampah_app/feature/deposit/database/deposit_local_data_source.dart';
import 'package:bank_sampah_app/feature/deposit/models/deposit_model.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'deposit_event.dart';
part 'deposit_state.dart';
part 'deposit_bloc.freezed.dart';

class DepositBloc extends Bloc<DepositEvent, DepositState> {
  final DepositLocalDataSource _localDataSource;

  DepositBloc(this._localDataSource) : super(const DepositState()) {
    on<_LoadDeposits>(_onLoadDeposits);
    on<_AddDeposit>(_onAddDeposit);
    on<_DeleteDeposit>(_onDeleteDeposit);
  }

   Future<void> _onLoadDeposits(
    _LoadDeposits event,
    Emitter<DepositState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    try {
      final deposits = await _localDataSource.getAllDeposits();
      emit(state.copyWith(deposits: deposits, isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  Future<void> _onAddDeposit(
    _AddDeposit event,
    Emitter<DepositState> emit,
  ) async {
    try {
      await _localDataSource.insertDeposit(event.deposit);
      add(const DepositEvent.loadDeposits());
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
    }
  }

  Future<void> _onDeleteDeposit(
    _DeleteDeposit event,
    Emitter<DepositState> emit,
  ) async {
    try {
      await _localDataSource.deleteDeposit(event.id);
      add(const DepositEvent.loadDeposits());
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
    }
  }
}
