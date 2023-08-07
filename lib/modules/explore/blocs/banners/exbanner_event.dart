part of 'exbanner_bloc.dart';

sealed class ExbannerEvent {}

class OnBannerChangeEVent extends ExbannerEvent {
  final int? index;
  OnBannerChangeEVent({this.index});
}
