import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ny_times_stories_app_flutter/src/core/util/helper/helper_ui.dart';
import 'package:ny_times_stories_app_flutter/src/features/ny_times_stories/data/entities/story_model.dart';
import 'package:ny_times_stories_app_flutter/src/features/ny_times_stories/domain/usecases/stories_usecase.dart';
import 'package:ny_times_stories_app_flutter/src/features/ny_times_stories/presentation/providers/stories/state/stories_state.dart';

class StoriesNotifier extends StateNotifier<StoriesState> {
  final StoriesUseCase storiesUseCase;

  // All stories result
  List<StoryModel> allStories = [];

  StoriesNotifier({
    required this.storiesUseCase,
  }) : super(const StoriesState.initial());

  // Get Stories
  Future<void> getStories(StoriesParams params, {String? text}) async {
    // Loading state
    state = const StoriesState.loading();

    final response = await storiesUseCase.call(params);

    state = await response.fold(
      (failure) {
        return StoriesState.failure(failure.errorMessage);
      },
      (stories) async {
        allStories = stories;
        return StoriesState.success(HelperUi.runFilter(text ?? "", allStories));
      },
    );
  }

  // Get Stories
  Future<void> getSearchedStories(String text) async {
    // Loading state
    state = const StoriesState.loading();

    state = StoriesState.success(HelperUi.runFilter(text, allStories));
  }
}
