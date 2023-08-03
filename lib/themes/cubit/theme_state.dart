part of 'theme_cubit.dart';

const String kThemeModeBox = 'themeMode';
const String kThemeModeKey = 'themeMode';
const String kSystemMode = 'system';
const String kLightMode = 'light';
const String kDarkMode = 'dark';
const String kDefaultFontFamily = 'Calibri';

class ThemeState {
  final String? themeMode;
  ThemeState({this.themeMode});
  ThemeState copyWith({String? themeMode}) => ThemeState(
        themeMode: themeMode ?? this.themeMode,
      );
}
