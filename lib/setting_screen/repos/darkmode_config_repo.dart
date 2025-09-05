import 'package:shared_preferences/shared_preferences.dart';

class DarkModeConfigRepo {
  final SharedPreferences _preferences;

  DarkModeConfigRepo(this._preferences);

  Future<void> setDarkModeConfig(bool isDarkMode) async {
    await _preferences.setBool('isDarkMode', isDarkMode);
  }

  bool get isDarkMode => _preferences.getBool('isDarkMode') ?? false;
}
