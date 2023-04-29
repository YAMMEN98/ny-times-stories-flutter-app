import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ny_times_stories_app_flutter/src/features/ny_times_stories/presentation/providers/search/state/search_notifier.dart';
import 'package:ny_times_stories_app_flutter/src/features/ny_times_stories/presentation/providers/search/state/search_state.dart';

final searchStateNotifierProvider =
    StateNotifierProvider<SearchNotifier, SearchState>(
  (ref) {
    return SearchNotifier();
  },
);
