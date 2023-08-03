part of 'app_pages.dart';

abstract class AppRoutes {
  static const initial = _Routes.initial;
  static const splash = _Routes.splash;
  static const welcome = _Routes.welcome;
  static const login = _Routes.login;
  static const signup = _Routes.signup;

  static const bookDetailPage = _Routes.bookDetailPage;
}

abstract class _Routes {
  static const initial = '/';
  static const splash = '/splash_page';
  static const welcome = "/welcome";

  static const login = '/login_page';
  static const signup = '/signup_page';

  static const bookDetailPage = "/book_detail_page";
}
