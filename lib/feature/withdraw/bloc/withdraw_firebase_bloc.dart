import 'package:bank_sampah_app/feature/authentication/presentation/bloc/firebase_auth_bloc.dart';
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
  final FirebaseAuthBloc authBloc;

  WithdrawFirebaseBloc(this.firestore, this.authBloc)
    : super(const WithdrawFirebaseState()) {
    on<_CreateRequest>(_onCreateRequest);
    on<_LoadRequests>(_onLoadRequests);
    on<_UpdateStatus>(_onUpdateStatus);
  }

  // CREATE WITHDRAW REQUEST
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

      await firestore.collection("users").doc(event.userId).update({
        "totalPoints": FieldValue.increment(-event.pointsRequested),
        "updateAt": now,
      });

      authBloc.add(const FirebaseAuthEvent.loadUser());

      emit(
        state.copyWith(
          isLoading: false,
          successMessage: "Withdraw request submitted successfully!",
        ),
      );

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

  // LOAD USER WITHDRAW LIST
  Future<void> _onLoadRequests(
  _LoadRequests event,
  Emitter<WithdrawFirebaseState> emit,
) async {
  emit(state.copyWith(isLoading: true, errorMessage: null));

  try {
    final uid = event.userId.trim();

    final query = await firestore
        .collection("withdraws")
        .where("userId", isEqualTo: uid)
        .orderBy("createdAt", descending: true)
        .get();

    final list = query.docs
        .map((doc) => WithdrawRequestFirebaseModel.fromFirestore(doc))
        .toList();

    emit(state.copyWith(isLoading: false, withdraws: list));
  } catch (e) {
    emit(state.copyWith(
      isLoading: false,
      errorMessage: "Failed to load history: $e",
    ));
  }
}


  // UPDATE STATUS WITHDRAW
Future<void> _onUpdateStatus(
  _UpdateStatus event,
  Emitter<WithdrawFirebaseState> emit,
) async {
  emit(state.copyWith(isLoading: true, errorMessage: null));

  try {
    final docRef = firestore.collection("withdraws").doc(event.requestId);
    final snap = await docRef.get();

    if (!snap.exists) {
      emit(state.copyWith(isLoading: false, errorMessage: "Request not found"));
      return;
    }

    final data = snap.data()!;
    final userId = (data["userId"] ?? "") as String;
    final previousStatus = (data["status"] ?? "pending") as String;

    final pointsRequested = (data["pointsRequested"] as num).toInt();
    final now = DateTime.now();

    await docRef.update({
      "status": event.newStatus,
      "updatedAt": now,
    });

    if (event.newStatus == "rejected" && previousStatus != "rejected") {
      await firestore.collection("users").doc(userId).update({
        "totalPoints": FieldValue.increment(pointsRequested),
        "updateAt": now,
      });
    }

    if (previousStatus == "rejected" && event.newStatus != "rejected") {
      await firestore.collection("users").doc(userId).update({
        "totalPoints": FieldValue.increment(-pointsRequested),
        "updateAt": now,
      });
    }

    // refresh user points
    authBloc.add(const FirebaseAuthEvent.loadUser());

    // reload withdraw data
    add(WithdrawFirebaseEvent.loadRequests(userId));

    emit(state.copyWith(isLoading: false));
  } catch (e) {
    emit(state.copyWith(
        isLoading: false, errorMessage: "Failed to update status: $e"));
  }
}

}
