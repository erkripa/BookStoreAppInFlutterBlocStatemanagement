import 'package:course_app/enums/enums.dart';
import 'package:course_app/routes/route_management.dart';
import 'package:course_app/splash/bloc/splash_bloc.dart';
import 'package:course_app/splash/bloc/splash_state.dart';
import 'package:course_app/widgets/common/circular_progress_indicator.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state.status == Status.done) {
            RouteManagement.goToRegisterPage(context);
          }
        },
        child: BlocBuilder<SplashBloc, SplashState>(
          builder: (context, state) {
            return const AyushCircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
