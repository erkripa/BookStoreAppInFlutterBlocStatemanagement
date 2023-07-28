import 'dart:math';

import 'package:kahani_box/constants/app_strings.dart';
import 'package:kahani_box/extensions/string_extensions.dart';
import 'package:kahani_box/utils/app_colors.dart';
import 'package:kahani_box/utils/dimens.dart';
import 'package:kahani_box/utils/styles/app_text_style.dart';
import 'package:kahani_box/utils/styles/decorations.dart';
import 'package:kahani_box/widgets/common/loading_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/common/primary_text_btn.dart';

abstract class AppUtility {
  /// _Logger
  static final _logger = TalkerFlutter.init();

  static void log(dynamic message, {String? tag}) {
    switch (tag) {
      case 'error':
        _logger.error(message);
        break;
      case 'warning':
        _logger.warning(message);
        break;
      case 'info':
        _logger.info(message);
        break;
      case 'debug':
        _logger.debug(message);
        break;
      case 'critical':
        _logger.critical(message);
        break;
      default:
        _logger.verbose(message);
        break;
    }
  }

  /// Close any open snack bar.

  static void closeSnackBar() {
    if (Get.isSnackbarOpen) Get.back<void>();
  }

  /// Close any open dialog.

  static void closeDialog() {
    if (Get.isDialogOpen ?? false) Get.back<void>();
  }

  /// Close any open bottom sheet.

  static void closeBottomSheet() {
    if (Get.isBottomSheetOpen ?? false) Get.back<void>();
  }

