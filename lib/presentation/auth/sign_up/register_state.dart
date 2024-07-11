part of 'register_bloc.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}
final class RegisterSuccess extends RegisterState {}
final class RegisterError extends RegisterState {
  final String msg;
  RegisterError(this.msg);
}
