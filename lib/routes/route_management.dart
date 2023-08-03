import 'package:flutter/material.dart';
import 'app_pages.dart';

abstract class RouteManagement {
  static void goToSplashPage(BuildContext context) =>
      Navigator.pushNamedAndRemoveUntil(
          context, AppRoutes.splash, (_) => false);

  static void goToWelcomePage(BuildContext context) =>
      Navigator.pushNamedAndRemoveUntil(
          context, AppRoutes.welcome, (_) => false);

  static goToApplicationPage(BuildContext context) =>
      Navigator.pushNamedAndRemoveUntil(
          context, AppRoutes.initial, (_) => false);

  static void goToRegisterPage(BuildContext context) =>
      Navigator.pushNamed(context, AppRoutes.signup);

  static void goToLoginPage(BuildContext context) =>
      Navigator.pushNamed(context, AppRoutes.login);

  static void goToBack(BuildContext context) => Navigator.pop(context);

  static goToBookDetailPage(BuildContext context) =>
      Navigator.pushNamed(context, AppRoutes.bookDetailPage);
}
