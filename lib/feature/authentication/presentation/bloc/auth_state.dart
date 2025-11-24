part of 'auth_bloc.dart';

@freezed
abstract class AuthState with _$AuthState {
  /// 🔹 State awal
  const factory AuthState.initial() = _Initial;

  /// 🔹 Sedang memproses (login, register, load user)
  const factory AuthState.loading() = _Loading;

  /// 🔹 User berhasil login
  const factory AuthState.authenticated(UserModel user) = _Authenticated;

  /// 🔹 Tidak login
  const factory AuthState.unauthenticated() = _Unauthenticated;

  /// 🔹 Error message
  const factory AuthState.error(String message) = _Error;

  /// 🔹 Success message (dipakai untuk register)
  const factory AuthState.success(String message) = _Success;
}
