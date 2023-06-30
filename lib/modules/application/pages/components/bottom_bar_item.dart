import 'package:course_app/utils/app_colors.dart';
import 'package:course_app/utils/dimens.dart';
import 'package:course_app/utils/styles/app_text_style.dart';
import 'package:flutter/material.dart';
import 'animated_bar.dart';
import 'animated_icon.dart';

class BottomNavItem extends StatefulWidget {
  const BottomNavItem({
    Key? key,
    required this.icon,
    required this.itemsCount,
    required this.isActive,
    this.onTap,
    this.showBadge,
    this.bgColor,
    this.iconSize,
    this.iconColor,
    this.title,
  }) : super(key: key);

  final IconData icon;
  final String? title;
  final double? iconSize;
  final Color? iconColor;
  final VoidCallback? onTap;
  final bool isActive;
  final bool? showBadge;
  final int itemsCount;
  final Color? bgColor;

  @override
  State<BottomNavItem> createState() => _BottomNavItemState();
}

class _BottomNavItemState extends State<BottomNavItem>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _animationController.forward();
  }

  void _animateIcon() {
    if (_animationController.status == AnimationStatus.completed) {
      _animationController.reverse();
    } else if (_animationController.status == AnimationStatus.dismissed) {
      _animationController.forward();
    }
  }

  @override
  void dispose() {
    _animationController.dispose(); //
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = (Dimens.screenWidth - Dimens.twentyFour) / widget.itemsCount;

    return GestureDetector(
      onTap: () {
        _animateIcon();
        widget.onTap!();
      },
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: width,
        color: widget.bgColor ?? AppColors.transparent,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedBar(isActive: widget.isActive),
              if (widget.title != null) Dimens.boxHeight2,
              Stack(
                children: [
                  SizedBox(
                    width: widget.iconSize ?? Dimens.twentyFour,
                    height: widget.iconSize ?? Dimens.twentyFour,
                    child: Opacity(
                      opacity: widget.isActive ? 1.0 : 0.5,
                      child: AyushAnimatedIcon(
                        icon: widget.icon,
                        size: widget.iconSize ?? Dimens.twentyFour,
                        color: widget.iconColor ??
                            Theme.of(context).textTheme.bodyLarge!.color,
                        controller: _animationController,
                      ),
                    ),
                  ),
                  if (widget.showBadge == true)
                    Positioned(
                      top: Dimens.zero,
                      right: Dimens.zero,
                      child: Container(
                        width: Dimens.six,
                        height: Dimens.six,
                        decoration: const BoxDecoration(
                          color: AppColors.primaryColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                ],
              ),
              if (widget.title != null) Dimens.boxHeight2,
              if (widget.title != null)
                Text(
                  widget.title!,
                  style: AppStyles.style12Bold,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
