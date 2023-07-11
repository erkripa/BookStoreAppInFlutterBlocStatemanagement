import 'dart:async';
import 'package:course_app/modules/home/pages/home_tab.dart';
import 'package:course_app/modules/profile/profile_tab.dart';
import 'package:course_app/widgets/common/keep_alive_page%20copy.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'application_event.dart';
part 'application_state.dart';

class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
  ApplicationBloc() : super(const ApplicationState()) {
    on<ChangePageEvent>(_handlePage);
    _onCreate();
  }
  //pages
  final pages = [
    const KeepAlivePage(child: HomeTabView()),
    KeepAlivePage(child: Container(color: Colors.amber)),
    KeepAlivePage(child: Container(color: Colors.green)),
    KeepAlivePage(child: Container(color: Colors.pink)),
    const KeepAlivePage(child: ProfileTabView()),
  ];

  FutureOr<void> _handlePage(
      ChangePageEvent event, Emitter<ApplicationState> emit) {
    emit(state.copyWith(currentPageIndex: event.index, pages: pages));
  }

  void _onCreate() => add(const ChangePageEvent(0));
}
