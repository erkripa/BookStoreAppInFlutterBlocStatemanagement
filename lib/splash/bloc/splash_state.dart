import 'package:course_app/enums/enums.dart';

class SplashState {
  final Status? status;
  SplashState({this.status});

  SplashState copyWith({Status? status}) =>
      SplashState(status: status ?? this.status);
}
