import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/deposit_firebase_model.dart';

part 'deposit_firebase_event.dart';
part 'deposit_firebase_state.dart';
part 'deposit_firebase_bloc.freezed.dart';

class DepositFirebaseBloc
    extends Bloc<DepositFirebaseEvent, DepositFirebaseState> {
  final FirebaseFirestore firestore;

  DepositFirebaseBloc(this.firestore) : super(const DepositFirebaseState()) {
    on<_LoadDeposits>(_onLoadDeposits);
    on<_AddDeposit>(_onAddDeposit);
    on<_UpdateDeposit>(_onUpdateDeposit);
    on<_DeleteDeposit>(_onDeleteDeposit);
  }

  /// =============================
  /// LOAD DEPOSITS
  /// =============================
  Future<void> _onLoadDeposits(
    _LoadDeposits event,
    Emitter<DepositFirebaseState> emit,
  ) async {
    emit(
      state.copyWith(isLoading: true, errorMessage: null, successMessage: null),
    );

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
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: 'Failed loading deposits: $e',
        ),
      );
    }
  }

  Future<void> _onAddDeposit(
    _AddDeposit event,
    Emitter<DepositFirebaseState> emit,
  ) async {
    emit(
      state.copyWith(isLoading: true, errorMessage: null, successMessage: null),
    );

    try {
      final docRef = await firestore
          .collection('deposits')
          .add(event.deposit.toJson());

      await docRef.update({'id': docRef.id});

      // reload data
      add(DepositFirebaseEvent.loadDeposits(event.deposit.userId!));

      emit(
        state.copyWith(
          isLoading: false,
          successMessage: "Deposit successfully submitted!",
        ),
      );
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  /// =============================
  /// UPDATE DEPOSIT
  /// =============================
  Future<void> _onUpdateDeposit(
    _UpdateDeposit event,
    Emitter<DepositFirebaseState> emit,
  ) async {
    emit(
      state.copyWith(isLoading: true, errorMessage: null, successMessage: null),
    );

    try {
      // Update deposit data
      await firestore
          .collection('deposits')
          .doc(event.deposit.id)
          .update(event.deposit.toJson());

      // ⭐ Tambahkan ke user jika deposit disetujui (approved)
      if (event.deposit.status == "completed") {
        final userRef = firestore.collection("users").doc(event.deposit.userId);

        final userSnap = await userRef.get();
        if (userSnap.exists) {
          final currentPoints = userSnap.data()?["totalPoints"] ?? 0;

          await userRef.update({
            "totalPoints": currentPoints + event.deposit.totalPoints,
          });
        }
      }

      // reload list
      add(DepositFirebaseEvent.loadDeposits(event.deposit.userId!));

      emit(
        state.copyWith(
          isLoading: false,
          successMessage: "Deposit updated successfully!",
        ),
      );
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  /// =============================
  /// DELETE DEPOSIT
  /// =============================
  Future<void> _onDeleteDeposit(
    _DeleteDeposit event,
    Emitter<DepositFirebaseState> emit,
  ) async {
    emit(
      state.copyWith(isLoading: true, errorMessage: null, successMessage: null),
    );

    try {
      await firestore.collection('deposits').doc(event.id).delete();

      // 🔥 RELOAD DEPOSIT SETELAH DELETE
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        add(DepositFirebaseEvent.loadDeposits(currentUser.uid));
      }

      emit(
        state.copyWith(
          isLoading: false,
          successMessage: "Deposit deleted successfully!",
        ),
      );
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }
}
