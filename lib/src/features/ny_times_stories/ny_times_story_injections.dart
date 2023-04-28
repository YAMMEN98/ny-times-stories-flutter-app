import 'package:ny_times_stories_app_flutter/src/core/network/dio_network.dart';
import 'package:ny_times_stories_app_flutter/src/core/util/injections.dart';
import 'package:ny_times_stories_app_flutter/src/features/ny_times_stories/data/data_sources/ny_times_stories_api.dart';

import 'data/data_sources/ny_times_stories_shared_prefs.dart';
import 'data/repositories/ny_times_stories_repo_empl.dart';
import 'domain/repositories/ny_times_stories_repository.dart';
import 'domain/usecases/ny_times_stories_usecase.dart';

initNyTimesStoriesInjections() {
  sl.registerFactory<NyTimesStoriesApi>(
      () => NyTimesStoriesApi(DioNetwork.appAPI));
  sl.registerFactory<NyTimesStoriesSharedPrefs>(
      () => NyTimesStoriesSharedPrefs(sl()));
  sl.registerFactory<NyTimesStoriesUseCase>(
      () => NyTimesStoriesUseCase(sl()));
  sl.registerFactory<NyTimesStoriesRepository>(
      () => NyTimesStoriesRepositoryImpl(sl()));
}
