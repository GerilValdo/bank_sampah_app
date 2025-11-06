import 'package:bank_sampah_app/core/services/auth_prefs_service.dart';
import 'package:bank_sampah_app/feature/authentication/models/user_model.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState.initial()) {
    on<_LoadUser>(_onLoadUser);
    on<_Logout>(_onLogout);
    on<_Login>(_onLogin);
    on<_Register>(_onRegister);
  }
  Future<void> _onLoadUser(_LoadUser event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());

    final user = await AuthPrefsService.getUser();
    final isLoggedIn = await AuthPrefsService.isLoggedIn();

    if (user != null && isLoggedIn) {
      emit(AuthState.authenticated(user));
    } else {
      emit(const AuthState.unauthenticated());
    }
  }

  Future<void> _onLogout(_Logout event, Emitter<AuthState> emit) async {
    await AuthPrefsService.logout();
    emit(const AuthState.unauthenticated());
  }

  Future<void> _onLogin(_Login event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());

    final user = await AuthPrefsService.getUser();

    if (user == null) {
      emit(const AuthState.error('No account found. Please register first.'));
      emit(const AuthState.unauthenticated());
      return;
    }

    if (user.email == event.email.trim() &&
        user.password == event.password.trim()) {
      await AuthPrefsService.setLoggedIn(true);
      emit(AuthState.authenticated(user));
    } else {
      emit(const AuthState.error('Invalid email or password'));
      emit(const AuthState.unauthenticated());
    }
  }

  Future<void> _onRegister(_Register event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());

    try {
      final user = UserModel(
        name: event.name,
        email: event.email.trim(),
        phoneNumber: event.phoneNumber.trim(),
        password: event.password.trim(),
        totalPoints: 0,
      );

      await AuthPrefsService.saveUser(user, role: 'user');
      // await AuthPrefsService.setLoggedIn(true);

      emit(AuthState.authenticated(user));
    } catch (e) {
      emit(AuthState.error('Registration failed: $e'));
    }
  }
}
