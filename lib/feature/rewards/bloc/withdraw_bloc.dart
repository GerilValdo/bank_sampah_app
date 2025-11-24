import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../database/withdraw_local_datasource.dart';
import '../models/withdraw_request_model.dart';

part 'withdraw_event.dart';
part 'withdraw_state.dart';
part 'withdraw_bloc.freezed.dart';

class WithdrawBloc extends Bloc<WithdrawEvent, WithdrawState> {
  final WithdrawLocalDataSource _datasource;

  WithdrawBloc(this._datasource) : super(const WithdrawState()) {
    on<_CreateRequest>(_onCreateRequest);
    on<_LoadRequests>(_onLoadRequests);
  }

  Future<void> _onCreateRequest(
    _CreateRequest event,
    Emitter<WithdrawState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    try {
      final model = WithdrawRequestModel(
        userId: event.userId,
        pointsRequested: event.pointsRequested,
        amount: event.amount,
        paymentMethod: event.paymentMethod,
        phone: event.phone,
        status: 'pending',
        createdAt: DateTime.now(),
      );

      await _datasource.createWithdraw(model);

      emit(state.copyWith(
        isLoading: false,
        successMessage: "Withdraw request submitted!",
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onLoadRequests(
    _LoadRequests event,
    Emitter<WithdrawState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    try {
      final data = await _datasource.getUserWithdraws(event.userId);

      emit(state.copyWith(
        isLoading: false,
        requests: data,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
      ));
    }
  }
}
