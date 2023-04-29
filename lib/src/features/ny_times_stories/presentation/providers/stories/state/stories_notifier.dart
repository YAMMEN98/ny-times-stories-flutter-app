import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ny_times_stories_app_flutter/src/features/ny_times_stories/data/entities/section_story_enum.dart';
import 'package:ny_times_stories_app_flutter/src/features/ny_times_stories/domain/usecases/ny_times_stories_usecase.dart';
import 'package:ny_times_stories_app_flutter/src/features/ny_times_stories/presentation/providers/stories/state/stories_state.dart';

class StoriesNotifier extends StateNotifier<StoriesState> {
  final StoriesUseCase storiesUseCase;

  StoriesNotifier({
    required this.storiesUseCase,
  }) : super(const StoriesState.initial());

  // Get Stories
  Future<void> getStories(StoriesParams params) async {
    // Loading state
    state = const StoriesState.loading();

    final response = await storiesUseCase.call(params);

    state = await response.fold(
          (failure) {
        return StoriesState.failure(failure.errorMessage);
      },
          (stories) async {
        return const StoriesState.success();
      },
    );
  }


}
