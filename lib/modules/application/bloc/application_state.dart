part of 'application_bloc.dart';

class ApplicationState extends Equatable {
  final int? currentPageIndex;
  final List<Widget>? pages;
  const ApplicationState({this.currentPageIndex = 0, this.pages});

  @override
  List<Object?> get props => [currentPageIndex, pages];

  ApplicationState copyWith({int? currentPageIndex, List<Widget>? pages}) =>
      ApplicationState(
        currentPageIndex: currentPageIndex ?? this.currentPageIndex,
        pages: pages ?? this.pages,
      );
}
