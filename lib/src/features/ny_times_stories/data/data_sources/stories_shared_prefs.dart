import 'package:shared_preferences/shared_preferences.dart';

class StoriesSharedPrefs {
  final SharedPreferences _preferences;

  StoriesSharedPrefs(this._preferences);

  /// __________ Clear Storage __________ ///
  Future<bool> clearAllLocalData() async {
    return true;
  }
}
