part of 'login_bloc.dart';

@immutable
class LoginState extends Equatable {
  final String? email;
  final String? password;
  final Status? status;

  const LoginState({this.email, this.password, this.status});

  LoginState copyWith({String? email, String? password, Status? status}) =>
      LoginState(
        email: email ?? this.email,
        password: password ?? this.password,
        status: status ?? this.status,
      );

  @override
  String toString() {
    return "email:$email pass:$password";
  }

  @override
  List<Object?> get props => [email, password, status];
}
