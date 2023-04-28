import 'package:get_it/get_it.dart';
import 'package:ny_times_stories_app_flutter/src/core/network/dio_network.dart';
import 'package:ny_times_stories_app_flutter/src/core/util/log/app_logger.dart';
import 'package:ny_times_stories_app_flutter/src/features/ny_times_stories/ny_times_story_injections.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../common_feature/app_injections.dart';

final sl = GetIt.instance;

Future<void> initInjections() async {
  await initSharedPrefsInjections();
  await initAppInjections();
  await initCoreInjections();
  await initNyTimesStoriesInjections();
}

initSharedPrefsInjections() async {
  sl.registerSingletonAsync<SharedPreferences>(() async {
    return await SharedPreferences.getInstance();
  });
  await sl.isReady<SharedPreferences>();
}

Future<void> initCoreInjections() async {
  initRootLogger();
  DioNetwork.initDio();
}
