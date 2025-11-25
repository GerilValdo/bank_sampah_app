import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/deposit_firebase_model.dart';

part 'deposit_firebase_event.dart';
part 'deposit_firebase_state.dart';
part 'deposit_firebase_bloc.freezed.dart';

class DepositFirebaseBloc
    extends Bloc<DepositFirebaseEvent, DepositFirebaseState> {
  final FirebaseFirestore firestore;

  DepositFirebaseBloc(this.firestore)
      : super(const DepositFirebaseState()) {
    on<_LoadDeposits>(_onLoadDeposits);
    on<_AddDeposit>(_onAddDeposit);
    on<_UpdateDeposit>(_onUpdateDeposit);
    on<_DeleteDeposit>(_onDeleteDeposit);
  }

  /// ✅ Load deposits by userId
  Future<void> _onLoadDeposits(
    _LoadDeposits event,
    Emitter<DepositFirebaseState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    try {
      final query = await firestore
          .collection('deposits')
          .where('userId', isEqualTo: event.userId)
          .orderBy('createdAt', descending: true)
          .get();

      final deposits = query.docs
          .map((e) => DepositFirebaseModel.fromFirestore(e))
          .toList();

      emit(state.copyWith(isLoading: false, deposits: deposits));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: 'Failed loading deposits: $e',
      ));
    }
  }

  /// ✅ Add deposit
  Future<void> _onAddDeposit(
    _AddDeposit event,
    Emitter<DepositFirebaseState> emit,
  ) async {
    try {
      await firestore.collection('deposits').add(event.deposit.toJson());
      add(DepositFirebaseEvent.loadDeposits(event.deposit.userId!));
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
    }
  }

  /// ✅ Update deposit
  Future<void> _onUpdateDeposit(
    _UpdateDeposit event,
    Emitter<DepositFirebaseState> emit,
  ) async {
    try {
      await firestore
          .collection('deposits')
          .doc(event.deposit.id)
          .update(event.deposit.toJson());

      add(DepositFirebaseEvent.loadDeposits(event.deposit.userId!));
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
    }
  }

  /// ✅ Delete deposit
  Future<void> _onDeleteDeposit(
    _DeleteDeposit event,
    Emitter<DepositFirebaseState> emit,
  ) async {
    try {
      await firestore.collection('deposits').doc(event.id).delete();
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
    }
  }
}
