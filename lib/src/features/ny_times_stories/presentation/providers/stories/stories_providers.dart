import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ny_times_stories_app_flutter/src/core/util/injections.dart';
import 'package:ny_times_stories_app_flutter/src/features/ny_times_stories/domain/usecases/stories_usecase.dart';
import 'package:ny_times_stories_app_flutter/src/features/ny_times_stories/presentation/providers/stories/state/stories_notifier.dart';
import 'package:ny_times_stories_app_flutter/src/features/ny_times_stories/presentation/providers/stories/state/stories_state.dart';

final storiesStateNotifierProvider =
    StateNotifierProvider<StoriesNotifier, StoriesState>(
  (ref) {
    return StoriesNotifier(storiesUseCase: sl<StoriesUseCase>());
  },
);
