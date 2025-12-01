part of 'firebase_auth_bloc.dart';

@freezed
abstract class FirebaseAuthEvent with _$FirebaseAuthEvent {
  const factory FirebaseAuthEvent.register({
    required String username,
    required String email,
    required String password,
    required String phoneNumber,
  }) = _Register;

  const factory FirebaseAuthEvent.login({
    required String email,
    required String password,
  }) = _Login;

  const factory FirebaseAuthEvent.logout() = _Logout;

  const factory FirebaseAuthEvent.loadUser() = _LoadUser;

  const factory FirebaseAuthEvent.updateProfile({
  required String username,
  required String phoneNumber,
  required String address,
  File? imageFile,
}) = _UpdateProfile;

const factory FirebaseAuthEvent.sendEmailVerification() = _SendEmailVerification;
const factory FirebaseAuthEvent.checkEmailVerification() = _CheckEmailVerification;
const factory FirebaseAuthEvent.resendEmailVerification() = _ResendEmailVerification;


}