import 'package:course_app/modules/register/bloc/register_bloc.dart';
import 'package:course_app/modules/register/pages/register_page.dart';
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
    BlocPage(
      routName: AppRoutes.splash,
      page: SplashPage.new,
      bloc: BlocProvider(create: (context) => SplashBloc()),
    ),
    BlocPage(
      routName: AppRoutes.signup,
      page: RegisterPage.new,
      bloc: BlocProvider(create: (context) => RegisterBloc()),
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
    AppUtility.log("Initial Splash Page Created => '${settings.name}'");
    return MaterialPageRoute(builder: (_) => const SplashPage());
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