  static void closeFocus() {
    if (FocusManager.instance.primaryFocus!.hasFocus) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

  /// Show Loading Dialog

  static void showLoadingDialog({
    double? value,
    bool? barrierDismissible,
    String? message,
  }) {
    closeSnackBar();
    closeDialog();
    Get.dialog(
      WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Container(
              padding: Dimens.edgeA16,
              margin: Dimens.edgeA16,
              decoration: BoxDecoration(
                color: Theme.of(Get.context!).dialogTheme.backgroundColor,
                borderRadius: BorderRadius.circular(Dimens.eight),
              ),
              constraints: BoxConstraints(
                maxWidth: Dimens.screenWidth / 2.8,
                maxHeight: Dimens.screenHeight,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const LoadingWidget(),
                  Dimens.boxHeight12,
                  Text(
                    message ?? AppStrings.pleaseWait,
                    style: AppStyles.style14Normal.copyWith(
                      color: Theme.of(Get.context!).textTheme.bodyLarge!.color,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      barrierDismissible: barrierDismissible ?? false,
      name: 'loading_dialog',
      navigatorKey: GlobalKey<NavigatorState>(),
    );
  }

  static void showSimpleDialog(Widget child,
      {bool barrierDismissible = false}) {
    closeSnackBar();
    closeDialog();
    Get.dialog(
      MediaQuery.removeViewInsets(
        context: Get.context!,
        removeLeft: true,
        removeTop: true,
        removeRight: true,
        removeBottom: true,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: Dimens.screenHeight,
            maxWidth: Dimens.hundred * 6,
          ),
          child: Padding(
            padding: Dimens.edgeA12,
            child: Align(
              alignment: Alignment.center,
              child: Material(
                type: MaterialType.card,
                color: Theme.of(Get.context!).dialogBackgroundColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(Dimens.four),
                ),
                child: child,
              ),
            ),
          ),
        ),
      ),
      barrierDismissible: barrierDismissible,
      barrierColor: AppColors.blackColor.withOpacity(0.75),
      name: 'simple_dialog',
    );
  }

  /// Show Delete Dialog

  static void showDeleteDialog(BuildContext context, Function onDelete) {
    closeDialog();
    Get.dialog(
      MediaQuery.removeViewInsets(
        context: context,
        removeLeft: true,
        removeTop: true,
        removeRight: true,
        removeBottom: true,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: Dimens.screenHeight,
            maxWidth: Dimens.hundred * 6,
          ),
          child: Padding(
            padding: Dimens.edgeA12,
            child: Align(
              alignment: Alignment.center,
              child: Material(
                type: MaterialType.card,
                color: Theme.of(Get.context!).dialogBackgroundColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(Dimens.four),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Dimens.boxHeight8,
                    Padding(
                      padding: Dimens.edgeH12,
                      child: Text(
                        AppStrings.delete,
                        textAlign: TextAlign.center,
                        style: AppStyles.style20Bold,
                      ),
                    ),
                    Dimens.boxHeight10,
                    Padding(
                      padding: Dimens.edgeH12,
                      child: Text(
                        AppStrings.deleteConfirmationText,
                        textAlign: TextAlign.center,
                        style: AppStyles.style14Normal,
                      ),
                    ),
                    Dimens.boxHeight8,
                    Padding(
                      padding: Dimens.edgeH12,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AyushTextButton(
                            label: AppStrings.no,
                            labelStyle: AppStyles.style16Bold.copyWith(
                              color: AppColors.errorColor,
                            ),
                            onTap: AppUtility.closeDialog,
                            padding: Dimens.edgeA8,
                          ),
                          Dimens.boxWidth16,
                          AyushTextButton(
                            label: AppStrings.yes,
                            labelStyle: AppStyles.style16Bold.copyWith(
                              color: AppColors.successColor,
                            ),
                            onTap: () => onDelete(),
                            padding: Dimens.edgeA8,
                          ),
                        ],
                      ),
                    ),
                    Dimens.boxHeight8,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      barrierDismissible: false,
      barrierColor: AppColors.blackColor.withOpacity(0.75),
      name: 'delete_dialog',
    );
  }

  /// Show Share Dialog

  static void showShareDialog(BuildContext context, String text,
      {String? subject}) async {
    // final box = context.findRenderObject() as RenderBox?;
    // await Share.share(
    //   text,
    //   subject: subject,
    //   sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
    // );
  }

  static void showError(String message) {
    closeSnackBar();
    closeBottomSheet();
    if (message.isEmpty) return;
    Get.rawSnackbar(
      messageText: Text(
        message,
        style: AppStyles.style14Bold.copyWith(color: AppColors.whiteColor),
      ),
      mainButton: TextButton(
        onPressed: () {
          if (Get.isSnackbarOpen) {
            Get.back<void>();
          }
        },
        child: Text(
          AppStrings.okay,
          style: AppStyles.style14Bold.copyWith(color: AppColors.whiteColor),
        ),
      ),
      backgroundColor: AppColors.errorColor,
      margin: Dimens.edgeA16,
      borderRadius: Dimens.fifteen,
      snackStyle: SnackStyle.FLOATING,
    );
  }

  /// Show No Internet Dialog

  static void showNoInternetDialog(Function()? onRetry) {
    closeDialog();
    Get.dialog<void>(
      WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          body: Padding(
            padding: Dimens.edgeA16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: Dimens.screenWidth * 0.75,
                  height: Dimens.screenWidth * 0.75,
                  // child: const RiveAnimation.asset(
                  //   RiveAssets.error,
                  //   alignment: Alignment.center,
                  // ),
                ),
                Dimens.boxHeight16,
                Text(
                  'No Internet!',
                  textAlign: TextAlign.center,
                  style: AppStyles.style24Bold.copyWith(
                    color: AppColors.errorColor,
                  ),
                ),
                Dimens.boxHeight20,
              ],
            ),
          ),
        ),
      ),
      barrierDismissible: false,
      name: 'no_internet_dialog',
    );
  }

  static WillPopScope noInterNetWidget(VoidCallback onTap) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Padding(
          padding: Dimens.edgeA16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: Dimens.screenWidth * 0.75,
                height: Dimens.screenWidth * 0.75,
                // child: const RiveAnimation.asset(
                //   RiveAssets.error,
                //   alignment: Alignment.center,
                // ),
              ),
              Dimens.boxHeight16,
              Text(
                'No Internet!',
                textAlign: TextAlign.center,
                style: AppStyles.style24Bold.copyWith(
                  color: AppColors.errorColor,
                ),
              ),
              TextButton(
                onPressed: onTap,
                child: const Text('RETRY'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Show BottomSheet
  static void showBottomSheet({
    required List<Widget> children,
    double? borderRadius,
    MainAxisAlignment? mainAxisAlignment,
    CrossAxisAlignment? crossAxisAlignment,
    bool? isScrollControlled,
  }) {
    closeBottomSheet();
    Get.bottomSheet(
      Padding(
        padding: Dimens.edgeV8,
        child: Column(
          mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
          crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Ink(
              height: 10,
              width: 80,
              decoration: KDecoration.boxDecoration
                  .copyWith(color: AppColors.lightGrayColor),
            ),
            Dimens.boxHeight16,
            ...children
          ],
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(borderRadius ?? Dimens.zero),
          topRight: Radius.circular(borderRadius ?? Dimens.zero),
        ),
      ),
      isScrollControlled: isScrollControlled ?? false,
      backgroundColor:
          Theme.of(Get.context!).bottomSheetTheme.modalBackgroundColor,
      elevation: 0.0,
      enterBottomSheetDuration: const Duration(milliseconds: 200),
      exitBottomSheetDuration: Duration.zero,
      useRootNavigator: true,
    );
  }

  /// Show Overlay
  static void showOverlay(Function func) {
    Get.showOverlay(
      loadingWidget: const CupertinoActivityIndicator(),
      opacityColor: Theme.of(Get.context!).bottomSheetTheme.backgroundColor!,
      opacity: 0.5,
      asyncFunction: () async {
        await func();
      },
    );
  }

  //show general dialog
  static void showGeneralDialog({
    List<Widget> children = const <Widget>[],
    double? height,
    double? width,
    MainAxisAlignment? mainAxisAlignment,
    CrossAxisAlignment? crossAxisAlignment,
  }) {
    Get.generalDialog(
      barrierColor: Colors.black.withOpacity(0.5),
      barrierDismissible: true,
      barrierLabel: '',
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return Align(
          alignment: Alignment.topCenter,
          child: Container(
            padding: Dimens.defaultPadding,
            decoration: BoxDecoration(
              color: AppColors.backgroundColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 8.0,
                  spreadRadius: 2.0,
                ),
              ],
            ),
            width: width ?? MediaQuery.of(context).size.width,
            height: height ?? MediaQuery.of(context).size.height / 2.5,
            child: Material(
              color: AppColors.backgroundColor,
              child: Column(
                crossAxisAlignment:
                    crossAxisAlignment ?? CrossAxisAlignment.start,
                mainAxisAlignment:
                    mainAxisAlignment ?? MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: children,
              ),
            ),
          ),
        );
      },
      transitionBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, -1),
            end: const Offset(0, 0),
          ).animate(CurvedAnimation(
            parent: animation,
            curve: Curves.easeOut,
          )),
          child: child,
        );
      },
    );
  }

  /// Show SnackBar

  static void showSnackBar(String message, String type, {int? duration}) {
    closeSnackBar();
    Get.showSnackbar(
      GetSnackBar(
        margin: EdgeInsets.only(
          left: Dimens.zero,
          right: Dimens.zero,
          top: Dimens.zero,
          bottom: Dimens.zero,
        ),
        borderRadius: Dimens.zero,
        padding: Dimens.edgeV16H12,
        snackStyle: SnackStyle.FLOATING,
        snackPosition: SnackPosition.BOTTOM,
        borderWidth: Dimens.zero,
        messageText: Text(
          message.toCapitalized(),
          style: AppStyles.style14Normal.copyWith(
            color: renderTextColor(type),
          ),
        ),
        icon: Icon(
          renderIcon(type),
          color: renderIconColor(type),
          size: Dimens.twenty,
        ),
        mainButton: Padding(
          padding: Dimens.edgeH8,
          child: TextButton(
            onPressed: closeSnackBar,
            child: Text(
              AppStrings.ok.toUpperCase(),
            ),
          ),
        ),
        shouldIconPulse: false,
        backgroundColor: type == 'error'
            ? AppColors.errorColor
            : Theme.of(Get.context!).snackBarTheme.backgroundColor!,
        dismissDirection: DismissDirection.horizontal,
        duration: Duration(seconds: duration ?? 3),
      ),
    );
  }

  /// Render Text Color
  static Color renderTextColor(String type) {
    return Theme.of(Get.context!).snackBarTheme.contentTextStyle!.color!;
  }

  /// Render Icon Color
  static Color renderIconColor(String type) {
    if (type == AppStrings.success) {
      return AppColors.successColor;
    }
    return Theme.of(Get.context!).snackBarTheme.contentTextStyle!.color!;
  }

  /// Render Icon
  static IconData renderIcon(String type) {
    if (type == AppStrings.success) {
      return CupertinoIcons.checkmark_alt_circle_fill;
    }

    return CupertinoIcons.info_circle_fill;
  }

  /// --------------------------------------------------------------------------

  static void printLog(message) {
    debugPrint(
        "=======================================================================");
    debugPrint(message.toString(), wrapWidth: 1024);
    debugPrint(
        "=======================================================================");
  }

  /// --------------------------------------------------------------------------

  /// Open Url
  static Future<void> openUrl(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      showSnackBar("Couldn't launch url", AppStrings.error);
    }
  }

  /// Random String
  static String generateUid(int length) {
    const chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890@!%&_';
    var rnd = Random();

    return String.fromCharCodes(
      Iterable.generate(
        16,
        (_) => chars.codeUnitAt(rnd.nextInt(chars.length)),
      ),
    );
  }

  static bool isFullUrl(String videoUrl) {
    if (videoUrl.contains("https") || videoUrl.contains("http")) return true;
    return false;
  }
}
