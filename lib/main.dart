import 'package:kahani_box/core/providers.dart';
import 'package:kahani_box/routes/app_pages.dart';
import 'package:kahani_box/themes/cubit/theme_cubit.dart';
import 'package:kahani_box/translations/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

void initAppServices() async {}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  ThemeMode _handleAppTheme(String? mode) {
    if (mode == kDarkMode) {
      return ThemeMode.dark;
    }
    if (mode == kLightMode) {
      return ThemeMode.light;
    }
    return ThemeMode.system;
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [...AppPages.routesBlocsProvider, ...Providers.providers],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              return GetMaterialApp(
                title: 'KahaaniBox App',
                debugShowCheckedModeBanner: false,
                themeMode: _handleAppTheme(state.themeMode),
                theme: context.read<ThemeCubit>().getLightThemeData(),
                darkTheme: context.read<ThemeCubit>().getDarkThemeData(),
                translations: AppTranslation(),
                onGenerateRoute: AppPages.onGenerateRoute,
                initialRoute: AppRoutes.initial,
              );
            },
          );
        },
      ),
    );
  }
}
