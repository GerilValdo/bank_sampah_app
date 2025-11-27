import 'package:bank_sampah_app/feature/withdraw/models/withdraw_request_firebase_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'withdraw_firebase_event.dart';
part 'withdraw_firebase_state.dart';
part 'withdraw_firebase_bloc.freezed.dart';

class WithdrawFirebaseBloc
    extends Bloc<WithdrawFirebaseEvent, WithdrawFirebaseState> {
  final FirebaseFirestore firestore;

  WithdrawFirebaseBloc(this.firestore) : super(const WithdrawFirebaseState()) {
    on<_CreateRequest>(_onCreateRequest);
    on<_LoadRequests>(_onLoadRequests);
  }

  // ===========================================================================
  // CREATE WITHDRAW REQUEST
  // ===========================================================================
  Future<void> _onCreateRequest(
    _CreateRequest event,
    Emitter<WithdrawFirebaseState> emit,
  ) async {
    emit(
      state.copyWith(isLoading: true, successMessage: null, errorMessage: null),
    );

    try {
      final now = DateTime.now();

      final model = WithdrawRequestFirebaseModel(
        userId: event.userId,
        pointsRequested: event.pointsRequested,
        amount: event.amount,
        paymentMethod: event.paymentMethod,
        phone: event.phone,
        status: "pending",
        createdAt: now,
      );

      await firestore.collection("withdraws").add(model.toJson());

      // UPDATE USER POINTS
      await firestore.collection("users").doc(event.userId).update({
        "totalPoints": FieldValue.increment(-event.pointsRequested),
        "updateAt": now,
      });

      emit(
        state.copyWith(
          isLoading: false,
          successMessage: "Withdraw request submitted successfully!",
        ),
      );

      // reload user's withdraw history
      add(WithdrawFirebaseEvent.loadRequests(event.userId));
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: "Failed to submit request: $e",
        ),
      );
    }
  }

  // ===========================================================================
  // LOAD USER WITHDRAW LIST
  // ===========================================================================
  Future<void> _onLoadRequests(
    _LoadRequests event,
    Emitter<WithdrawFirebaseState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    try {
      final query = await firestore
          .collection("withdraws")
          .where("userId", isEqualTo: event.userId)
          .orderBy("createdAt", descending: true)
          .get();

      final list = query.docs
          .map((doc) => WithdrawRequestFirebaseModel.fromFirestore(doc))
          .toList();

      emit(state.copyWith(isLoading: false, withdraws: list));
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: "Failed to load history: $e",
        ),
      );
    }
  }
}
