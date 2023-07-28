import 'package:kahani_box/modules/application/bloc/application_bloc.dart';
import 'package:kahani_box/modules/application/pages/application_page.dart';
import 'package:kahani_box/modules/login/bloc/login_bloc.dart';
import 'package:kahani_box/modules/login/pages/login_page.dart';
import 'package:kahani_box/modules/register/bloc/register_bloc.dart';
import 'package:kahani_box/modules/register/pages/register_page.dart';
import 'package:kahani_box/modules/welcome/bloc/welcome_bloc.dart';
import 'package:kahani_box/modules/welcome/pages/welcome_page.dart';
import 'package:kahani_box/modules/splash/bloc/splash_bloc.dart';
import 'package:kahani_box/themes/cubit/theme_cubit.dart';
import 'package:kahani_box/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kahani_box/modules/splash/splash_page.dart';
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

  static List<dynamic> get routesBlocsProvider {
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

  static PageRoute onGenerateRoute(RouteSettings settings) {
    final Iterable<BlocPage> result =
        _pages.where((BlocPage blocPage) => blocPage.routName == settings.name);

    if (result.isNotEmpty) {
      AppUtility.log("Page Created => '${settings.name}'");
      return PageRouteBuilder(
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.ease;
          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          return SlideTransition(
            position: animation.drive(tween),
            child: result.first.page.call(),
          );
        },
        settings: settings,
      );
    }
    AppUtility.log("Default Created => '${settings.name}'");
    return PageRouteBuilder(
      pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) =>
          const LoginPage(),
      settings: settings,
    );
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
