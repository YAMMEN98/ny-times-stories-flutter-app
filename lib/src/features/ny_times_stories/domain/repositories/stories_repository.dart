import 'package:dartz/dartz.dart';
import 'package:stories_app_flutter/src/core/network/error/failures.dart';
import 'package:stories_app_flutter/src/features/ny_times_stories/data/entities/story_model.dart';
import 'package:stories_app_flutter/src/features/ny_times_stories/domain/usecases/stories_usecase.dart';

abstract class StoriesRepository {
  // Gent Ny Times Stories
  Future<Either<Failure, List<StoryModel>>> getNyTimesStories(
      StoriesParams params);
}
