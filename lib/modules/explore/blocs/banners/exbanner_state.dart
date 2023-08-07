part of 'exbanner_bloc.dart';

class ExbannerState extends Equatable {
  const ExbannerState({this.currentIndex = 0});
  final int? currentIndex;

  ExbannerState copyWith({int? currentIndex}) =>
      ExbannerState(currentIndex: currentIndex ?? this.currentIndex);
  @override
  List<Object> get props => [currentIndex!];
}
