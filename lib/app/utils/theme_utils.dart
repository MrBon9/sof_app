part of app_layer;

class ThemeUtils {
  static int? get appThemeMode {
    return getIt
        .get<SharedPreferencesManager>()
        .getInt(SharedPreferenceKey.appThemeMode);
  }

  static void saveAppThemeMode({
    required int appThemeModeIndex,
  }) {
    getIt.get<SharedPreferencesManager>().putInt(
          SharedPreferenceKey.appThemeMode,
          appThemeModeIndex,
        );
  }
}
