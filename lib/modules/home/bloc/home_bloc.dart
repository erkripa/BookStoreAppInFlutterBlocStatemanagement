import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<BannerChange>(_onBannerChange);
  }

  FutureOr<void> _onBannerChange(BannerChange event, Emitter<HomeState> emit) {
    emit(state.copyWith(dotIndex: event.index));
  }
}
