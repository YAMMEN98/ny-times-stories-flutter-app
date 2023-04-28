import 'package:dartz/dartz.dart';
import 'package:ny_times_stories_app_flutter/src/core/network/error/exceptions.dart';
import 'package:ny_times_stories_app_flutter/src/core/network/error/failures.dart';
import 'package:ny_times_stories_app_flutter/src/features/ny_times_stories/data/data_sources/ny_times_stories_api.dart';
import 'package:ny_times_stories_app_flutter/src/features/ny_times_stories/data/entities/story_model.dart';
import 'package:ny_times_stories_app_flutter/src/features/ny_times_stories/domain/repositories/ny_times_stories_repository.dart';
import 'package:ny_times_stories_app_flutter/src/features/ny_times_stories/domain/usecases/ny_times_stories_usecase.dart';

class NyTimesStoriesRepositoryImpl extends NyTimesStoriesRepository {
  final NyTimesStoriesApi nyTimesApi;

  NyTimesStoriesRepositoryImpl(this.nyTimesApi);

  @override
  Future<Either<Failure, List<StoryModel>>> getNyTimesStories(
      NyTimesStoriesParams params) async {
    try {
      final result = await nyTimesApi.getNyTimesData(params.section);
      return Right(result.results ?? []);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    } on CancelTokenException catch (e) {
      return Left(CancelTokenFailure(e.message, e.statusCode));
    }
  }
}
