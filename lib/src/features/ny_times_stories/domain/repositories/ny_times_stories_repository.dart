import 'package:dartz/dartz.dart';
import 'package:ny_times_stories_app_flutter/src/core/network/error/failures.dart';
import 'package:ny_times_stories_app_flutter/src/features/ny_times_stories/data/entities/story_model.dart';
import 'package:ny_times_stories_app_flutter/src/features/ny_times_stories/domain/usecases/ny_times_stories_usecase.dart';

abstract class NyTimesStoriesRepository {
  // Gent Ny Times Stories
  Future<Either<Failure, List<StoryModel>>> getNyTimesStories(
      StoriesParams params);
}
