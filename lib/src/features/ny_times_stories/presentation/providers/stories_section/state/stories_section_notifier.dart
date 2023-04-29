import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ny_times_stories_app_flutter/src/features/ny_times_stories/data/entities/section_story_enum.dart';
import 'package:ny_times_stories_app_flutter/src/features/ny_times_stories/presentation/providers/stories_section/state/stories_section_state.dart';

class StoriesSectionNotifier extends StateNotifier<StoriesSectionState> {

  StoriesSectionNotifier() : super(const StoriesSectionState.initial());

  // Change stories section
  Future<void> changeStoriesSection(StorySectionEnum storySectionEnum) async {
    // Loading state
    state = StoriesSectionState.changedStorySection(storySectionEnum);
  }
}
