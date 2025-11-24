part of 'auth_bloc.dart';

@freezed
abstract class AuthEvent with _$AuthEvent {
  /// 🔹 Cek apakah user sudah login (dipanggil di SplashScreen)
  const factory AuthEvent.loadUser() = _LoadUser;

  /// 🔹 Logout user
  const factory AuthEvent.logout() = _Logout;

  /// 🔹 Login menggunakan email + password
  const factory AuthEvent.login({
    required String email,
    required String password,
  }) = _Login;

  /// 🔹 Register akun baru
  const factory AuthEvent.register({
    required String name,
    required String email,
    required String phoneNumber,
    required String password,
  }) = _Register;
}
