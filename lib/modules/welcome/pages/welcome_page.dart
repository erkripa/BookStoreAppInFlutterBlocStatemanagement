import 'package:course_app/modules/welcome/bloc/welcome_bloc.dart';
import 'package:course_app/modules/welcome/bloc/welcome_event.dart';
import 'package:course_app/modules/welcome/bloc/welcome_state.dart';
import 'package:course_app/routes/route_management.dart';
import 'package:course_app/utils/dimens.dart';
import 'package:course_app/widgets/common/primary_filled_btn.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/welcome.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<WelcomeBloc, WelcomeState>(
        builder: (context, state) {
          return Stack(
            children: [
              PageView(
                onPageChanged: (index) =>
                    context.read<WelcomeBloc>().add(PageChanged(index)),
                children: const [
                  Weclome(),
                  Weclome(),
                  Weclome(),
                ],
              ),
              Positioned(
                bottom: Dimens.oneHundredFifty,
                left: 0,
                right: 0,
                child: DotsIndicator(
                  dotsCount: 3,
                  position: state.page,
                  decorator: DotsDecorator(
                    activeColor: Theme.of(context).primaryColor,
                    color: Theme.of(context).disabledColor,
                    size: Size.square(Dimens.eight),
                    activeSize: Size(Dimens.twenty, Dimens.ten),
                    activeShape: RoundedRectangleBorder(
                        borderRadius: Dimens.circularBorderRadius),
                  ),
                ),
              ),
              if (state.page == 2)
                Positioned(
                  right: Dimens.twenty,
                  bottom: Dimens.twenty,
                  child: AyushFilledButton(
                    label: "Next",
                    height: Dimens.h40,
                    width: Dimens.hundred,
                    borderRadius: Dimens.r30,
                    onTap: () => RouteManagement.goToHomePage(context),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
