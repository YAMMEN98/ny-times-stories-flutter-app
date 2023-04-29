import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ny_times_stories_app_flutter/src/features/ny_times_stories/data/entities/section_story_enum.dart';

part 'stories_state.freezed.dart';

@freezed
abstract class StoriesState with _$StoriesState {
  const factory StoriesState.initial() = Initial;
  const factory StoriesState.loading() = Loading;
  const factory StoriesState.failure(String error) = Failure;
  const factory StoriesState.success() = Success;
}
