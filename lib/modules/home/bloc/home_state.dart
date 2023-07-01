part of 'home_bloc.dart';

class HomeState extends Equatable {
  final int dotIndex;
  final List<String>? banners;
  const HomeState({this.dotIndex = 0, this.banners});

  HomeState copyWith({int? dotIndex, List<String>? banners}) => HomeState(
        dotIndex: dotIndex ?? this.dotIndex,
        banners: banners ?? this.banners,
      );

  @override
  List<Object?> get props => [dotIndex];
}
