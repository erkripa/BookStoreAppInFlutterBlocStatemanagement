import 'package:flutter_bloc/flutter_bloc.dart';

import 'welcome_event.dart';
import 'welcome_state.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  WelcomeBloc() : super(const WelcomeState()) {
    on<PageChanged>(_onPageChanged);
  }

  void _onPageChanged(
    PageChanged event,
    Emitter<WelcomeState> emit,
  ) {
    emit(state.copyWith(page: event.page));
  }
}
