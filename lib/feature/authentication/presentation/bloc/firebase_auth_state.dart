part of 'firebase_auth_bloc.dart';

@freezed
abstract class FirebaseAuthState with _$FirebaseAuthState {
  const factory FirebaseAuthState.initial() = _Initial;

  const factory FirebaseAuthState.loading() = _Loading;

  const factory FirebaseAuthState.authenticated(UserFirebaseModel user) = _Authenticated;

  const factory FirebaseAuthState.loginSuccess(UserFirebaseModel user) = _LoginSuccess;

  const factory FirebaseAuthState.unauthenticated() = _Unauthenticated;

  const factory FirebaseAuthState.emailVerificationSent() = _EmailVerificationSent;

  const factory FirebaseAuthState.emailVerified() = _EmailVerified;

  const factory FirebaseAuthState.emailNotVerified() = _EmailNotVerified;

  const factory FirebaseAuthState.error(String message) = _Error;

  const factory FirebaseAuthState.success(String message) = _Success;
}
