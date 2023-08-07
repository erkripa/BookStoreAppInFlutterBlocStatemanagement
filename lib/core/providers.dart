import 'package:kahani_box/modules/explore/blocs/banners/exbanner_bloc.dart';
import 'package:kahani_box/modules/home/bloc/home_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kahani_box/themes/cubit/theme_cubit.dart';

class Providers {
  static final providers = <dynamic>[
    BlocProvider(create: (context) => ThemeCubit()),
    BlocProvider(create: (context) => HomeBloc()),
    BlocProvider(create: (context) => ExbannerBloc()),
  ];
}
