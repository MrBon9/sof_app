part of 'app_bloc.dart';

abstract class AppState extends Equatable {
  ThemeMode get themeMode;

  const AppState();

  @override
  List<Object> get props => [themeMode];
}

class AppInitial extends AppState {
  @override
  final ThemeMode themeMode;

  AppInitial()
      : themeMode = ThemeUtils.appThemeMode != null
            ? ThemeUtils.appThemeMode == 1
                ? ThemeMode.light
                : ThemeMode.dark
            : ThemeMode.system;
}

class ChangeAppThemeSuccessState extends AppState {
  @override
  final ThemeMode themeMode;

  const ChangeAppThemeSuccessState({required this.themeMode});
}
