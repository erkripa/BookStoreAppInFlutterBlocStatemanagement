import 'package:course_app/modules/home/bloc/home_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Providers {
  static final providers = [
    BlocProvider(create: (context) => HomeBloc()),
  ];
}
