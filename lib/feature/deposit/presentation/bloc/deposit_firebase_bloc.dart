import 'dart:io';

import 'package:bank_sampah_app/core/config/cloudinary_config.dart';
import 'package:bank_sampah_app/core/services/cloudinary_service.dart';
import 'package:bank_sampah_app/feature/authentication/presentation/bloc/firebase_auth_bloc.dart';
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
  final FirebaseAuthBloc authBloc;

  DepositFirebaseBloc(this.firestore, this.authBloc)
    : super(const DepositFirebaseState()) {
    on<_LoadDeposits>(_onLoadDeposits);
    on<_AddDeposit>(_onAddDeposit);
    on<_UpdateDeposit>(_onUpdateDeposit);
    on<_DeleteDeposit>(_onDeleteDeposit);
  }

  
  /// LOAD DEPOSITS
  
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
    String? imageUrl;

    if (event.imageFile != null) {
      imageUrl = await CloudinaryService.uploadImage(
        file: event.imageFile!,
        folder: "bank_sampah/deposit",
        uploadPreset: CloudinaryConfig.uploadPresetDeposit,
      );
    }

    final depositData = event.deposit.copyWith(
      imageUrl: imageUrl,
      createdAt: DateTime.now(),
    );

    // simpan ke Firestore
    final docRef = await firestore
        .collection('deposits')
        .add(depositData.toJson());

    await docRef.update({'id': docRef.id});

    // reload deposit user
    add(DepositFirebaseEvent.loadDeposits(event.deposit.userId!));

    emit(
      state.copyWith(
        isLoading: false,
        successMessage: "Deposit successfully submitted!",
      ),
    );
  } catch (e) {
    emit(
      state.copyWith(
        isLoading: false,
        errorMessage: "Failed to add deposit: $e",
      ),
    );
  }
}


  
  /// UPDATE DEPOSIT
  
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

      if (event.deposit.status == "completed") {
        final userRef = firestore.collection("users").doc(event.deposit.userId);

        final userSnap = await userRef.get();
        if (userSnap.exists) {
          final currentPoints = userSnap.data()?["totalPoints"] ?? 0;

          await userRef.update({
            "totalPoints": currentPoints + event.deposit.totalPoints,
          });
        }
        authBloc.add(FirebaseAuthEvent.loadUser());
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

  
  /// DELETE DEPOSIT
  
  Future<void> _onDeleteDeposit(
    _DeleteDeposit event,
    Emitter<DepositFirebaseState> emit,
  ) async {
    emit(
      state.copyWith(isLoading: true, errorMessage: null, successMessage: null),
    );

    try {
      await firestore.collection('deposits').doc(event.id).delete();

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
