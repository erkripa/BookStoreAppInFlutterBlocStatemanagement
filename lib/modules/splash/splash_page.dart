import 'package:kahani_box/constants/app_constant.dart';
import 'package:kahani_box/enums/enums.dart';
import 'package:kahani_box/routes/route_management.dart';
import 'package:kahani_box/services/hive_service.dart';
import 'package:kahani_box/modules/splash/bloc/splash_bloc.dart';
import 'package:kahani_box/modules/splash/bloc/splash_state.dart';
import 'package:kahani_box/utils/utility.dart';
import 'package:kahani_box/widgets/common/circular_progress_indicator.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashBloc, SplashState>(
        listener: listener,
        child: BlocBuilder<SplashBloc, SplashState>(
          builder: (context, state) {
            return const AyushCircularProgressIndicator();
          },
        ),
      ),
    );
  }

  void listener(BuildContext context, SplashState state) async {
    if (state.status == Status.done) {
      await HiveService.get<bool>(AppConstant.firstTimeOpenAppBoxName,
              AppConstant.firstTimeOpenAppKey)
          .then((result) => _handleRoutes(result, context));
    }
  }

  _handleRoutes(bool? result, BuildContext context) {
    AppUtility.log("isFirst Time Opened => $result");
    if (result != null) {
      RouteManagement.goToLoginPage(context);
    } else {
      RouteManagement.goToWelcomePage(context);
    }
  }
}
