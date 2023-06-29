import 'package:course_app/enums/enums.dart';
import 'package:course_app/modules/register/bloc/register_event.dart';
import 'package:course_app/modules/register/bloc/register_state.dart';
import 'package:course_app/modules/register/repo/register_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(const RegisterState()) {
    on<UserNameEvent>(_userNameEvent);
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);
    on<ConfirmPasswordEvent>(_confirmPasswordEvent);
    on<SubmitEvent>(_submitEvent);
  }

  static RegisterRepo registerRepo = RegisterRepo();

  void _userNameEvent(UserNameEvent event, Emitter<RegisterState> emit) {
    print("user Name => ${event.userName}");

    return emit(state.copyWith(userName: event.userName));
  }

  void _emailEvent(EmailEvent event, Emitter<RegisterState> emit) {
    return emit(state.copyWith(email: event.email));
  }

  void _passwordEvent(PasswordEvent event, Emitter<RegisterState> emit) {
    return emit(state.copyWith(password: event.password));
  }

  void _confirmPasswordEvent(
      ConfirmPasswordEvent event, Emitter<RegisterState> emit) {
    return emit(state.copyWith(confirmPassword: event.confirmpassword));
  }

  Future<void> _submitEvent(
    SubmitEvent event,
    Emitter<RegisterState> emit,
  ) async {
    try {
      emit(state.copyWith(status: Status.loading));

      // registerRepo.register(state);
      await Future.delayed(const Duration(seconds: 2));
      emit(state.copyWith(status: Status.done));
    } catch (e) {
      emit(state.copyWith(status: Status.done));
      print("catch : $e");
    }
  }
}
