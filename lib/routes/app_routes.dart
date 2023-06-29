part of 'app_pages.dart';

abstract class AppRoutes {
  static const splash = _Routes.splash;
  static const welcome = _Routes.welcome;
  static const initial = _Routes.initial;
  static const login = _Routes.login;
  static const signup = _Routes.signup;
  static const home = _Routes.home;
}

abstract class _Routes {
  static const initial = '/';
  static const splash = '/splash_page';
  static const welcome = "/welcome";
  static const home = "/home";

  static const login = '/login_page';
  static const signup = '/signup_page';
}
