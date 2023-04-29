import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ny_times_stories_app_flutter/src/features/ny_times_stories/data/entities/section_story_enum.dart';

part 'stories_section_state.freezed.dart';

@freezed
abstract class StoriesSectionState with _$StoriesSectionState {
  const factory StoriesSectionState.initial() = Initial;
  const factory StoriesSectionState.changedStorySection(StorySectionEnum sectionStoryEnum) = ChangedStorySection;
}
