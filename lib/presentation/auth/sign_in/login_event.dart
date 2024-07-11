part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}
class LoginSuccessEvent extends LoginEvent{
  final String gmail;
  final String password;
  LoginSuccessEvent(this.gmail, this.password);

}