import 'package:course_app/enums/enums.dart';
import 'package:course_app/splash/bloc/splash_event.dart';
import 'package:course_app/splash/bloc/splash_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashState()) {
    on<SplasEventInitial>(_splashInitialEvent);
    on<SplasEventCompleted>(_splashCompletedEvent);
    _onCreate();
  }

  void _splashInitialEvent(SplasEventInitial event, Emitter<SplashState> emit) {
    return emit(state.copyWith(status: Status.loading));
  }

  void _splashCompletedEvent(
      SplasEventCompleted event, Emitter<SplashState> emit) {
    return emit(state.copyWith(status: Status.done));
  }

  void _onCreate() {
    add(SplasEventInitial());
    Future.delayed(const Duration(seconds: 2))
        .then((value) => add(SplasEventCompleted()));
  }
}
