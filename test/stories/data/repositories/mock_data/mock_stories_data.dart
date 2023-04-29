import 'package:dartz/dartz.dart';
import 'package:stories_app_flutter/src/features/ny_times_stories/data/entities/story_model.dart';
import 'package:stories_app_flutter/src/features/ny_times_stories/presentation/providers/stories/state/stories_state.dart';

Right<Failure, List<StoryModel>> mockNyTimesEmptyListData =
    Right(<StoryModel>[]);

Right<Failure, List<StoryModel>> mockNyTimesListData = Right(
  <StoryModel>[
    StoryModel(
      section: "health",
    ),
    StoryModel(
      section: "home",
    ),
  ],
);
