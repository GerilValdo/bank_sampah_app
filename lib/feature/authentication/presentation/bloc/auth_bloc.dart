import 'package:bank_sampah_app/feature/authentication/data/service/auth_prefs_service.dart';
import 'package:bank_sampah_app/feature/authentication/data/datasource/user_local_datasource.dart';
import 'package:bank_sampah_app/feature/authentication/data/models/user_model.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserLocalDatasource _localDatasource;

  AuthBloc(this._localDatasource) : super(AuthState.initial()) {
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
    try {
      final userData = await _localDatasource.getUserByEmail(event.email.trim());

      if (userData == null) {
        emit(const AuthState.error('No account found. Please register first.'));
        return;
      }

      final user = UserModel.fromJson(userData);

      if (user.password == event.password.trim()) {
        await AuthPrefsService.saveUser(user, role: user.role);
        emit(AuthState.authenticated(user));
      } else {
        emit(const AuthState.error('Invalid email or password'));
      }

    } catch (e) {
      emit(AuthState.error('Login failed: ${e.toString()}'));
    }
  }

  Future<void> _onRegister(_Register event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());

    try {
      final exist = await _localDatasource.getUserByEmail(event.email.trim());
      if (exist != null) {
        emit(const AuthState.error("Email already registered"));
        return;
      }

      final user = UserModel(
        name: event.name,
        email: event.email.trim(),
        phoneNumber: event.phoneNumber.trim(),
        password: event.password.trim(),
        totalPoints: 0,
        role: 'user',
      );

      await _localDatasource.insertUser(user.toJson());

      emit(const AuthState.success('Account created successfully 🎉'));

    } catch (e) {
      emit(AuthState.error('Registration failed: ${e.toString()}'));
    }
  }
}
