part of 'auth_bloc.dart';

@freezed
abstract class AuthEvent with _$AuthEvent {
  const factory AuthEvent.loadUser() = _LoadUser;
  const factory AuthEvent.logout() = _Logout;
  const factory AuthEvent.login({
    required String email,
    required String password,
  }) = _Login;
  const factory AuthEvent.register({
    required String name,
    required String email,
    required String phoneNumber,
    required String password,
  }) = _Register;
}
