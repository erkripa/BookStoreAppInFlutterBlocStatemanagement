import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'exbanner_event.dart';
part 'exbanner_state.dart';

class ExbannerBloc extends Bloc<ExbannerEvent, ExbannerState> {
  ExbannerBloc() : super(const ExbannerState()) {
    on<OnBannerChangeEVent>(_onBannerChange);
    _initState();
  }

  FutureOr<void> _onBannerChange(OnBannerChangeEVent event, Emitter emit) {
    print("index => ${event.index}");
    emit(state.copyWith(currentIndex: event.index));
  }

  void _initState() => add(OnBannerChangeEVent(index: 0));
}
