part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}
final class LoginSuccess extends LoginState {}
final class LoginError extends LoginState {
  final String msg;
  LoginError(this.msg);
}
