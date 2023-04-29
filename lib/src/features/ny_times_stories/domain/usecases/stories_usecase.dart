import 'package:dartz/dartz.dart';
import 'package:stories_app_flutter/src/core/network/error/failures.dart';
import 'package:stories_app_flutter/src/core/util/usecases/usecase.dart';
import 'package:stories_app_flutter/src/features/ny_times_stories/data/entities/story_model.dart';
import 'package:stories_app_flutter/src/features/ny_times_stories/domain/repositories/stories_repository.dart';

class StoriesUseCase extends UseCase<List<StoryModel>, StoriesParams> {
  final StoriesRepository repository;

  StoriesUseCase(this.repository);

  @override
  Future<Either<Failure, List<StoryModel>>> call(StoriesParams params) async {
    final result = await repository.getNyTimesStories(params);
    return result.fold((l) {
      return Left(l);
    }, (r) async {
      return Right(r);
    });
  }
}

class StoriesParams {
  final String section;

  StoriesParams(this.section);
}
