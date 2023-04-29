import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ny_times_stories_app_flutter/src/features/ny_times_stories/presentation/providers/search/state/search_state.dart';

class SearchNotifier extends StateNotifier<SearchState> {
  SearchNotifier() : super(const SearchState.initial());

  // Open search
  Future<void> openSearch() async {
    state = SearchState.openSearch();
  }

  // Close search
  Future<void> closeSearch() async {
    state = SearchState.closeSearch();
  }
}
