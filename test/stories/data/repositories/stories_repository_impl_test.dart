import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ny_times_stories_app_flutter/src/core/common_feature/data/entities/api_response_model.dart';
import 'package:ny_times_stories_app_flutter/src/features/ny_times_stories/data/data_sources/stories_api.dart';
import 'package:ny_times_stories_app_flutter/src/features/ny_times_stories/data/entities/story_model.dart';
import 'package:ny_times_stories_app_flutter/src/features/ny_times_stories/data/repositories/stories_repo_empl.dart';
import 'package:ny_times_stories_app_flutter/src/features/ny_times_stories/domain/repositories/stories_repository.dart';
import 'package:ny_times_stories_app_flutter/src/features/ny_times_stories/domain/usecases/stories_usecase.dart';

import 'mock_data/mock_stories_data.dart';
import 'stories_repository_impl_test.mocks.dart';

@GenerateMocks([StoriesApi])
void main() {
  StoriesParams params = StoriesParams("health");
  late MockStoriesApi mockStoriesApi;
  late StoriesRepository storiesRepository;
  setUp(() {
    mockStoriesApi = MockStoriesApi();
    storiesRepository = StoriesRepositoryImpl(mockStoriesApi);
  });

  group("Test ny_times_stories_repository_impl", () {
    test(
        "Get All Stories Success Case With Empty Or Null Api response And Return Empty List",
        () async {
      when(mockStoriesApi.getStories(params.section))
          .thenAnswer((realInvocation) async {
        return ApiResponse(
          status: null,
          copyright: null,
          numResults: null,
          results: null,
        );
      });
      var result;
      try {
        result = await storiesRepository.getNyTimesStories(params);
      } catch (e) {
        result = e;
      }
      expect(result.value, mockNyTimesEmptyListData.value);
    });

    test("Get All Stories Success Case With Non Empty Or Null Api response",
        () async {
      when(mockStoriesApi.getStories(params.section))
          .thenAnswer((realInvocation) async {
        return ApiResponse(
          status: null,
          copyright: null,
          numResults: null,
          results: [
            StoryModel(section: "health"),
            StoryModel(section: "home"),
          ],
        );
      });
      var result;
      try {
        result = await storiesRepository.getNyTimesStories(params);
      } catch (e) {
        result = e;
      }
      expect(result.value, mockNyTimesListData.value);
    });
  });
}
