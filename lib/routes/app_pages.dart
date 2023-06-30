import 'package:course_app/modules/application/bloc/application_bloc.dart';
import 'package:course_app/modules/application/pages/application_page.dart';
import 'package:course_app/modules/login/bloc/login_bloc.dart';
import 'package:course_app/modules/login/pages/login_page.dart';
import 'package:course_app/modules/register/bloc/register_bloc.dart';
import 'package:course_app/modules/register/pages/register_page.dart';
import 'package:course_app/modules/welcome/bloc/welcome_bloc.dart';
import 'package:course_app/modules/welcome/pages/welcome_page.dart';
import 'package:course_app/splash/bloc/splash_bloc.dart';
import 'package:course_app/themes/cubit/theme_cubit.dart';
import 'package:course_app/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:course_app/splash/splash_page.dart';
part 'app_routes.dart';

typedef NewPageBuilder = Widget Function();

abstract class AppPages {
  static final List<BlocPage> _pages = [
    //initial application page
    BlocPage(
      routName: AppRoutes.initial,
      page: ApplicationPage.new,
      bloc: BlocProvider(create: (context) => ApplicationBloc()),
    ),
    BlocPage(
      routName: AppRoutes.splash,
      page: SplashPage.new,
      bloc: BlocProvider(create: (context) => SplashBloc()),
    ),

    BlocPage(
      routName: AppRoutes.welcome,
      page: WelcomePage.new,
      bloc: BlocProvider(create: (context) => WelcomeBloc()),
    ),
    BlocPage(
      routName: AppRoutes.signup,
      page: RegisterPage.new,
      bloc: BlocProvider(create: (context) => RegisterBloc()),
    ),
    BlocPage(
      routName: AppRoutes.login,
      page: LoginPage.new,
      bloc: BlocProvider(create: (context) => LoginBloc()),
    ),
  ];

  static List<dynamic> allBlocsProvider() {
    List<dynamic> blocProviders = <dynamic>[];
    //for theme
    blocProviders.add(BlocProvider(create: (context) => ThemeCubit()));

    for (BlocPage bloc in _pages) {
      if (bloc.bloc != null) {
        blocProviders.add(bloc.bloc);
      }
    }
    return blocProviders;
  }

  static MaterialPageRoute onGenerateRoute(RouteSettings settings) {
    final Iterable<BlocPage> result =
        _pages.where((BlocPage blocPage) => blocPage.routName == settings.name);

    if (result.isNotEmpty) {
      AppUtility.log("Page Created => '${settings.name}'");
      return MaterialPageRoute(builder: (_) => result.first.page.call());
    }
    AppUtility.log("Default Created => '${settings.name}'");
    return MaterialPageRoute(builder: (_) => const LoginPage());
  }
}

class BlocPage {
  final String routName;
  final NewPageBuilder page;
  final dynamic bloc;
  BlocPage({
    required this.routName,
    required this.page,
    this.bloc,
  });
}
