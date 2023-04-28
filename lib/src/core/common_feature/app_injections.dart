import 'package:ny_times_stories_app_flutter/src/core/util/injections.dart';

import 'data/data_sources/app_shared_prefs.dart';

initAppInjections() {
  sl.registerFactory<AppSharedPrefs>(() => AppSharedPrefs(sl()));
}
