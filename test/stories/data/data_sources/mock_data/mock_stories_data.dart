
import 'package:stories_app_flutter/src/core/common_feature/data/entities/api_response_model.dart';
import 'package:stories_app_flutter/src/features/ny_times_stories/data/entities/story_model.dart';

ApiResponse<List<StoryModel>> mockEmptyListData = ApiResponse(
  status: "OK",
  copyright:
      "Copyright (c) 2023 The New York Times Company.  All Rights Reserved.",
  section: "Health",
  last_updated: "2023-04-28T18:18:03-04:00",
  numResults: 20,
  results: [],
);

ApiResponse<List<StoryModel>> mockListData = ApiResponse(
  status: "OK",
  copyright:
      "Copyright (c) 2023 The New York Times Company.  All Rights Reserved.",
  section: "Health",
  last_updated: "2023-04-28T18:18:03-04:00",
  numResults: 20,
  results: [
    StoryModel(
      section: "Health",
    ),
  ],
);
