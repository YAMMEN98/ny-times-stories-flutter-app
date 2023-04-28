import 'package:dio/dio.dart';
import 'package:ny_times_stories_app_flutter/src/core/common_feature/domain/entities/api_response_model.dart';
import 'package:ny_times_stories_app_flutter/src/core/network/error/dio_error_handler.dart';
import 'package:ny_times_stories_app_flutter/src/core/network/error/exceptions.dart';
import 'package:ny_times_stories_app_flutter/src/features/ny_times_stories/data/data_sources/general_api.dart';
import 'package:ny_times_stories_app_flutter/src/features/ny_times_stories/domain/usecases/ny_times_stories_usecase.dart';

class NyTimesStoriesApi extends GeneralApi {
  final Dio dio;

  CancelToken cancelToken = CancelToken();

  NyTimesStoriesApi(this.dio);

  /// NyTimes method
  @override
  Future<ApiResponse<List<String>>> getNyTimesData(
      NyTimesStoriesParams params) async {
    try {
      final result = (await dio.get(""));
      if (result.data == null) {
        throw ServerException("Unknown Error", result.statusCode);
      }

      return ApiResponse.fromJson<List<String>>(
        {},
        () {},
      );
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
