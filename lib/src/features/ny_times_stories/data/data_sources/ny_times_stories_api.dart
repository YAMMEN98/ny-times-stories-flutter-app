import 'package:dio/dio.dart';
import 'package:ny_times_stories_app_flutter/src/core/common_feature/data/entities/api_response_model.dart';
import 'package:ny_times_stories_app_flutter/src/core/network/error/dio_error_handler.dart';
import 'package:ny_times_stories_app_flutter/src/core/network/error/exceptions.dart';
import 'package:ny_times_stories_app_flutter/src/core/network/rest_client.dart';
import 'package:ny_times_stories_app_flutter/src/features/ny_times_stories/data/entities/story_model.dart';

class NyTimesStoriesApi {
  final RestClient restClient;

  CancelToken cancelToken = CancelToken();

  NyTimesStoriesApi(this.restClient);

  /// NyTimes method
  Future<ApiResponse<List<StoryModel>>> getNyTimesData(String section) async {
    try {
      final result = (await restClient.getStories(section));
      if (result.data.results == null) {
        throw ServerException("Unknown Error", result.response.statusCode);
      }

      return result.data;
    } on DioError catch (e) {
      if (e.type == DioErrorType.cancel) {
        throw CancelTokenException(handleDioError(e), e.response?.statusCode);
      } else {
        throw ServerException(handleDioError(e), e.response?.statusCode);
      }
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(e.toString(), null);
    }
  }
}
