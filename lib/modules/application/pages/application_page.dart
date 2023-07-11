import 'package:course_app/modules/application/bloc/application_bloc.dart';
import 'package:course_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/application_bottom_navbar.dart';

class ApplicationPage extends StatelessWidget {
  const ApplicationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApplicationBloc, ApplicationState>(
      builder: (context, state) {
        return Scaffold(
          body: IndexedStack(
            index: state.currentPageIndex,
            children: state.pages ?? [],
          ),
          bottomNavigationBar: const AppLicationBottomNavigationBar(),
        );
      },
    );
  }
}
