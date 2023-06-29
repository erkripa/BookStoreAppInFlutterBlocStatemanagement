part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class EmailChange extends LoginEvent {
  final String email;
  EmailChange(this.email);
}

class PassWordChange extends LoginEvent {
  final String password;

  PassWordChange(this.password);
}

class LoginSubmitEvent extends LoginEvent {}
