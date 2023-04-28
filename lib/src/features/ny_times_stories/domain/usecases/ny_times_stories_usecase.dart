import 'package:dartz/dartz.dart';
import 'package:ny_times_stories_app_flutter/src/core/network/error/failures.dart';
import 'package:ny_times_stories_app_flutter/src/core/util/usecases/usecase.dart';
import 'package:ny_times_stories_app_flutter/src/features/ny_times_stories/domain/repositories/ny_times_stories_repository.dart';

class NyTimesStoriesUseCase
    extends UseCase<List<String>, NyTimesStoriesParams> {
  final NyTimesStoriesRepository repository;

  NyTimesStoriesUseCase(this.repository);

  @override
  Future<Either<Failure, List<String>>> call(
      NyTimesStoriesParams params) async {
    final result = await repository.getNyTimesStories(params);
    return result.fold((l) {
      return Left(l);
    }, (r) async {
      return Right(r);
    });
  }
}

class NyTimesStoriesParams {

}
