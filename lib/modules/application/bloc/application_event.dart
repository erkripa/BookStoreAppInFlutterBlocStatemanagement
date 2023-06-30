part of 'application_bloc.dart';

abstract class ApplicationEvent extends Equatable {
  const ApplicationEvent();
  @override
  List<Object> get props => [];
}

class ChangePageEvent extends ApplicationEvent {
  final int index;
  const ChangePageEvent(this.index);
}
