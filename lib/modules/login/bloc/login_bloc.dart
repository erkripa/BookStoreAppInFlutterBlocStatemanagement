import 'dart:async';

import 'package:kahani_box/constants/app_strings.dart';
import 'package:kahani_box/enums/enums.dart';
import 'package:kahani_box/utils/utility.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<EmailChange>(_emailChnage);
    on<PassWordChange>(_passwordChange);
    on<LoginSubmitEvent>(_loginSubmit);
  }

  void _emailChnage(EmailChange event, Emitter<LoginState> emit) {
    return emit(state.copyWith(email: event.email));
  }

  void _passwordChange(PassWordChange event, Emitter<LoginState> emit) {
    return emit(state.copyWith(password: event.password));
  }

  Future<void> _loginSubmit(
      LoginSubmitEvent event, Emitter<LoginState> emit) async {
    try {
      print(state);
      emit(state.copyWith(status: Status.loading));
      await Future.delayed(const Duration(seconds: 3));

      emit(state.copyWith(status: Status.done));
    } catch (e) {
      emit(state.copyWith(status: Status.done));
      AppUtility.showError(AppStrings.errorOccurred);
    }
  }
}
