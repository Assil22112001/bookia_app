part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

// ===== Login states =====
final class LoginLoadingState extends AuthState {}
final class LoginSuccessState extends AuthState {}
final class LoginErrorState extends AuthState {
  final String errorMessage;
  LoginErrorState(this.errorMessage);
}

// ===== Register states =====
final class RegisterLoadingState extends AuthState {}
final class RegisterSuccessState extends AuthState {}
final class RegisterErrorState extends AuthState {
  final String errorMessage;
  RegisterErrorState(this.errorMessage);
}
