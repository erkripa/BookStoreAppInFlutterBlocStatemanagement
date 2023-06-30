import 'package:course_app/utils/app_colors.dart';
import 'package:course_app/utils/dimens.dart';
import 'package:course_app/utils/styles/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

mixin LightThemeMixin {
  SystemUiOverlayStyle lightSystemUiOverlayStyle() =>
      const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarDividerColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark,
      );

  AppBarTheme lightAppBarTheme() {
    return AppBarTheme(
      backgroundColor: AppColors.whiteColor,
      systemOverlayStyle: lightSystemUiOverlayStyle(),
    );
  }

  TextButtonThemeData lightTextButtonTheme() {
    return TextButtonThemeData(
      style: const ButtonStyle().copyWith(
        foregroundColor: MaterialStateProperty.all(AppColors.whiteColor),
        elevation: MaterialStateProperty.all(0.0),
      ),
    );
  }

  ProgressIndicatorThemeData lightProgressIndicatorTheme() {
    return ProgressIndicatorThemeData(
      color: AppColors.primaryColor,
      circularTrackColor: AppColors.primaryLightColor.withOpacity(0.2),
      refreshBackgroundColor: AppColors.lightWhite,
    );
  }

  TabBarTheme lightTabBarTheme() {
    return const TabBarTheme().copyWith(
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
    );
  }

  TextTheme lightTextTheme() {
    return const TextTheme().copyWith(
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
    );
  }

  InputDecorationTheme lightInputDecorationTheme() {
    return InputDecorationTheme(
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
    );
  }

  OutlinedButtonThemeData lightOutlineButtonTheme() {
    return OutlinedButtonThemeData(
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
    );
  }

  BottomSheetThemeData ligthBottomSheetTheme() {
    return const BottomSheetThemeData().copyWith(
      backgroundColor: AppColors.lightDialogColor,
      surfaceTintColor: AppColors.lightDialogColor,
      modalBackgroundColor: AppColors.lightDialogColor,
      modalBarrierColor: AppColors.blackColor.withOpacity(0.5),
    );
  }

  ElevatedButtonThemeData lightElevatedButtonTheme() {
    return ElevatedButtonThemeData(
      style: const ButtonStyle().copyWith(
        // backgroundColor: MaterialStateProperty.all(AppColors.primaryColor),
        foregroundColor: MaterialStateProperty.all(AppColors.whiteColor),
        elevation: MaterialStateProperty.all(0.0),
      ),
    );
  }

  //snackbar
  SnackBarThemeData lightSnackBarTheme() {
    return SnackBarThemeData(
      backgroundColor: AppColors.primaryColor,
      contentTextStyle: AppStyles.style14Normal.copyWith(
        color: AppColors.darkBodyTextColor,
      ),
      actionTextColor: AppColors.primaryColor,
    );
  }

  DividerThemeData lightDividerTheme() {
    return const DividerThemeData(
      color: AppColors.lightDividerColor,
      thickness: 1,
    );
  }

  DialogTheme lightDialogTheme() {
    return DialogTheme(
      backgroundColor: AppColors.lightDialogColor,
      surfaceTintColor: AppColors.primaryColor,
      titleTextStyle: AppStyles.style16Black,
    );
  }
}
