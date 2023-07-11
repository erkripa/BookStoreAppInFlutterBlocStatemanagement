import 'package:course_app/utils/app_colors.dart';
import 'package:course_app/utils/dimens.dart';
import 'package:course_app/utils/styles/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

mixin DarkThemeMixin {
  SystemUiOverlayStyle darkSystemUIOverlayStyle() => const SystemUiOverlayStyle(
        statusBarColor: AppColors.darkBgColor,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: AppColors.darkBgColor,
        systemNavigationBarDividerColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.light,
      );

  DialogTheme darkDialogTheme() =>
      const DialogTheme(backgroundColor: AppColors.darkDialogColor);

  SnackBarThemeData darkSnackBarTheme() {
    return const SnackBarThemeData(
      backgroundColor: AppColors.lightBgColor,
      contentTextStyle: TextStyle(
        color: AppColors.lightBodyTextColor,
      ),
      actionTextColor: AppColors.primaryColor,
    );
  }

  ProgressIndicatorThemeData darkProgressIndicatorTheme() {
    return const ProgressIndicatorThemeData(
      color: AppColors.whiteColor,
      circularTrackColor: AppColors.whiteColor,
    );
  }

  TabBarTheme darkTabBarTheme() {
    return const TabBarTheme().copyWith(
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
    );
  }

  TextTheme darkTextTheme() {
    return const TextTheme().copyWith(
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
    );
  }

  InputDecorationTheme darkInputDecorationTheme() {
    return InputDecorationTheme(
      filled: true,
      fillColor: AppColors.darkDialogColor,
      constraints: BoxConstraints(
        minHeight: Dimens.fiftySix,
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
    );
  }

  ElevatedButtonThemeData darkElevatedButtonTheme() {
    return ElevatedButtonThemeData(
      style: const ButtonStyle().copyWith(
        backgroundColor: MaterialStateProperty.all(AppColors.primaryColor),
        foregroundColor: MaterialStateProperty.all(AppColors.whiteColor),
        elevation: MaterialStateProperty.all(0.0),
      ),
    );
  }

  BottomSheetThemeData darkBottomSheetTheme() {
    return const BottomSheetThemeData().copyWith(
      backgroundColor: AppColors.darkDialogColor,
      surfaceTintColor: AppColors.darkDialogColor,
      modalBackgroundColor: AppColors.darkDialogColor,
      modalBarrierColor: AppColors.blackColor.withOpacity(0.5),
    );
  }

  AppBarTheme darkAppBarTheme() {
    return AppBarTheme(
      backgroundColor: AppColors.darkBgColor,
      elevation: 0,
      systemOverlayStyle: darkSystemUIOverlayStyle(),
    );
  }
}
