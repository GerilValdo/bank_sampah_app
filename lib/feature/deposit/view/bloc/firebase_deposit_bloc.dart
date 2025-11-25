import 'package:bank_sampah_app/feature/deposit/models/deposit_model.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'firebase_deposit_event.dart';
part 'firebase_deposit_state.dart';
part 'firebase_deposit_bloc.freezed.dart';

class FirebaseDepositBloc extends Bloc<FirebaseDepositEvent, FirebaseDepositState> {
  final FirebaseFirestore firestore;

  FirebaseDepositBloc(this.firestore) : super(const FirebaseDepositState()) {
    on<_LoadDeposits>(_onLoadDeposits);
    on<_AddDeposit>(_onAddDeposit);
    on<_DeleteDeposit>(_onDeleteDeposit);
  }

  // 🔹 LOAD ALL DEPOSITS (Firebase)
  Future<void> _onLoadDeposits(
    _LoadDeposits event,
    Emitter<FirebaseDepositState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    try {
      final query = await firestore
          .collection("deposits")
          .orderBy("createdAt", descending: true)
          .get();

      final deposits = query.docs
          .map((doc) => DepositModel.fromFirestore(doc))
          .toList();

      emit(state.copyWith(deposits: deposits, isLoading: false));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: "Failed to load deposits: $e",
      ));
    }
  }

  // 🔹 ADD DEPOSIT
  Future<void> _onAddDeposit(
    _AddDeposit event,
    Emitter<FirebaseDepositState> emit,
  ) async {
    try {
      await firestore.collection("deposits").add(event.deposit.toJson());
      add(const FirebaseDepositEvent.loadDeposits()); // reload after add
    } catch (e) {
      emit(state.copyWith(
        errorMessage: "Failed to add deposit: $e",
      ));
    }
  }

  // 🔹 DELETE DEPOSIT
  Future<void> _onDeleteDeposit(
    _DeleteDeposit event,
    Emitter<FirebaseDepositState> emit,
  ) async {
    try {
      await firestore.collection("deposits").doc(event.id).delete();
      add(const FirebaseDepositEvent.loadDeposits());
    } catch (e) {
      emit(state.copyWith(
        errorMessage: "Failed to delete deposit: $e",
      ));
    }
  }
}
