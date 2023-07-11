import 'package:course_app/services/hive_service.dart';
import 'package:course_app/themes/mixins/dark_theme_mixin.dart';
import 'package:course_app/themes/mixins/light_theme_mixin.dart';
import 'package:course_app/utils/app_colors.dart';
import 'package:course_app/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState>
    with LightThemeMixin, DarkThemeMixin {
  ThemeCubit() : super(ThemeState()) {
    _onInit();
  }

  void _getSystemChromeData() {
    var themeBrightness = SchedulerBinding.instance.platformDispatcher;
    if (state.themeMode == kLightMode) {
      SystemChrome.setSystemUIOverlayStyle(lightSystemUiOverlayStyle());
    } else if (state.themeMode == kDarkMode) {
      SystemChrome.setSystemUIOverlayStyle(darkSystemUIOverlayStyle());
    } else {
      if (themeBrightness.platformBrightness == Brightness.light) {
        SystemChrome.setSystemUIOverlayStyle(lightSystemUiOverlayStyle());
      } else {
        SystemChrome.setSystemUIOverlayStyle(darkSystemUIOverlayStyle());
      }
    }
  }

  ThemeData getLightThemeData() {
    _getSystemChromeData();
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: AppColors.primaryColor,
      primaryColorLight: AppColors.primaryLightColor,
      iconTheme: const IconThemeData(color: AppColors.darkerGrayColor),
      scaffoldBackgroundColor: AppColors.whiteColor,
      appBarTheme: lightAppBarTheme(),
      cardColor: AppColors.lightDialogColor,
      shadowColor: AppColors.shadowColor.withAlpha(12),
      cardTheme: const CardTheme(color: AppColors.lightDialogColor),
      dialogTheme: lightDialogTheme(),
      dialogBackgroundColor: AppColors.lightDialogColor,
      bottomSheetTheme: ligthBottomSheetTheme(),
      dividerTheme: lightDividerTheme(),
      disabledColor: AppColors.lightGrayColor,
      snackBarTheme: lightSnackBarTheme(),
      elevatedButtonTheme: lightElevatedButtonTheme(),
      outlinedButtonTheme: lightOutlineButtonTheme(),
      dividerColor: AppColors.lightBgColor,
      inputDecorationTheme: lightInputDecorationTheme(),
      fontFamily: kDefaultFontFamily,
      textTheme: lightTextTheme(),
      textButtonTheme: lightTextButtonTheme(),
      tabBarTheme: lightTabBarTheme(),
      progressIndicatorTheme: lightProgressIndicatorTheme(),
      brightness: Brightness.light,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }

  ThemeData getDarkThemeData() {
    _getSystemChromeData();
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: AppColors.primaryColor,
      primaryColorLight: AppColors.primaryLightColor,
      iconTheme: const IconThemeData(color: AppColors.darkGrayColor),
      scaffoldBackgroundColor: AppColors.darkBgColor,
      shadowColor: AppColors.shadowColor.withAlpha(12),
      appBarTheme: darkAppBarTheme(),
      cardColor: AppColors.darkDialogColor,
      cardTheme: const CardTheme(color: AppColors.darkDialogColor),
      dialogTheme: darkDialogTheme(),
      dialogBackgroundColor: AppColors.darkDialogColor,
      bottomSheetTheme: darkBottomSheetTheme(),
      dividerColor: AppColors.darkDividerColor,
      disabledColor: AppColors.darkGrayColor,
      snackBarTheme: darkSnackBarTheme(),
      elevatedButtonTheme: darkElevatedButtonTheme(),
      inputDecorationTheme: darkInputDecorationTheme(),
      fontFamily: kDefaultFontFamily,
      textTheme: darkTextTheme(),
      tabBarTheme: darkTabBarTheme(),
      progressIndicatorTheme: darkProgressIndicatorTheme(),
      brightness: Brightness.dark,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }

  void setThemeMode(String mode) async {
    await HiveService.put<String>(kThemeModeBox, kThemeModeKey, mode);
    emit(state.copyWith(themeMode: mode));
  }

  void getThemeMode() async {
    var themeMode = await HiveService.get<String>(kThemeModeBox, kThemeModeKey);
    switch (themeMode) {
      case kSystemMode:
        emit(state.copyWith(themeMode: kSystemMode));
        break;
      case kLightMode:
        emit(state.copyWith(themeMode: kLightMode));
        break;
      case kDarkMode:
        emit(state.copyWith(themeMode: kDarkMode));
        break;
      default:
        emit(state.copyWith(themeMode: kSystemMode));
        break;
    }
  }

  void _onInit() async {
    await HiveService.initHiveServices();
    getThemeMode();
    AppUtility.log("Initialized Theme Cubit");
  }
}
