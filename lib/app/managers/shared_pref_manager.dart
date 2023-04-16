part of app_layer;

enum SharedPreferenceKey {
  appThemeMode,
}

class SharedPreferencesManager {
  static SharedPreferencesManager? _instance;
  static SharedPreferences? _sharedPreferences;

  static Future<SharedPreferencesManager?> getInstance() async {
    _instance ??= SharedPreferencesManager();
    _sharedPreferences ??= await SharedPreferences.getInstance();

    return _instance;
  }

  Future<void> putInt(SharedPreferenceKey key, int value) =>
      _sharedPreferences!.setInt(key.name, value);

  int? getInt(SharedPreferenceKey key) => _sharedPreferences!.getInt(key.name);
}
