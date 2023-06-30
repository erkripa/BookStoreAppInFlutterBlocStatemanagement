import 'package:course_app/utils/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/application_bloc.dart';
import 'bottom_bar_item.dart';

class AppLicationBottomNavigationBar extends StatelessWidget {
  const AppLicationBottomNavigationBar({
    Key? key,
    this.height,
    this.bgColor,
    this.borderRadius,
    this.padding,
    this.margin,
  }) : super(key: key);

  final double? height;
  final Color? bgColor;
  final double? borderRadius;
  final EdgeInsets? padding;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    DateTime lastExitTime = DateTime.now();
    return SafeArea(
      child: BlocBuilder<ApplicationBloc, ApplicationState>(
        builder: (context, state) {
          final applicationBloc = context.read<ApplicationBloc>();
          return WillPopScope(
            onWillPop: () async {
              applicationBloc.add(const ChangePageEvent(0));
              if (DateTime.now().difference(lastExitTime) >=
                  const Duration(seconds: 2)) {
                lastExitTime = DateTime.now();
                return false;
              } else {
                return true;
              }
            },
            child: Container(
              height: height ?? Dimens.h10 * 8,
              width: Dimens.screenWidth,
              padding: padding ?? Dimens.edgeInsets4.copyWith(bottom: 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimens.r15),
                  topRight: Radius.circular(Dimens.r15),
                ),
                color: bgColor ?? Theme.of(context).cardColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildHomeIconBtn(context, applicationBloc, state),
                  _buildSecondIconBtn(context, applicationBloc, state),
                  _buildCenterBtn(context, applicationBloc, state),
                  _buildFourthIconBtn(context, applicationBloc, state),
                  _buildFifthIconBtn(context, applicationBloc, state),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  BottomNavItem _buildHomeIconBtn(
    BuildContext context,
    ApplicationBloc applicationBloc,
    ApplicationState state,
  ) {
    return BottomNavItem(
      icon: Icons.home_outlined,
      title: "Home",
      iconColor: Theme.of(context).textTheme.bodyLarge!.color,
      isActive: state.currentPageIndex == 0,
      itemsCount: 5,
      onTap: () => applicationBloc.add(const ChangePageEvent(0)),
    );
  }

  BottomNavItem _buildSecondIconBtn(
    BuildContext context,
    ApplicationBloc applicationBloc,
    ApplicationState state,
  ) {
    return BottomNavItem(
      icon: Icons.video_library_outlined,
      title: "Search",
      iconColor: Theme.of(context).textTheme.bodyLarge!.color,
      isActive: state.currentPageIndex == 1,
      itemsCount: 5,
      onTap: () => applicationBloc.add(const ChangePageEvent(1)),
    );
  }

  BottomNavItem _buildCenterBtn(
    BuildContext context,
    ApplicationBloc applicationBloc,
    ApplicationState state,
  ) {
    return BottomNavItem(
      icon: Icons.add_circle_outline_outlined,
      iconSize: Dimens.thirtySix,
      iconColor: Theme.of(context).textTheme.bodyLarge!.color,
      isActive: state.currentPageIndex == 2,
      itemsCount: 5,
      onTap: () => applicationBloc.add(const ChangePageEvent(2)),
    );
  }

  BottomNavItem _buildFourthIconBtn(
    BuildContext context,
    ApplicationBloc applicationBloc,
    ApplicationState state,
  ) {
    return BottomNavItem(
      icon: Icons.subscriptions_outlined,
      title: "Jobs",
      iconColor: Theme.of(context).textTheme.bodyLarge!.color,
      isActive: state.currentPageIndex == 3,
      itemsCount: 5,
      onTap: () => applicationBloc.add(const ChangePageEvent(3)),
    );
  }

  BottomNavItem _buildFifthIconBtn(
    BuildContext context,
    ApplicationBloc applicationBloc,
    ApplicationState state,
  ) {
    return BottomNavItem(
      icon: Icons.library_books_outlined,
      title: "Course",
      iconColor: Theme.of(context).textTheme.bodyLarge!.color,
      isActive: state.currentPageIndex == 4,
      itemsCount: 5,
      onTap: () => applicationBloc.add(const ChangePageEvent(4)),
    );
  }
}
