import 'package:dio/dio.dart';
import 'package:stories_app_flutter/src/core/common_feature/data/entities/api_response_model.dart';
import 'package:stories_app_flutter/src/core/util/constant/network_constant.dart';
import 'package:stories_app_flutter/src/features/ny_times_stories/data/entities/story_model.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: apiUrl)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("{section}.json?api-key=$apiKey")
  Future<ApiResponse<List<StoryModel>>> getStories(
      @Path() String section);
}

// StoryModel.fromJsonList
// final value = ApiResponse<List<StoryModel>>.fromJson(_result.data!, StoryModel.fromJsonList);
// final httpResponse = HttpResponse<ApiResponse<List<StoryModel>>>(value, _result);
// return httpResponse;
