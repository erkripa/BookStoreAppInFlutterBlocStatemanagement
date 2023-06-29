class WelcomeEvent {}

class PageChanged extends WelcomeEvent {
  int page;
  PageChanged(this.page);
}
