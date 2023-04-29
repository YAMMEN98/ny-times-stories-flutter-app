import 'package:ny_times_stories_app_flutter/src/core/network/dio_network.dart';
import 'package:ny_times_stories_app_flutter/src/core/network/rest_client.dart';
import 'package:ny_times_stories_app_flutter/src/core/util/injections.dart';
import 'package:ny_times_stories_app_flutter/src/features/ny_times_stories/data/data_sources/stories_api.dart';

import 'data/data_sources/stories_shared_prefs.dart';
import 'data/repositories/stories_repo_empl.dart';
import 'domain/repositories/stories_repository.dart';
import 'domain/usecases/stories_usecase.dart';

initStoriesInjections() {
  sl.registerFactory<StoriesApi>(
      () => StoriesApi(RestClient(DioNetwork.appAPI)));
  sl.registerFactory<StoriesSharedPrefs>(
      () => StoriesSharedPrefs(sl()));
  sl.registerFactory<StoriesUseCase>(() => StoriesUseCase(sl()));
  sl.registerFactory<StoriesRepository>(
      () => StoriesRepositoryImpl(sl()));
}
