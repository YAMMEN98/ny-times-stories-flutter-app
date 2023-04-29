import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ny_times_stories_app_flutter/src/core/common_feature/data/entities/api_response_model.dart';
import 'package:ny_times_stories_app_flutter/src/core/network/error/exceptions.dart';
import 'package:ny_times_stories_app_flutter/src/core/network/rest_client.dart';
import 'package:ny_times_stories_app_flutter/src/features/ny_times_stories/data/data_sources/stories_api.dart';
import 'package:ny_times_stories_app_flutter/src/features/ny_times_stories/domain/usecases/stories_usecase.dart';

import 'mock_data/mock_stories_data.dart';
import 'stories_api_test.mocks.dart';

@GenerateMocks([RestClient, Dio, HttpClientAdapter])
void main() {
  StoriesParams params = StoriesParams("home");
  late MockRestClient mockRestClient;
  late MockDio mockDio;
  late MockHttpClientAdapter mockHttpClientAdapter;
  late StoriesApi storiesApi;
  setUp(() {
    mockRestClient = MockRestClient();
    mockDio = MockDio();
    mockHttpClientAdapter = MockHttpClientAdapter();
    mockDio.httpClientAdapter = mockHttpClientAdapter;
    storiesApi = StoriesApi(mockRestClient);
  });

  group("Test stories_api", () {
    test("Get All Stories Failed Case", () async {
      when(mockRestClient.getStories(params.section))
          .thenAnswer((realInvocation) async {
        return ApiResponse();
      });
      var result;
      try {
        result = await storiesApi.getStories(params.section);
      } catch (e) {
        result = e;
      }
      expect(result, ServerException("Unknown Error", null));
    });

    test("Get All Stories Empty Case", () async {
      when(mockRestClient.getStories(params.section))
          .thenAnswer((realInvocation) async {
        return mockEmptyListData;
      });
      var result;
      try {
        result = await storiesApi.getStories(params.section);
      } catch (e) {
        result = e;
      }

      expect(result, mockEmptyListData);
    });


    test("Get All Stories Success Case", () async {
      when(mockRestClient.getStories(params.section)).thenAnswer((realInvocation) async {
        return mockListData;
      });
      var result;
      try {
        result = await storiesApi.getStories(params.section);
      } catch (e) {
        result = e;
      }

      expect(result, mockListData);
    });
  });
}
