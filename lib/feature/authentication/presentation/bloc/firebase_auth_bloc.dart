import 'dart:io';

import 'package:bank_sampah_app/core/services/cloudinary_service.dart';
import 'package:bank_sampah_app/feature/authentication/data/models/user_firebase_model.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'firebase_auth_event.dart';
part 'firebase_auth_state.dart';
part 'firebase_auth_bloc.freezed.dart';

class FirebaseAuthBloc extends Bloc<FirebaseAuthEvent, FirebaseAuthState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  FirebaseAuthBloc() : super(const FirebaseAuthState.initial()) {
    on<_Register>(_register);
    on<_Login>(_login);
    on<_Logout>(_logout);
    on<_LoadUser>(_loadUser);
    on<_UpdateProfile>(_updateProfile);
    on<_CheckEmailVerification>(_checkEmailVerification);
    on<_ResendEmailVerification>(_resendEmailVerification);
  }

  
  //           REGISTER
  
  Future<void> _register(
    _Register event,
    Emitter<FirebaseAuthState> emit,
  ) async {
    emit(const FirebaseAuthState.loading());

    try {
      final cred = await _auth.createUserWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );

      final user = cred.user!;

      final model = UserFirebaseModel(
        uid: user.uid,
        username: event.username,
        email: event.email,
        phoneNumber: event.phoneNumber,
        createdAt: DateTime.now(),
        updateAt: DateTime.now(),
      );

      await _firestore.collection('users').doc(user.uid).set(model.toJson());

      await user.sendEmailVerification();

      emit(const FirebaseAuthState.emailVerificationSent());
    } catch (e) {
      emit(FirebaseAuthState.error("Registration failed: $e"));
    }
  }

  
  // LOGIN
  
  Future<void> _login(_Login event, Emitter<FirebaseAuthState> emit) async {
    emit(const FirebaseAuthState.loading());

    try {
      final cred = await _auth.signInWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );

      final user = cred.user!;
      await user.reload();

      if (!user.emailVerified) {
        emit(const FirebaseAuthState.emailNotVerified());
        return;
      }

      final snap = await _firestore.collection('users').doc(user.uid).get();
      final model = UserFirebaseModel.fromJson(snap.data()!);

      emit(FirebaseAuthState.loginSuccess(model));

    } catch (e) {
      emit(FirebaseAuthState.error("Login failed: $e"));
    }
  }

  
  //LOGOUT
  
  Future<void> _logout(_Logout event, Emitter<FirebaseAuthState> emit) async {
    await _auth.signOut();
    emit(const FirebaseAuthState.unauthenticated());
  }

  
  //          LOAD USER
  
  Future<void> _loadUser(
    _LoadUser event,
    Emitter<FirebaseAuthState> emit,
  ) async {
    final current = _auth.currentUser;

    if (current == null) {
      emit(const FirebaseAuthState.unauthenticated());
      return;
    }

    try {
      final snap = await _firestore.collection("users").doc(current.uid).get();

      if (!snap.exists) {
        emit(const FirebaseAuthState.unauthenticated());
        return;
      }

      final model = UserFirebaseModel.fromJson(snap.data()!);

      emit(FirebaseAuthState.authenticated(model));
    } catch (e) {
      emit(const FirebaseAuthState.unauthenticated());
    }
  }

  
  //        UPDATE PROFILE
  
  Future<void> _updateProfile(
    _UpdateProfile event,
    Emitter<FirebaseAuthState> emit,
  ) async {
    emit(const FirebaseAuthState.loading());

    try {
      final current = _auth.currentUser;

      if (current == null) {
        emit(const FirebaseAuthState.unauthenticated());
        return;
      }

      String? newPhotoUrl;

      if (event.imageFile != null) {
        newPhotoUrl = await CloudinaryService.uploadProfilePhoto(
          event.imageFile!,
        );
      }

      final updateData = {
        "username": event.username,
        "phoneNumber": event.phoneNumber,
        "address": event.address,
        "updateAt": DateTime.now().toIso8601String(),
      };

      if (newPhotoUrl != null) {
        updateData["profileImage"] = newPhotoUrl;
      }

      await _firestore.collection("users").doc(current.uid).update(updateData);

      final snap = await _firestore.collection("users").doc(current.uid).get();
      final model = UserFirebaseModel.fromJson(snap.data()!);

      emit(FirebaseAuthState.authenticated(model));
      emit(const FirebaseAuthState.success("Profile updated successfully"));
    } catch (e) {
      emit(FirebaseAuthState.error("Failed to update profile: $e"));
    }
  }

  
  //     CHECK EMAIL VERIFICATION
  
  Future<void> _checkEmailVerification(
    _CheckEmailVerification event,
    Emitter<FirebaseAuthState> emit,
  ) async {
    try {
      final user = _auth.currentUser;
      await user?.reload();

      if (user != null && !user.emailVerified) {
        emit(const FirebaseAuthState.emailNotVerified());
        return;
      }

      if (user != null && user.emailVerified) {
        emit(const FirebaseAuthState.emailVerified());
      }
    } catch (e) {
      emit(FirebaseAuthState.error("Failed to verify email: $e"));
    }
  }

  
  //         RESEND EMAIL
  
  Future<void> _resendEmailVerification(
    _ResendEmailVerification event,
    Emitter<FirebaseAuthState> emit,
  ) async {
    try {
      final user = _auth.currentUser;

      if (user != null && !user.emailVerified) {
        await user.sendEmailVerification();
        emit(const FirebaseAuthState.emailVerificationSent());
      }
    } catch (e) {
      emit(FirebaseAuthState.error("Failed to resend verification email: $e"));
    }
  }
}
