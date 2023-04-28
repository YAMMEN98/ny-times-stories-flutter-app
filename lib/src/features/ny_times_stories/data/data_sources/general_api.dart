import 'package:ny_times_stories_app_flutter/src/core/common_feature/domain/entities/api_response_model.dart';
import 'package:ny_times_stories_app_flutter/src/features/ny_times_stories/domain/usecases/ny_times_stories_usecase.dart';

abstract class GeneralApi {
  // Get all ny times stories
  Future<ApiResponse<List<String>>> getNyTimesData(
      NyTimesStoriesParams params);
}
