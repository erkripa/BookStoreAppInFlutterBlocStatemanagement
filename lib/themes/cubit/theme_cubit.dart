import 'package:course_app/services/hive_service.dart';
import 'package:course_app/utils/app_colors.dart';
import 'package:course_app/utils/dimens.dart';
import 'package:course_app/utils/styles/app_text_style.dart';
import 'package:course_app/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState()) {
    _onInit();
  }

  void getSystemChromeData() {
    var themeBrightness = SchedulerBinding.instance.platformDispatcher;

    if (state.themeMode == kLightMode) {
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: Colors.white,
          systemNavigationBarDividerColor: Colors.transparent,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
      );
    } else if (state.themeMode == kDarkMode) {
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: AppColors.darkBgColor,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: AppColors.darkBgColor,
          systemNavigationBarDividerColor: Colors.transparent,
          systemNavigationBarIconBrightness: Brightness.light,
        ),
      );
    } else {
      if (themeBrightness.platformBrightness == Brightness.light) {
        SystemChrome.setSystemUIOverlayStyle(
          const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarColor: Colors.white,
            systemNavigationBarDividerColor: Colors.transparent,
            systemNavigationBarIconBrightness: Brightness.dark,
          ),
        );
      } else {
        SystemChrome.setSystemUIOverlayStyle(
          const SystemUiOverlayStyle(
            statusBarColor: AppColors.darkBgColor,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.light,
            systemNavigationBarColor: AppColors.darkBgColor,
            systemNavigationBarDividerColor: Colors.transparent,
            systemNavigationBarIconBrightness: Brightness.light,
          ),
        );
      }
    }
  }

  ThemeData getLightThemeData() {
    getSystemChromeData();
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: AppColors.primaryColor,
      primaryColorLight: AppColors.primaryLightColor,
      iconTheme: const IconThemeData(color: AppColors.darkerGrayColor),
      scaffoldBackgroundColor: AppColors.lightBgColor,
      appBarTheme: const AppBarTheme(backgroundColor: AppColors.primaryColor),
      cardColor: AppColors.lightDialogColor,
      shadowColor: AppColors.shadowColor.withAlpha(12),
      cardTheme: const CardTheme(color: AppColors.lightDialogColor),
      dialogTheme: DialogTheme(
        backgroundColor: AppColors.lightDialogColor,
        surfaceTintColor: AppColors.primaryColor,
        titleTextStyle: AppStyles.style16Black,
      ),
      dialogBackgroundColor: AppColors.lightDialogColor,
      bottomSheetTheme: const BottomSheetThemeData().copyWith(
        backgroundColor: AppColors.lightDialogColor,
        surfaceTintColor: AppColors.lightDialogColor,
        modalBackgroundColor: AppColors.lightDialogColor,
        modalBarrierColor: AppColors.blackColor.withOpacity(0.5),
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.lightDividerColor,
        thickness: 1,
      ),
      disabledColor: AppColors.lightGrayColor,
      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColors.primaryColor,
        contentTextStyle: AppStyles.style14Normal.copyWith(
          color: AppColors.darkBodyTextColor,
        ),
        actionTextColor: AppColors.primaryColor,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: const ButtonStyle().copyWith(
          // backgroundColor: MaterialStateProperty.all(AppColors.primaryColor),
          foregroundColor: MaterialStateProperty.all(AppColors.whiteColor),
          elevation: MaterialStateProperty.all(0.0),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: const ButtonStyle().copyWith(
          backgroundColor: MaterialStateProperty.all(AppColors.whiteColor),
          foregroundColor: MaterialStateProperty.all(AppColors.whiteColor),
          elevation: MaterialStateProperty.all(0.0),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: Dimens.defaultBoderRadius,
            ),
          ),
          side: MaterialStateProperty.all(
            const BorderSide(color: AppColors.primaryColor),
          ),
        ),
      ),
      dividerColor: AppColors.lightBgColor,
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.lightDialogColor,
        constraints: BoxConstraints(
          minHeight: Dimens.fiftySix,
          // maxHeight: Dimens.fiftySix,
          maxWidth: Dimens.screenWidth,
        ),
        contentPadding: Dimens.edgeInsets0_12,
        labelStyle: AppStyles.style14Normal.copyWith(
          color: AppColors.primaryLightColor,
        ),
        floatingLabelStyle: AppStyles.style14Normal.copyWith(
          color: AppColors.primaryColor,
          fontWeight: FontWeight.bold,
        ),
        hintStyle: AppStyles.style13Normal.copyWith(
          color: AppColors.lightBodyTextColor.withAlpha(140),
        ),
        errorStyle: AppStyles.style14Normal.copyWith(
          color: AppColors.errorColor,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.lightDividerColor,
            width: Dimens.pointFour,
          ),
          borderRadius: Dimens.circularBorderRadius,
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.lightDividerColor.withAlpha(20),
            width: Dimens.pointFour,
          ),
          borderRadius: Dimens.circularBorderRadius,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.lightDividerColor,
            width: Dimens.pointFour,
          ),
          borderRadius: Dimens.circularBorderRadius,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.primaryColor,
            width: Dimens.pointEight,
          ),
          borderRadius: Dimens.circularBorderRadius,
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.errorColor,
            width: Dimens.pointEight,
          ),
          borderRadius: Dimens.circularBorderRadius,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.errorColor,
            width: Dimens.pointEight,
          ),
          borderRadius: Dimens.circularBorderRadius,
        ),
      ),
      fontFamily: kDefaultFontFamily,
      textTheme: const TextTheme().copyWith(
        bodyLarge: const TextStyle(
          color: AppColors.lightBodyTextColor,
        ),
        bodyMedium: const TextStyle(
          color: AppColors.lightBodyTextColor,
        ),
        bodySmall: const TextStyle(
          color: AppColors.lightBodyTextColor,
        ),
        titleMedium: TextStyle(
          color: AppColors.lightBodyTextColor.withAlpha(180),
        ),
        titleSmall: TextStyle(
          color: AppColors.lightBodyTextColor.withAlpha(140),
        ),
        titleLarge: const TextStyle(color: AppColors.whiteColor),
      ),
      textButtonTheme: TextButtonThemeData(
        style: const ButtonStyle().copyWith(
          foregroundColor: MaterialStateProperty.all(AppColors.whiteColor),
          elevation: MaterialStateProperty.all(0.0),
        ),
      ),
      tabBarTheme: const TabBarTheme().copyWith(
        unselectedLabelColor: AppColors.darkBgColor,
        labelColor: AppColors.deppBlackColor,
        labelStyle: AppStyles.textfieldHintTextStyel.copyWith(
          fontWeight: FontWeight.w600,
          fontSize: Dimens.f14,
        ),
        unselectedLabelStyle: AppStyles.textfieldHintTextStyel.copyWith(
          fontWeight: FontWeight.w600,
          fontSize: Dimens.f14,
        ),
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: AppColors.primaryColor,
        circularTrackColor: AppColors.primaryLightColor.withOpacity(0.2),
        refreshBackgroundColor: AppColors.lightWhite,
      ),
      brightness: Brightness.light,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }

  ThemeData getDarkThemeData() {
    getSystemChromeData();
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: AppColors.primaryColor,
      primaryColorLight: AppColors.primaryLightColor,
      iconTheme: const IconThemeData(color: AppColors.darkGrayColor),
      scaffoldBackgroundColor: AppColors.darkBgColor,
      shadowColor: AppColors.shadowColor.withAlpha(12),
      appBarTheme: const AppBarTheme(backgroundColor: AppColors.darkBgColor),
      cardColor: AppColors.darkDialogColor,
      cardTheme: const CardTheme(color: AppColors.darkDialogColor),
      dialogTheme:
          const DialogTheme(backgroundColor: AppColors.darkDialogColor),
      dialogBackgroundColor: AppColors.darkDialogColor,
      bottomSheetTheme: const BottomSheetThemeData().copyWith(
        backgroundColor: AppColors.darkDialogColor,
        surfaceTintColor: AppColors.darkDialogColor,
        modalBackgroundColor: AppColors.darkDialogColor,
        modalBarrierColor: AppColors.blackColor.withOpacity(0.5),
      ),
      dividerColor: AppColors.darkDividerColor,
      disabledColor: AppColors.darkGrayColor,
      snackBarTheme: const SnackBarThemeData(
        backgroundColor: AppColors.lightBgColor,
        contentTextStyle: TextStyle(
          color: AppColors.lightBodyTextColor,
        ),
        actionTextColor: AppColors.primaryColor,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: const ButtonStyle().copyWith(
          backgroundColor: MaterialStateProperty.all(AppColors.primaryColor),
          foregroundColor: MaterialStateProperty.all(AppColors.whiteColor),
          elevation: MaterialStateProperty.all(0.0),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.darkDialogColor,
        constraints: BoxConstraints(
          minHeight: Dimens.fiftySix,
          // maxHeight: Dimens.fiftySix,
          maxWidth: Dimens.screenWidth,
        ),
        labelStyle: AppStyles.style14Normal.copyWith(
          color: AppColors.darkBodyTextColor,
        ),
        floatingLabelStyle: AppStyles.style14Normal.copyWith(
          color: AppColors.darkBodyTextColor.withAlpha(140),
        ),
        hintStyle: AppStyles.style14Normal.copyWith(
          color: AppColors.darkBodyTextColor.withAlpha(140),
        ),
        errorStyle: AppStyles.style14Normal.copyWith(
          color: AppColors.errorColor,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.darkDividerColor,
            width: Dimens.pointFour,
          ),
          borderRadius: Dimens.circularBorderRadius,
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.errorColor,
            width: Dimens.pointFour,
          ),
          borderRadius: Dimens.circularBorderRadius,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.darkDividerColor,
            width: Dimens.pointFour,
          ),
          borderRadius: Dimens.circularBorderRadius,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.primaryColor,
            width: Dimens.pointEight,
          ),
          borderRadius: Dimens.circularBorderRadius,
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.errorColor,
            width: Dimens.pointEight,
          ),
          borderRadius: Dimens.circularBorderRadius,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.errorColor,
            width: Dimens.pointEight,
          ),
          borderRadius: Dimens.circularBorderRadius,
        ),
      ),
      fontFamily: kDefaultFontFamily,
      textTheme: const TextTheme().copyWith(
        bodyLarge: const TextStyle(
          color: AppColors.darkBodyTextColor,
        ),
        bodyMedium: const TextStyle(
          color: AppColors.darkBodyTextColor,
        ),
        bodySmall: const TextStyle(
          color: AppColors.darkSmallBodyTextColor,
        ),
        titleMedium: TextStyle(
          color: AppColors.darkBodyTextColor.withAlpha(180),
        ),
        titleSmall: TextStyle(
          color: AppColors.darkBodyTextColor.withAlpha(140),
        ),
        titleLarge: const TextStyle(color: AppColors.whiteColor),
      ),
      tabBarTheme: const TabBarTheme().copyWith(
        unselectedLabelColor: AppColors.whiteColor.withAlpha(200),
        labelColor: AppColors.whiteColor,
        labelStyle: AppStyles.style16Normal.copyWith(
          fontWeight: FontWeight.w700,
          color: AppColors.whiteColor,
        ),
        unselectedLabelStyle: AppStyles.style16Normal.copyWith(
          fontWeight: FontWeight.w600,
          color: AppColors.lightWhite,
        ),
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.whiteColor,
        circularTrackColor: AppColors.whiteColor,
      ),
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
