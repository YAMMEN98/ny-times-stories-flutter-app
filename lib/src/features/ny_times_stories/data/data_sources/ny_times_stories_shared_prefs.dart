import 'package:shared_preferences/shared_preferences.dart';

class NyTimesStoriesSharedPrefs {
  final SharedPreferences _preferences;

  NyTimesStoriesSharedPrefs(this._preferences);

  /// __________ Clear Storage __________ ///
  Future<bool> clearAllLocalData() async {
    return true;
  }
}
