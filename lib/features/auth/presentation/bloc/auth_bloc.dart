import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:control_electoral/features/auth/domain/entities/user_entity.dart';
import 'package:control_electoral/features/auth/domain/repositories/auth_repository.dart';
import 'package:control_electoral/features/auth/domain/usecases/login_usecase.dart';
import 'package:control_electoral/features/auth/domain/usecases/change_password_usecase.dart';
import 'package:control_electoral/features/auth/domain/usecases/recover_password_usecase.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();
  @override
  List<Object?> get props => [];
}

class LoginRequested extends AuthEvent {
  final String cedula;
  final String password;
  const LoginRequested({required this.cedula, required this.password});
  @override
  List<Object?> get props => [cedula, password];
}

class ChangePasswordRequested extends AuthEvent {
  final String oldPass;
  final String newPass;
  const ChangePasswordRequested({required this.oldPass, required this.newPass});
  @override
  List<Object?> get props => [oldPass, newPass];
}

class RecoverPasswordRequested extends AuthEvent {
  final String email;
  const RecoverPasswordRequested({required this.email});
  @override
  List<Object?> get props => [email];
}

class LogoutRequested extends AuthEvent {}

class CheckAuthStatus extends AuthEvent {}

sealed class AuthState extends Equatable {
  const AuthState();
  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {
  const AuthInitial();
}

class AuthLoading extends AuthState {
  const AuthLoading();
}

class AuthAuthenticated extends AuthState {
  final UserEntity user;
  const AuthAuthenticated({required this.user});
  @override
  List<Object?> get props => [user];
}

class AuthMustChangePassword extends AuthState {
  final UserEntity user;
  const AuthMustChangePassword({required this.user});
  @override
  List<Object?> get props => [user];
}

class AuthUnauthenticated extends AuthState {
  const AuthUnauthenticated();
}

class AuthError extends AuthState {
  final String message;
  const AuthError({required this.message});
  @override
  List<Object?> get props => [message];
}

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase _loginUseCase;
  final ChangePasswordUseCase _changePasswordUseCase;
  final RecoverPasswordUseCase _recoverPasswordUseCase;
  final AuthRepository _authRepository;

  AuthBloc(
    this._loginUseCase,
    this._changePasswordUseCase,
    this._recoverPasswordUseCase,
    this._authRepository,
  ) : super(const AuthInitial()) {
    on<LoginRequested>(_onLoginRequested);
    on<ChangePasswordRequested>(_onChangePasswordRequested);
    on<RecoverPasswordRequested>(_onRecoverPasswordRequested);
    on<LogoutRequested>(_onLogoutRequested);
    on<CheckAuthStatus>(_onCheckAuthStatus);
  }

  String? _savedCedula;

  Future<void> _onLoginRequested(
    LoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());
    try {
      final user = await _loginUseCase(event.cedula, event.password);
      _savedCedula = event.cedula;
      if (user.mustChangePassword) {
        if (event.password != 'Ecuador2026') {
          await _authRepository.markPasswordChanged();
          emit(AuthAuthenticated(user: user.copyWith(mustChangePassword: false)));
        } else {
          emit(AuthMustChangePassword(user: user));
        }
      } else {
        emit(AuthAuthenticated(user: user));
      }
    } catch (e) {
      emit(AuthError(message: _formatError(e)));
    }
  }

  Future<void> _onChangePasswordRequested(
    ChangePasswordRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());
    try {
      await _changePasswordUseCase(event.oldPass, event.newPass);
      final user = await _loginUseCase(_savedCedula!, event.newPass);
      await _authRepository.markPasswordChanged();
      emit(AuthAuthenticated(user: user.copyWith(mustChangePassword: false)));
    } catch (e) {
      emit(AuthError(message: _formatError(e)));
    }
  }

  Future<void> _onRecoverPasswordRequested(
    RecoverPasswordRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());
    try {
      await _recoverPasswordUseCase(event.email);
      emit(const AuthUnauthenticated());
    } catch (e) {
      emit(AuthError(message: _formatError(e)));
    }
  }

  Future<void> _onLogoutRequested(
    LogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());
    try {
      await _authRepository.logout();
    } catch (_) {}
    _savedCedula = null;
    emit(const AuthUnauthenticated());
  }

  Future<void> _onCheckAuthStatus(
    CheckAuthStatus event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());
    try {
      final user = await _authRepository.getCurrentUser();
      if (user == null) {
        emit(const AuthUnauthenticated());
      } else {
        _savedCedula = user.cedula;
        if (user.mustChangePassword) {
          final alreadyChanged = await _authRepository.isPasswordChanged();
          if (!alreadyChanged) {
            emit(const AuthUnauthenticated());
            return;
          }
        }
        emit(AuthAuthenticated(user: user.copyWith(mustChangePassword: false)));
      }
    } catch (_) {
      emit(const AuthUnauthenticated());
    }
  }

  String _formatError(Object e) {
    final str = e.toString();
    if (str.contains('Invalid credentials')) return 'Cédula o contraseña incorrectos';
    if (str.contains('User already exists')) return 'El usuario ya existe';
    if (str.contains('Password is too short')) return 'La contraseña es muy corta (mínimo 8 caracteres)';
    return 'Error inesperado: $str';
  }
}
